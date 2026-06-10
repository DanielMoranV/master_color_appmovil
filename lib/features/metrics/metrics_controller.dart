import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mastercolor_api/mastercolor_api.dart';

import 'metrics_repository.dart';

/// Dashboard de métricas de soporte, con rango de fechas opcional.
class MetricsController extends AsyncNotifier<SupportMetrics> {
  DateTime? _from;
  DateTime? _to;

  DateTime? get from => _from;
  DateTime? get to => _to;

  @override
  Future<SupportMetrics> build() {
    return ref.read(metricsRepositoryProvider).fetch(from: _from, to: _to);
  }

  /// Aplica un rango de fechas (null = sin acotar) y recarga.
  Future<void> setRange({DateTime? from, DateTime? to}) async {
    _from = from;
    _to = to;
    await refresh();
  }

  /// Recarga con el rango actual (pull-to-refresh).
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(metricsRepositoryProvider).fetch(from: _from, to: _to),
    );
  }
}

final metricsControllerProvider =
    AsyncNotifierProvider<MetricsController, SupportMetrics>(
        MetricsController.new);
