import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mastercolor_api/mastercolor_api.dart';

import '../../core/network/api_exception.dart';
import '../../core/network/mastercolor_api_provider.dart';

/// Acceso a las direcciones del cliente (`GET /client/addresses`).
///
/// El contrato solo expone la lectura; alta/edición de direcciones no están en
/// la API, así que la app únicamente las lista (p. ej. para elegir a dónde va
/// el técnico al crear un ticket a domicilio).
class AddressesRepository {
  AddressesRepository(this._api);

  final MastercolorApi _api;

  Future<List<Address>> list() async {
    try {
      final res = await _api.getClienteDireccionesApi().clientAddressesGet();
      return res.data?.data ?? const [];
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }
}

final addressesRepositoryProvider = Provider<AddressesRepository>((ref) {
  return AddressesRepository(ref.watch(mastercolorApiProvider));
});

/// Direcciones del cliente para selección (se cachea por sesión; refrescar con
/// `ref.invalidate`).
final clientAddressesProvider = FutureProvider<List<Address>>((ref) {
  return ref.watch(addressesRepositoryProvider).list();
});
