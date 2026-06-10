import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mastercolor_api/mastercolor_api.dart';

import '../../core/network/api_exception.dart';
import '../../core/network/mastercolor_api_provider.dart';

/// Indicadores del área de soporte (solo staff): `GET /support/metrics`.
class MetricsRepository {
  MetricsRepository(this._api);

  final MastercolorApi _api;

  /// Métricas de soporte, opcionalmente acotadas a un rango de fechas.
  Future<SupportMetrics> fetch({DateTime? from, DateTime? to}) async {
    try {
      final res = await _api.getStaffMtricasApi().supportMetricsGet(
            dateFrom: from,
            dateTo: to,
          );
      final metrics = res.data?.data;
      if (metrics == null) {
        throw ApiException('Sin métricas disponibles.', statusCode: 404);
      }
      return metrics;
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }
}

final metricsRepositoryProvider = Provider<MetricsRepository>((ref) {
  return MetricsRepository(ref.watch(mastercolorApiProvider));
});
