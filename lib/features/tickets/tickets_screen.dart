import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mastercolor_api/mastercolor_api.dart';

import '../../core/auth/auth_controller.dart';
import '../../core/auth/session.dart';
import '../../core/network/api_exception.dart';
import '../units/unit_presentation.dart' show StatusChip;
import 'ticket_presentation.dart';
import 'tickets_controller.dart';

/// Lista de tickets. Cliente: mis tickets + crear. Staff: cola de soporte + búsqueda.
class TicketsScreen extends ConsumerWidget {
  const TicketsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final role = ref.watch(currentRoleProvider) ?? UserRole.client;
    final isClient = role == UserRole.client;
    final ticketsAsync = ref.watch(ticketsControllerProvider);
    final controller = ref.read(ticketsControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(isClient ? 'Mis tickets' : 'Cola de soporte'),
        leading: IconButton(
          icon: Icon(
            isClient ? Icons.inventory_2_outlined : Icons.arrow_back,
          ),
          tooltip: isClient ? 'Mis unidades' : 'Atrás',
          onPressed: () => context.go(isClient ? '/client' : '/staff'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Cerrar sesión',
            onPressed: () => ref.read(authControllerProvider.notifier).logout(),
          ),
        ],
      ),
      floatingActionButton: isClient
          ? FloatingActionButton.extended(
              onPressed: () => context.push('/client/tickets/new'),
              icon: const Icon(Icons.add),
              label: const Text('Nuevo'),
            )
          : null,
      body: Column(
        children: [
          if (!isClient) ...[
            _MineToggle(
              mine: controller.mine,
              onChanged: controller.setMine,
            ),
            if (!controller.mine)
              _SearchBar(
                initial: controller.search,
                onSubmit: controller.setSearch,
              ),
          ],
          _StatusFilterBar(
            selected: controller.status,
            onChanged: controller.setStatus,
          ),
          if (!isClient && !controller.mine)
            _AdvancedFilters(
              priority: controller.priority,
              category: controller.category,
              onPriority: controller.setPriority,
              onCategory: controller.setCategory,
            ),
          const Divider(height: 1),
          Expanded(
            child: RefreshIndicator(
              onRefresh: controller.refresh,
              child: ticketsAsync.when(
                data: (paged) => _TicketsList(
                  tickets: paged.items,
                  role: role,
                  isLoadingMore: paged.isLoadingMore,
                  onLoadMore: controller.loadMore,
                ),
                error: (err, _) => _ErrorView(
                  message: err is ApiException
                      ? err.displayMessage
                      : 'No se pudieron cargar los tickets.',
                  onRetry: controller.refresh,
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchBar extends StatefulWidget {
  const _SearchBar({required this.initial, required this.onSubmit});

  final String? initial;
  final ValueChanged<String?> onSubmit;

  @override
  State<_SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<_SearchBar> {
  late final TextEditingController _ctrl =
      TextEditingController(text: widget.initial);

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      child: TextField(
        controller: _ctrl,
        textInputAction: TextInputAction.search,
        onSubmitted: widget.onSubmit,
        decoration: InputDecoration(
          hintText: 'Buscar por código, asunto o cliente',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              _ctrl.clear();
              widget.onSubmit(null);
            },
          ),
          isDense: true,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}

class _StatusFilterBar extends StatelessWidget {
  const _StatusFilterBar({required this.selected, required this.onChanged});

  final TicketStatus? selected;
  final ValueChanged<TicketStatus?> onChanged;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          _chip(label: 'Todos', value: null),
          for (final status in TicketStatus.values)
            _chip(label: status.label, value: status),
        ],
      ),
    );
  }

  Widget _chip({required String label, required TicketStatus? value}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: selected == value,
        onSelected: (_) => onChanged(value),
      ),
    );
  }
}

/// Alterna entre la cola general y "mis tickets" (técnico autenticado).
class _MineToggle extends StatelessWidget {
  const _MineToggle({required this.mine, required this.onChanged});

  final bool mine;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      child: SegmentedButton<bool>(
        segments: const [
          ButtonSegment(
            value: false,
            label: Text('Cola'),
            icon: Icon(Icons.inbox_outlined),
          ),
          ButtonSegment(
            value: true,
            label: Text('Míos'),
            icon: Icon(Icons.assignment_ind_outlined),
          ),
        ],
        selected: {mine},
        onSelectionChanged: (s) => onChanged(s.first),
      ),
    );
  }
}

/// Filtros avanzados de la cola (staff): prioridad y categoría.
class _AdvancedFilters extends StatelessWidget {
  const _AdvancedFilters({
    required this.priority,
    required this.category,
    required this.onPriority,
    required this.onCategory,
  });

  final TicketPriority? priority;
  final TicketCategory? category;
  final ValueChanged<TicketPriority?> onPriority;
  final ValueChanged<TicketCategory?> onCategory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
      child: Row(
        children: [
          Expanded(
            child: DropdownButtonFormField<TicketPriority?>(
              initialValue: priority,
              isExpanded: true,
              decoration: const InputDecoration(
                labelText: 'Prioridad',
                isDense: true,
                border: OutlineInputBorder(),
              ),
              items: [
                const DropdownMenuItem(value: null, child: Text('Todas')),
                for (final p in TicketPriority.values)
                  DropdownMenuItem(value: p, child: Text(p.label)),
              ],
              onChanged: onPriority,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: DropdownButtonFormField<TicketCategory?>(
              initialValue: category,
              isExpanded: true,
              decoration: const InputDecoration(
                labelText: 'Categoría',
                isDense: true,
                border: OutlineInputBorder(),
              ),
              items: [
                const DropdownMenuItem(value: null, child: Text('Todas')),
                for (final c in TicketCategory.values)
                  DropdownMenuItem(value: c, child: Text(c.label)),
              ],
              onChanged: onCategory,
            ),
          ),
        ],
      ),
    );
  }
}

class _TicketsList extends StatefulWidget {
  const _TicketsList({
    required this.tickets,
    required this.role,
    required this.isLoadingMore,
    required this.onLoadMore,
  });

  final List<SupportTicket> tickets;
  final UserRole role;
  final bool isLoadingMore;
  final Future<void> Function() onLoadMore;

  @override
  State<_TicketsList> createState() => _TicketsListState();
}

class _TicketsListState extends State<_TicketsList> {
  final _scroll = ScrollController();

  @override
  void initState() {
    super.initState();
    _scroll.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scroll.removeListener(_onScroll);
    _scroll.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scroll.position.pixels >= _scroll.position.maxScrollExtent - 300) {
      widget.onLoadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.tickets.isEmpty) {
      return ListView(
        children: const [
          SizedBox(height: 120),
          Center(child: Text('No hay tickets que mostrar.')),
        ],
      );
    }
    final count = widget.tickets.length + (widget.isLoadingMore ? 1 : 0);
    return ListView.separated(
      controller: _scroll,
      padding: const EdgeInsets.all(12),
      itemCount: count,
      separatorBuilder: (_, _) => const SizedBox(height: 8),
      itemBuilder: (_, i) {
        if (i >= widget.tickets.length) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        return _TicketCard(ticket: widget.tickets[i], role: widget.role);
      },
    );
  }
}

class _TicketCard extends StatelessWidget {
  const _TicketCard({required this.ticket, required this.role});

  final SupportTicket ticket;
  final UserRole role;

  static final _dateFormat = DateFormat('dd MMM · HH:mm', 'es');

  @override
  Widget build(BuildContext context) {
    final id = ticket.id;
    final base = role == UserRole.client ? '/client/tickets' : '/staff/tickets';
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: id == null ? null : () => context.push('$base/$id'),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (ticket.code != null)
                    Text(
                      ticket.code!,
                      style: const TextStyle(
                        fontFamily: 'monospace',
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  const Spacer(),
                  if (slaPresentation(ticket.slaStatus?.value) case final sla?)
                    Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: StatusChip(
                        label: sla.label,
                        color: sla.color,
                        icon: sla.icon,
                      ),
                    ),
                  if (ticket.status != null)
                    StatusChip(
                      label: ticket.status!.label,
                      color: ticket.status!.color,
                    ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                ticket.subject ?? 'Ticket #${ticket.id ?? '—'}',
                style: Theme.of(context).textTheme.titleMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  if (ticket.priority != null)
                    StatusChip(
                      label: ticket.priority!.label,
                      color: ticket.priority!.color,
                      icon: Icons.flag_outlined,
                    ),
                  if (ticket.category != null)
                    Text('· ${ticket.category!.label}',
                        style: Theme.of(context).textTheme.bodySmall),
                  if (role == UserRole.staff && ticket.assignedUserName != null)
                    Text('· ${ticket.assignedUserName}',
                        style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
              if (ticket.createdAt != null) ...[
                const SizedBox(height: 6),
                Text(
                  _dateFormat.format(ticket.createdAt!.toLocal()),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message, required this.onRetry});

  final String message;
  final Future<void> Function() onRetry;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 100),
        Icon(Icons.error_outline,
            size: 56, color: Theme.of(context).colorScheme.error),
        const SizedBox(height: 12),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(message, textAlign: TextAlign.center),
          ),
        ),
        const SizedBox(height: 12),
        Center(
          child: FilledButton.tonal(
            onPressed: onRetry,
            child: const Text('Reintentar'),
          ),
        ),
      ],
    );
  }
}
