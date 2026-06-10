import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mastercolor_api/mastercolor_api.dart';

import '../../core/auth/auth_controller.dart';
import '../../core/network/api_exception.dart';
import '../../core/network/mastercolor_api_provider.dart';
import '../../core/pagination/paged_state.dart';

/// Acceso a las unidades vendidas del cliente sobre el cliente OpenAPI generado.
///
/// Traduce los [DioException] del cliente generado a [ApiException] para que la
/// UI tenga un único tipo de error que mostrar, y desenvuelve el envelope
/// `{success,data,errors}` devolviendo directamente el `data`.
class UnitsRepository {
  UnitsRepository(this._api, this._dio);

  final MastercolorApi _api;
  final Dio _dio;

  ClienteUnidadesApi get _units => _api.getClienteUnidadesApi();

  /// Página de mis unidades vendidas (incluye metadatos de paginación).
  Future<PageResult<SoldUnit>> list({
    int page = 1,
    int perPage = 15,
    SoldUnitStatus? status,
    String? warranty,
  }) async {
    try {
      final res = await _units.clientUnitsGet(
        page: page,
        perPage: perPage,
        status: status,
        warranty: warranty,
      );
      final body = res.data;
      return PageResult(
        items: body?.data ?? const [],
        currentPage: body?.pagination?.currentPage ?? page,
        lastPage: body?.pagination?.lastPage ?? page,
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  /// Detalle de una unidad (incluye garantía y tickets asociados).
  Future<SoldUnitDetail> detail(int id) async {
    try {
      final res = await _units.clientUnitsIdGet(id: id);
      final unit = res.data?.data;
      if (unit == null) {
        throw ApiException('No se encontró la unidad.', statusCode: 404);
      }
      return unit;
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  /// Estado de garantía de una unidad.
  Future<Warranty> warranty(int id) async {
    try {
      final res = await _units.clientUnitsIdWarrantyGet(id: id);
      final warranty = res.data?.data;
      if (warranty == null) {
        throw ApiException('Sin información de garantía.', statusCode: 404);
      }
      return warranty;
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  /// Busca productos del catálogo MasterColor para el registro manual.
  Future<List<ClientProduct>> searchProducts({String? search}) async {
    try {
      final res = await _api.getClienteProductosApi().clientProductsGet(
            search: search,
            perPage: 30,
          );
      return res.data?.data ?? const [];
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  /// Registra manualmente una unidad (producto MasterColor comprado fuera del
  /// canal online). El comprobante y el número de serie son opcionales.
  ///
  /// Usa el [Dio] autenticado directamente (en vez del método generado) para
  /// enviar `purchase_date` como `yyyy-MM-dd` y evitar el formateo con hora que
  /// produciría un `DateTime` dentro del FormData.
  Future<void> registerUnit({
    required int productId,
    required DateTime purchaseDate,
    String? serialNumber,
    XFile? proofFile,
  }) async {
    try {
      final form = FormData.fromMap({
        'product_id': productId,
        'purchase_date': DateFormat('yyyy-MM-dd').format(purchaseDate),
        if (serialNumber != null && serialNumber.trim().isNotEmpty)
          'serial_number': serialNumber.trim(),
        if (proofFile != null)
          'proof_file':
              await MultipartFile.fromFile(proofFile.path, filename: proofFile.name),
      });
      await _dio.post<dynamic>('/client/units', data: form);
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }
}

final unitsRepositoryProvider = Provider<UnitsRepository>((ref) {
  return UnitsRepository(
    ref.watch(mastercolorApiProvider),
    ref.watch(apiClientProvider).dio,
  );
});
