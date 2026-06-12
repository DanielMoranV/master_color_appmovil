import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mastercolor_api/mastercolor_api.dart';

import '../../core/network/api_exception.dart';
import 'staff_units_repository.dart';

/// Historial de servicio de una unidad: línea de tiempo de eventos
/// (apertura de ticket, visita, resolución), del más reciente al más antiguo.
class UnitHistoryScreen extends ConsumerWidget {
  const UnitHistoryScreen({super.key, required this.unitId});

  final int unitId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyAsync = ref.watch(unitHistoryProvider(unitId));
    return Scaffold(
      appBar: AppBar(title: const Text('Historial de servicio')),
      body: historyAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  err is ApiException
                      ? err.displayMessage
                      : 'No se pudo cargar el historial.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                FilledButton.tonal(
                  onPressed: () => ref.invalidate(unitHistoryProvider(unitId)),
                  child: const Text('Reintentar'),
                ),
              ],
            ),
          ),
        ),
        data: (data) {
          final timeline = data.timeline ?? const <ServiceHistoryEvent>[];
          return RefreshIndicator(
            onRefresh: () async => ref.invalidate(unitHistoryProvider(unitId)),
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Row(
                  children: [
                    Text(
                      data.unit?.productName ?? 'Unidad',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Spacer(),
                    Chip(label: Text('${data.ticketsCount ?? 0} tickets')),
                  ],
                ),
                const SizedBox(height: 12),
                if (timeline.isEmpty)
                  const Padding(
                    padding: EdgeInsets.only(top: 80),
                    child: Center(child: Text('Sin eventos de servicio.')),
                  )
                else
                  for (var i = 0; i < timeline.length; i++)
                    _EventTile(
                      event: timeline[i],
                      isFirst: i == 0,
                      isLast: i == timeline.length - 1,
                    ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _EventTile extends StatelessWidget {
  const _EventTile({
    required this.event,
    required this.isFirst,
    required this.isLast,
  });

  final ServiceHistoryEvent event;
  final bool isFirst;
  final bool isLast;

  static final _dateFormat = DateFormat('dd MMM yyyy · HH:mm', 'es');

  ({String label, Color color, IconData icon}) get _kind =>
      switch (event.type) {
        ServiceHistoryEventTypeEnum.ticketOpened => (
            label: 'Ticket abierto',
            color: Colors.blue,
            icon: Icons.add_circle_outline
          ),
        ServiceHistoryEventTypeEnum.visit => (
            label: 'Visita',
            color: Colors.orange,
            icon: Icons.directions_car_outlined
          ),
        ServiceHistoryEventTypeEnum.resolved => (
            label: 'Resuelto',
            color: Colors.green,
            icon: Icons.task_alt
          ),
        _ => (label: 'Evento', color: Colors.grey, icon: Icons.circle),
      };

  @override
  Widget build(BuildContext context) {
    final kind = _kind;
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 2,
                height: 6,
                color: isFirst ? Colors.transparent : Colors.grey.shade300,
              ),
              CircleAvatar(
                radius: 14,
                backgroundColor: kind.color.withValues(alpha: 0.15),
                child: Icon(kind.icon, size: 16, color: kind.color),
              ),
              Expanded(
                child: Container(
                  width: 2,
                  color: isLast ? Colors.transparent : Colors.grey.shade300,
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(kind.label,
                          style: Theme.of(context).textTheme.titleSmall),
                      const Spacer(),
                      if (event.ticketCode != null)
                        Text(event.ticketCode!,
                            style: const TextStyle(
                                fontFamily: 'monospace',
                                color: Colors.grey,
                                fontSize: 12)),
                    ],
                  ),
                  if (event.at != null)
                    Text(_dateFormat.format(event.at!.toLocal()),
                        style: Theme.of(context).textTheme.bodySmall),
                  if (event.subject != null && event.subject!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(event.subject!),
                    ),
                  if (event.technician != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text('Técnico: ${event.technician}',
                          style: Theme.of(context).textTheme.bodySmall),
                    ),
                  if (event.workDone != null && event.workDone!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(event.workDone!),
                    ),
                  if (event.durationMinutes != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text('Duración: ${event.durationMinutes} min',
                          style: Theme.of(context).textTheme.bodySmall),
                    ),
                  if (event.diagnosis != null && event.diagnosis!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(event.diagnosis!),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
