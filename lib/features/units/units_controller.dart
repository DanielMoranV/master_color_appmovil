import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mastercolor_api/mastercolor_api.dart';

import '../../core/pagination/paged_state.dart';
import 'units_repository.dart';

/// Lista paginada de unidades del cliente, con filtro opcional por estado y
/// scroll infinito (`loadMore`).
class UnitsController extends AsyncNotifier<PagedState<SoldUnit>> {
  SoldUnitStatus? _status;
  String? _warranty; // 'vigente' | 'vencida' | null

  /// Estado por el que se está filtrando actualmente (null = todos).
  SoldUnitStatus? get status => _status;

  /// Filtro de garantía activo (null = todas).
  String? get warranty => _warranty;

  @override
  Future<PagedState<SoldUnit>> build() => _firstPage();

  Future<PagedState<SoldUnit>> _firstPage() async {
    final res = await ref.read(unitsRepositoryProvider).list(
          page: 1,
          status: _status,
          warranty: _warranty,
        );
    return PagedState(
      items: res.items,
      page: res.currentPage,
      lastPage: res.lastPage,
    );
  }

  /// Cambia el filtro de estado y recarga desde la primera página.
  Future<void> setFilter(SoldUnitStatus? status) async {
    if (_status == status) return;
    _status = status;
    await refresh();
  }

  /// Cambia el filtro de garantía (`vigente`/`vencida`/null) y recarga.
  Future<void> setWarranty(String? warranty) async {
    if (_warranty == warranty) return;
    _warranty = warranty;
    await refresh();
  }

  /// Recarga desde la primera página con el filtro actual (pull-to-refresh).
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_firstPage);
  }

  /// Carga la siguiente página y la agrega a la lista (scroll infinito).
  Future<void> loadMore() async {
    final current = state.asData?.value;
    if (current == null || !current.hasMore || current.isLoadingMore) return;

    state = AsyncData(current.copyWith(isLoadingMore: true));
    try {
      final res = await ref.read(unitsRepositoryProvider).list(
            page: current.page + 1,
            status: _status,
            warranty: _warranty,
          );
      state = AsyncData(current.copyWith(
        items: [...current.items, ...res.items],
        page: res.currentPage,
        lastPage: res.lastPage,
        isLoadingMore: false,
      ));
    } catch (_) {
      // Si falla la página siguiente, mantenemos lo ya cargado.
      state = AsyncData(current.copyWith(isLoadingMore: false));
    }
  }
}

final unitsControllerProvider =
    AsyncNotifierProvider<UnitsController, PagedState<SoldUnit>>(
        UnitsController.new);

/// Detalle de una unidad (one-shot, auto-dispose).
final unitDetailProvider =
    FutureProvider.autoDispose.family<SoldUnitDetail, int>((ref, id) {
  return ref.watch(unitsRepositoryProvider).detail(id);
});

/// Estado de garantía de una unidad (one-shot, auto-dispose).
final unitWarrantyProvider =
    FutureProvider.autoDispose.family<Warranty, int>((ref, id) {
  return ref.watch(unitsRepositoryProvider).warranty(id);
});

/// Unidades del cliente para asociarlas a un ticket (selector, sin filtro).
final clientUnitsForPickerProvider =
    FutureProvider.autoDispose<List<SoldUnit>>((ref) async {
  final res = await ref.watch(unitsRepositoryProvider).list(perPage: 100);
  return res.items;
});

/// Búsqueda de productos del catálogo MasterColor (registro manual de unidad).
final productSearchProvider =
    FutureProvider.autoDispose.family<List<ClientProduct>, String>((ref, query) {
  final q = query.trim();
  return ref.watch(unitsRepositoryProvider).searchProducts(
        search: q.isEmpty ? null : q,
      );
});
