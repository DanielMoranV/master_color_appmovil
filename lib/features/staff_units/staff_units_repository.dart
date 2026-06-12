import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mastercolor_api/mastercolor_api.dart';

import '../../core/network/api_exception.dart';
import '../../core/network/mastercolor_api_provider.dart';
import '../../core/pagination/paged_state.dart';

/// Gestión de unidades por parte del staff: listar (con filtros), ver detalle y
/// editar (número de serie y estado). Sobre `StaffUnidadesApi`.
class StaffUnitsRepository {
  StaffUnitsRepository(this._api);

  final MastercolorApi _api;

  StaffUnidadesApi get _units => _api.getStaffUnidadesApi();

  /// Página de unidades, opcionalmente filtrada por número de serie / cliente /
  /// producto.
  Future<PageResult<SoldUnit>> list({
    int page = 1,
    String? serialNumber,
    int? clientId,
    int? productId,
  }) async {
    try {
      final res = await _units.supportUnitsGet(
        page: page,
        serialNumber: serialNumber,
        clientId: clientId,
        productId: productId,
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

  /// Detalle de una unidad (incluye garantía y tickets).
  Future<SoldUnitDetail> detail(int id) async {
    try {
      final res = await _units.supportUnitsIdGet(id: id);
      final unit = res.data?.data;
      if (unit == null) {
        throw ApiException('No se encontró la unidad.', statusCode: 404);
      }
      return unit;
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  /// Edita el número de serie y/o el estado de una unidad.
  Future<void> update({
    required int id,
    String? serialNumber,
    SoldUnitStatus? status,
  }) async {
    try {
      await _units.supportUnitsIdPatch(
        id: id,
        supportUnitsIdPatchRequest: SupportUnitsIdPatchRequest(
          serialNumber: serialNumber,
          status: status,
        ),
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  /// Historial de servicio de la unidad: línea de tiempo de eventos
  /// (ticket_opened, visit, resolved), del más reciente al más antiguo.
  Future<SupportUnitsIdHistoryGet200ResponseAllOfData> history(int id) async {
    try {
      final res = await _units.supportUnitsIdHistoryGet(id: id);
      final data = res.data?.data;
      if (data == null) {
        throw ApiException('Sin historial para la unidad.', statusCode: 404);
      }
      return data;
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }
}

final staffUnitsRepositoryProvider = Provider<StaffUnitsRepository>((ref) {
  return StaffUnitsRepository(ref.watch(mastercolorApiProvider));
});

/// Historial de servicio de una unidad (solo staff), por id.
final unitHistoryProvider = FutureProvider.autoDispose
    .family<SupportUnitsIdHistoryGet200ResponseAllOfData, int>((ref, id) {
  return ref.watch(staffUnitsRepositoryProvider).history(id);
});
