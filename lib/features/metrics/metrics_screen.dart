import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mastercolor_api/mastercolor_api.dart';

import '../../core/auth/auth_controller.dart';
import '../../core/auth/current_user.dart';
import '../../core/network/api_exception.dart';
import '../tickets/ticket_presentation.dart';
import 'metrics_controller.dart';

/// Dashboard de métricas de soporte (técnico). Home del área staff.
class MetricsScreen extends ConsumerWidget {
  const MetricsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final metricsAsync = ref.watch(metricsControllerProvider);
    final controller = ref.read(metricsControllerProvider.notifier);
    final name = ref.watch(currentUserProvider).asData?.value?.name;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name == null ? 'Soporte' : 'Hola, $name'),
            Text(
              'Métricas',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white70,
                  ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.date_range),
            tooltip: 'Rango de fechas',
            onPressed: () => _pickRange(context, controller),
          ),
          IconButton(
            icon: const Icon(Icons.event_note_outlined),
            tooltip: 'Mi agenda',
            onPressed: () => context.push('/staff/agenda'),
          ),
          IconButton(
            icon: const Icon(Icons.inventory_2_outlined),
            tooltip: 'Unidades',
            onPressed: () => context.push('/staff/units'),
          ),
          IconButton(
            icon: const Icon(Icons.confirmation_number_outlined),
            tooltip: 'Cola de tickets',
            onPressed: () => context.push('/staff/tickets'),
          ),
          IconButton(
            icon: const Icon(Icons.badge_outlined),
            tooltip: 'Mi perfil',
            onPressed: () => context.push('/staff/profile'),
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Cerrar sesión',
            onPressed: () => ref.read(authControllerProvider.notifier).logout(),
          ),
        ],
      ),
      body: Column(
        children: [
          if (controller.from != null && controller.to != null)
            _RangeBanner(
              from: controller.from!,
              to: controller.to!,
              onClear: () => controller.setRange(from: null, to: null),
            ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: controller.refresh,
              child: metricsAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, _) => ListView(
                  children: [
                    const SizedBox(height: 100),
                    Icon(Icons.error_outline,
                        size: 56, color: Theme.of(context).colorScheme.error),
                    const SizedBox(height: 12),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Text(
                        err is ApiException
                            ? err.displayMessage
                            : 'No se pudieron cargar las métricas.',
                        textAlign: TextAlign.center,
                      ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Center(
                      child: FilledButton.tonal(
                        onPressed: controller.refresh,
                        child: const Text('Reintentar'),
                      ),
                    ),
                  ],
                ),
                data: (m) => _Dashboard(metrics: m),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickRange(
      BuildContext context, MetricsController controller) async {
    final now = DateTime.now();
    final initial = (controller.from != null && controller.to != null)
        ? DateTimeRange(start: controller.from!, end: controller.to!)
        : null;
    final range = await showDateRangePicker(
      context: context,
      firstDate: DateTime(now.year - 3),
      lastDate: now,
      initialDateRange: initial,
      helpText: 'Rango de fechas',
    );
    if (range != null) {
      controller.setRange(from: range.start, to: range.end);
    }
  }
}

/// Banner con el rango de fechas activo y un botón para limpiarlo.
class _RangeBanner extends StatelessWidget {
  const _RangeBanner({
    required this.from,
    required this.to,
    required this.onClear,
  });

  final DateTime from;
  final DateTime to;
  final VoidCallback onClear;

  static final _fmt = DateFormat('dd MMM yyyy', 'es');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).colorScheme.secondaryContainer,
      padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
      child: Row(
        children: [
          const Icon(Icons.date_range, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text('${_fmt.format(from)} — ${_fmt.format(to)}'),
          ),
          IconButton(
            icon: const Icon(Icons.close, size: 18),
            tooltip: 'Quitar filtro',
            onPressed: onClear,
          ),
        ],
      ),
    );
  }
}

class _Dashboard extends StatelessWidget {
  const _Dashboard({required this.metrics});

  final SupportMetrics metrics;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _SectionTitle('Resumen'),
        const SizedBox(height: 8),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _KpiCard(
              label: 'Total tickets',
              value: '${metrics.totalTickets ?? 0}',
              icon: Icons.all_inbox,
              color: Colors.blue,
            ),
            _KpiCard(
              label: 'Abiertos',
              value: '${metrics.openTickets ?? 0}',
              icon: Icons.markunread_mailbox_outlined,
              color: Colors.orange,
            ),
            _KpiCard(
              label: 'Sin asignar',
              value: '${metrics.unassignedTickets ?? 0}',
              icon: Icons.person_off_outlined,
              color: Colors.red,
            ),
            _KpiCard(
              label: 'Resueltos (mes)',
              value: '${metrics.resolvedThisMonth ?? 0}',
              icon: Icons.task_alt,
              color: Colors.green,
            ),
            _KpiCard(
              label: '1ª respuesta',
              value: _hours(metrics.avgFirstResponseHours),
              icon: Icons.timer_outlined,
              color: Colors.teal,
            ),
            _KpiCard(
              label: 'Resolución',
              value: _hours(metrics.avgResolutionHours),
              icon: Icons.hourglass_bottom,
              color: Colors.indigo,
            ),
            _KpiCard(
              label: 'SLA incumplido',
              value: '${metrics.slaBreached ?? 0}',
              icon: Icons.warning_amber_outlined,
              color: Colors.deepOrange,
              onTap: () => context.push('/staff/sla'),
            ),
          ],
        ),
        if (metrics.byStatus != null && metrics.byStatus!.isNotEmpty) ...[
          const SizedBox(height: 24),
          _SectionTitle('Por estado'),
          const SizedBox(height: 8),
          _ByStatusCard(byStatus: metrics.byStatus!),
        ],
        if (metrics.byTechnician != null &&
            metrics.byTechnician!.isNotEmpty) ...[
          const SizedBox(height: 24),
          _SectionTitle('Por técnico'),
          const SizedBox(height: 8),
          _ByTechnicianCard(rows: metrics.byTechnician!),
        ],
      ],
    );
  }

  static String _hours(double? value) =>
      value == null ? '—' : '${value.toStringAsFixed(1)} h';
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.titleMedium);
  }
}

class _KpiCard extends StatelessWidget {
  const _KpiCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
    this.onTap,
  });

  final String label;
  final String value;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    // Dos columnas: la mitad del ancho menos el spacing y los paddings.
    final width = (MediaQuery.of(context).size.width - 16 * 2 - 12) / 2;
    return SizedBox(
      width: width,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, color: color),
                const SizedBox(height: 8),
                Text(value, style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 2),
                Text(label,
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ByStatusCard extends StatelessWidget {
  const _ByStatusCard({required this.byStatus});

  final Map<String, int> byStatus;

  @override
  Widget build(BuildContext context) {
    final total = byStatus.values.fold<int>(0, (a, b) => a + b);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            for (final entry in byStatus.entries)
              _StatusRow(
                status: _statusFromKey(entry.key),
                rawKey: entry.key,
                count: entry.value,
                total: total,
              ),
          ],
        ),
      ),
    );
  }

  static TicketStatus? _statusFromKey(String key) {
    for (final s in TicketStatus.values) {
      if (s.value == key) return s;
    }
    return null;
  }
}

class _StatusRow extends StatelessWidget {
  const _StatusRow({
    required this.status,
    required this.rawKey,
    required this.count,
    required this.total,
  });

  final TicketStatus? status;
  final String rawKey;
  final int count;
  final int total;

  @override
  Widget build(BuildContext context) {
    final color = status?.color ?? Colors.grey;
    final fraction = total == 0 ? 0.0 : count / total;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text(status?.label ?? rawKey)),
              Text('$count',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 4),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: fraction,
              minHeight: 6,
              backgroundColor: color.withValues(alpha: 0.15),
              valueColor: AlwaysStoppedAnimation(color),
            ),
          ),
        ],
      ),
    );
  }
}

class _ByTechnicianCard extends StatelessWidget {
  const _ByTechnicianCard({required this.rows});

  final List<SupportMetricsByTechnicianInner> rows;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const ListTile(
            dense: true,
            title: Text('Técnico'),
            trailing: SizedBox(
              width: 140,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Asign.', style: TextStyle(color: Colors.grey)),
                  Text('Resuel.', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ),
          const Divider(height: 1),
          for (final r in rows)
            ListTile(
              dense: true,
              leading: const Icon(Icons.engineering_outlined),
              title: Text(r.name ?? 'Técnico #${r.userId ?? '—'}'),
              trailing: SizedBox(
                width: 140,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${r.assigned ?? 0}'),
                    Text('${r.resolved ?? 0}',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
