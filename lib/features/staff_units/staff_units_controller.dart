import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mastercolor_api/mastercolor_api.dart';

import '../../core/pagination/paged_state.dart';
import 'staff_units_repository.dart';

/// Lista paginada de unidades (staff), con búsqueda por número de serie y
/// scroll infinito.
class StaffUnitsController extends AsyncNotifier<PagedState<SoldUnit>> {
  String? _serial;

  String? get serial => _serial;

  @override
  Future<PagedState<SoldUnit>> build() => _firstPage();

  Future<PagedState<SoldUnit>> _firstPage() async {
    final res = await ref.read(staffUnitsRepositoryProvider).list(
          page: 1,
          serialNumber: _serial,
        );
    return PagedState(
      items: res.items,
      page: res.currentPage,
      lastPage: res.lastPage,
    );
  }

  /// Filtra por número de serie y recarga.
  Future<void> setSerial(String? serial) async {
    final normalized =
        (serial == null || serial.trim().isEmpty) ? null : serial.trim();
    if (_serial == normalized) return;
    _serial = normalized;
    await refresh();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_firstPage);
  }

  Future<void> loadMore() async {
    final current = state.asData?.value;
    if (current == null || !current.hasMore || current.isLoadingMore) return;

    state = AsyncData(current.copyWith(isLoadingMore: true));
    try {
      final res = await ref.read(staffUnitsRepositoryProvider).list(
            page: current.page + 1,
            serialNumber: _serial,
          );
      state = AsyncData(current.copyWith(
        items: [...current.items, ...res.items],
        page: res.currentPage,
        lastPage: res.lastPage,
        isLoadingMore: false,
      ));
    } catch (_) {
      state = AsyncData(current.copyWith(isLoadingMore: false));
    }
  }
}

final staffUnitsControllerProvider =
    AsyncNotifierProvider<StaffUnitsController, PagedState<SoldUnit>>(
        StaffUnitsController.new);

/// Detalle de una unidad para staff (one-shot, auto-dispose).
final staffUnitDetailProvider =
    FutureProvider.autoDispose.family<SoldUnitDetail, int>((ref, id) {
  return ref.watch(staffUnitsRepositoryProvider).detail(id);
});
