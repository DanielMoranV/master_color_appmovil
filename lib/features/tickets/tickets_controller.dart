import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mastercolor_api/mastercolor_api.dart';

import '../../core/auth/auth_controller.dart';
import '../../core/auth/session.dart';
import '../../core/pagination/paged_state.dart';
import 'tickets_repository.dart';

/// Lista paginada de tickets del rol activo, con filtro por estado/búsqueda y
/// scroll infinito (`loadMore`).
class TicketsController extends AsyncNotifier<PagedState<SupportTicket>> {
  TicketStatus? _status;
  String? _search;
  TicketPriority? _priority;
  TicketCategory? _category;
  bool _mine = false;

  TicketStatus? get status => _status;
  String? get search => _search;
  TicketPriority? get priority => _priority;
  TicketCategory? get category => _category;
  bool get mine => _mine;

  UserRole get _role => ref.read(currentRoleProvider) ?? UserRole.client;

  @override
  Future<PagedState<SupportTicket>> build() => _firstPage();

  Future<PagedState<SupportTicket>> _firstPage() async {
    final res = await ref.read(ticketsRepositoryProvider).list(
          role: _role,
          status: _status,
          search: _search,
          priority: _priority,
          category: _category,
          mine: _mine,
          page: 1,
        );
    return PagedState(
      items: res.items,
      page: res.currentPage,
      lastPage: res.lastPage,
    );
  }

  Future<void> _reload() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_firstPage);
  }

  /// Cambia el filtro de estado y recarga.
  Future<void> setStatus(TicketStatus? status) async {
    if (_status == status) return;
    _status = status;
    await _reload();
  }

  /// Cambia el término de búsqueda (staff) y recarga.
  Future<void> setSearch(String? search) async {
    final normalized = (search == null || search.trim().isEmpty)
        ? null
        : search.trim();
    if (_search == normalized) return;
    _search = normalized;
    await _reload();
  }

  /// Cambia el filtro de prioridad (staff, cola) y recarga.
  Future<void> setPriority(TicketPriority? priority) async {
    if (_priority == priority) return;
    _priority = priority;
    await _reload();
  }

  /// Cambia el filtro de categoría (staff, cola) y recarga.
  Future<void> setCategory(TicketCategory? category) async {
    if (_category == category) return;
    _category = category;
    await _reload();
  }

  /// Alterna entre la cola general y "mis tickets" (staff). Al pasar a "míos"
  /// limpia los filtros que ese endpoint no soporta (prioridad/categoría/búsqueda).
  Future<void> setMine(bool mine) async {
    if (_mine == mine) return;
    _mine = mine;
    if (mine) {
      _priority = null;
      _category = null;
      _search = null;
    }
    await _reload();
  }

  /// Recarga con los filtros actuales (pull-to-refresh / tras crear ticket).
  Future<void> refresh() => _reload();

  /// Carga la siguiente página y la agrega (scroll infinito).
  Future<void> loadMore() async {
    final current = state.asData?.value;
    if (current == null || !current.hasMore || current.isLoadingMore) return;

    state = AsyncData(current.copyWith(isLoadingMore: true));
    try {
      final res = await ref.read(ticketsRepositoryProvider).list(
            role: _role,
            status: _status,
            search: _search,
            priority: _priority,
            category: _category,
            mine: _mine,
            page: current.page + 1,
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

final ticketsControllerProvider =
    AsyncNotifierProvider<TicketsController, PagedState<SupportTicket>>(
        TicketsController.new);

/// Detalle de un ticket (one-shot, auto-dispose), role-aware.
final ticketDetailProvider =
    FutureProvider.autoDispose.family<SupportTicketDetail, int>((ref, id) {
  final role = ref.watch(currentRoleProvider) ?? UserRole.client;
  return ref.watch(ticketsRepositoryProvider).detail(role: role, id: id);
});

/// Filtros para el listado de técnicos asignables. Como record, tiene igualdad
/// por valor (clave estable para la familia de providers).
typedef TechnicianFilter = ({String? specialty, String? zone, bool availableOnly});

/// Técnicos asignables (solo staff), desde `GET /support/technicians`, filtrados
/// por especialidad/zona/disponibilidad.
final assignableTechniciansProvider = FutureProvider.autoDispose
    .family<List<Technician>, TechnicianFilter>((ref, f) {
  return ref.watch(ticketsRepositoryProvider).listTechnicians(
        specialty: f.specialty,
        zone: f.zone,
        availableOnly: f.availableOnly,
      );
});

/// Agenda del técnico para una fecha (solo staff). La clave es la fecha
/// normalizada a medianoche; `null` no se usa (la pantalla siempre pasa un día).
final agendaProvider = FutureProvider.autoDispose
    .family<List<SupportTicket>, DateTime>((ref, date) {
  return ref.watch(ticketsRepositoryProvider).agenda(date: date);
});

/// Lista de escalamiento por SLA (solo staff), por filtro (all/due_soon/
/// breached).
final slaListProvider = FutureProvider.autoDispose
    .family<List<SupportTicket>, String>((ref, filter) {
  return ref.watch(ticketsRepositoryProvider).slaList(filter: filter);
});
