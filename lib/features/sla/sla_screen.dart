import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mastercolor_api/mastercolor_api.dart';

import '../../core/network/api_exception.dart';
import '../tickets/ticket_presentation.dart';
import '../tickets/tickets_controller.dart';
import '../units/unit_presentation.dart' show StatusChip;

/// Panel de escalamiento por SLA (staff): tickets ordenados por vencimiento,
/// filtrables por incumplidos / por vencer / todos.
class SlaScreen extends ConsumerStatefulWidget {
  const SlaScreen({super.key});

  @override
  ConsumerState<SlaScreen> createState() => _SlaScreenState();
}

class _SlaScreenState extends ConsumerState<SlaScreen> {
  String _filter = 'all';

  static const _filters = <(String, String)>[
    ('all', 'Todos'),
    ('due_soon', 'Por vencer'),
    ('breached', 'Vencidos'),
  ];

  @override
  Widget build(BuildContext context) {
    final slaAsync = ref.watch(slaListProvider(_filter));
    return Scaffold(
      appBar: AppBar(title: const Text('SLA / Escalamiento')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
            child: Wrap(
              spacing: 8,
              children: [
                for (final f in _filters)
                  ChoiceChip(
                    label: Text(f.$2),
                    selected: _filter == f.$1,
                    onSelected: (_) => setState(() => _filter = f.$1),
                  ),
              ],
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async => ref.invalidate(slaListProvider(_filter)),
              child: slaAsync.when(
                loading: () =>
                    const Center(child: CircularProgressIndicator()),
                error: (err, _) => ListView(
                  children: [
                    const SizedBox(height: 120),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Text(
                          err is ApiException
                              ? err.displayMessage
                              : 'No se pudo cargar el SLA.',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Center(
                      child: FilledButton.tonal(
                        onPressed: () =>
                            ref.invalidate(slaListProvider(_filter)),
                        child: const Text('Reintentar'),
                      ),
                    ),
                  ],
                ),
                data: (tickets) {
                  if (tickets.isEmpty) {
                    return ListView(
                      children: const [
                        SizedBox(height: 120),
                        Icon(Icons.verified_outlined,
                            size: 56, color: Colors.green),
                        SizedBox(height: 12),
                        Center(child: Text('Sin tickets en este filtro.')),
                      ],
                    );
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: tickets.length,
                    itemBuilder: (_, i) => _SlaCard(ticket: tickets[i]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SlaCard extends StatelessWidget {
  const _SlaCard({required this.ticket});

  final SupportTicket ticket;

  static final _dateFormat = DateFormat('dd MMM · HH:mm', 'es');

  @override
  Widget build(BuildContext context) {
    final id = ticket.id;
    final due = ticket.slaDueAt?.toLocal();
    final sla = slaPresentation(ticket.slaStatus?.value);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: id == null ? null : () => context.push('/staff/tickets/$id'),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (ticket.code != null)
                    Text(ticket.code!,
                        style: const TextStyle(
                            fontFamily: 'monospace',
                            color: Colors.grey,
                            fontSize: 12)),
                  const Spacer(),
                  if (sla != null)
                    StatusChip(
                        label: sla.label, color: sla.color, icon: sla.icon),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                ticket.subject ?? 'Ticket #${ticket.id ?? '—'}',
                style: Theme.of(context).textTheme.titleMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  if (ticket.client?.name != null) ...[
                    const Icon(Icons.person_outline,
                        size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Expanded(child: Text(ticket.client!.name!)),
                  ] else
                    const Spacer(),
                  if (due != null)
                    Text('Vence ${_dateFormat.format(due)}',
                        style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
