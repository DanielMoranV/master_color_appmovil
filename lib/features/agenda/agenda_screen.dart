import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mastercolor_api/mastercolor_api.dart';

import '../../core/launchers.dart';
import '../../core/network/api_exception.dart';
import '../tickets/ticket_presentation.dart';
import '../tickets/tickets_controller.dart';
import '../units/unit_presentation.dart' show StatusChip;

/// Agenda del técnico: tickets con visita programada para un día, ordenados por
/// hora, con dirección y acceso rápido a "Cómo llegar" y al detalle.
class AgendaScreen extends ConsumerStatefulWidget {
  const AgendaScreen({super.key});

  @override
  ConsumerState<AgendaScreen> createState() => _AgendaScreenState();
}

class _AgendaScreenState extends ConsumerState<AgendaScreen> {
  late DateTime _date;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _date = DateTime(now.year, now.month, now.day);
  }

  static final _dayFormat = DateFormat('EEEE d MMM yyyy', 'es');

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() => _date = DateTime(picked.year, picked.month, picked.day));
    }
  }

  void _shiftDay(int days) {
    setState(() => _date = _date.add(Duration(days: days)));
  }

  @override
  Widget build(BuildContext context) {
    final agendaAsync = ref.watch(agendaProvider(_date));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi agenda'),
        actions: [
          IconButton(
            icon: const Icon(Icons.today_outlined),
            tooltip: 'Elegir fecha',
            onPressed: _pickDate,
          ),
        ],
      ),
      body: Column(
        children: [
          _DateBar(
            label: _dayFormat.format(_date),
            onPrev: () => _shiftDay(-1),
            onNext: () => _shiftDay(1),
            onTapLabel: _pickDate,
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async => ref.invalidate(agendaProvider(_date)),
              child: agendaAsync.when(
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
                              : 'No se pudo cargar la agenda.',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Center(
                      child: FilledButton.tonal(
                        onPressed: () => ref.invalidate(agendaProvider(_date)),
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
                        Icon(Icons.event_available_outlined,
                            size: 56, color: Colors.grey),
                        SizedBox(height: 12),
                        Center(child: Text('Sin visitas programadas este día.')),
                      ],
                    );
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: tickets.length,
                    itemBuilder: (_, i) => _AgendaCard(ticket: tickets[i]),
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

class _DateBar extends StatelessWidget {
  const _DateBar({
    required this.label,
    required this.onPrev,
    required this.onNext,
    required this.onTapLabel,
  });

  final String label;
  final VoidCallback onPrev;
  final VoidCallback onNext;
  final VoidCallback onTapLabel;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: onPrev,
          ),
          Expanded(
            child: InkWell(
              onTap: onTapLabel,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: onNext,
          ),
        ],
      ),
    );
  }
}

class _AgendaCard extends StatelessWidget {
  const _AgendaCard({required this.ticket});

  final SupportTicket ticket;

  static final _timeFormat = DateFormat('HH:mm', 'es');

  @override
  Widget build(BuildContext context) {
    final id = ticket.id;
    final scheduled = ticket.scheduledAt?.toLocal();
    final window = ticket.scheduledWindowMinutes;
    final address = ticket.serviceAddress;
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
                  const Icon(Icons.schedule, size: 16),
                  const SizedBox(width: 6),
                  Text(
                    scheduled != null ? _timeFormat.format(scheduled) : 'Sin hora',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  if (window != null)
                    Text(' · ${window}min',
                        style: Theme.of(context).textTheme.bodySmall),
                  const Spacer(),
                  if (ticket.status != null)
                    StatusChip(
                      label: ticket.status!.label,
                      color: ticket.status!.color,
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                ticket.subject ?? 'Ticket #${ticket.id ?? '—'}',
                style: Theme.of(context).textTheme.titleSmall,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              if (ticket.client?.name != null) ...[
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.person_outline, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Expanded(child: Text(ticket.client!.name!)),
                  ],
                ),
              ],
              if (address?.addressFull != null) ...[
                const SizedBox(height: 4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.place_outlined,
                        size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Expanded(child: Text(address!.addressFull!)),
                  ],
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.directions, size: 18),
                    label: const Text('Cómo llegar'),
                    onPressed: () async {
                      final ok = await openDirections(
                        latitude: address.latitude,
                        longitude: address.longitude,
                        fallbackQuery: address.addressFull,
                      );
                      if (!ok && context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('No se pudo abrir el mapa.'),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
