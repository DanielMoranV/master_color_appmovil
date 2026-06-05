import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mastercolor_api/mastercolor_api.dart';

import '../auth/auth_controller.dart';

/// Cliente generado desde el contrato OpenAPI (`packages/mastercolor_api`),
/// construido sobre el [Dio] autenticado de la app para que TODAS las llamadas
/// generadas hereden los interceptores de auth (Bearer) y refresh 401.
///
/// Uso:
///   final units = await ref.read(mastercolorApiProvider)
///       .getClienteUnidadesApi()
///       .clientUnitsGet();
final mastercolorApiProvider = Provider<MastercolorApi>((ref) {
  final dio = ref.watch(apiClientProvider).dio;
  // `interceptors: []` evita que el generado añada los suyos (OAuth/Basic/...);
  // la auth la maneja nuestro ApiClient sobre el mismo Dio.
  return MastercolorApi(dio: dio, interceptors: const []);
});
