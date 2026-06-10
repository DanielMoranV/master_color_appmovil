import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mastercolor_api/mastercolor_api.dart';

import '../../core/network/api_exception.dart';
import 'unit_presentation.dart';
import 'units_controller.dart';

/// Detalle de una unidad: datos, estado de garantía y tickets asociados.
class UnitDetailScreen extends ConsumerWidget {
  const UnitDetailScreen({super.key, required this.unitId});

  final int unitId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(unitDetailProvider(unitId));

    return Scaffold(
      appBar: AppBar(title: const Text('Detalle de unidad')),
      body: detailAsync.when(
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
                      : 'No se pudo cargar la unidad.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                FilledButton.tonal(
                  onPressed: () => ref.invalidate(unitDetailProvider(unitId)),
                  child: const Text('Reintentar'),
                ),
              ],
            ),
          ),
        ),
        data: (unit) => RefreshIndicator(
          onRefresh: () async => ref.invalidate(unitDetailProvider(unitId)),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              if (unit.imageUrl != null && unit.imageUrl!.isNotEmpty) ...[
                Center(
                  child: ProductThumb(
                    imageUrl: unit.imageUrl,
                    size: 140,
                    radius: 12,
                  ),
                ),
                const SizedBox(height: 16),
              ],
              Text(
                unit.productName ?? 'Producto #${unit.productId ?? '—'}',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              if (unit.status != null)
                StatusChip(label: unit.status!.label, color: unit.status!.color),
              const SizedBox(height: 16),
              _InfoCard(unit: unit),
              const SizedBox(height: 16),
              _WarrantyCard(warranty: unit.warranty),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: () =>
                    context.push('/client/tickets/new?unitId=$unitId'),
                icon: const Icon(Icons.report_problem_outlined),
                label: const Text('Reportar problema / Abrir ticket'),
              ),
              if (unit.tickets != null && unit.tickets!.isNotEmpty) ...[
                const SizedBox(height: 16),
                _TicketsSection(tickets: unit.tickets!),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.unit});

  final SoldUnitDetail unit;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _row('Número de serie', unit.serialNumber ?? 'No serializado'),
            _row('Fecha de compra', formatDate(unit.purchaseDate)),
            _row('Origen',
                unit.registrationSource?.value == 'manual'
                    ? 'Registro manual'
                    : 'Orden de compra'),
            if (unit.orderId != null) _row('Orden', '#${unit.orderId}'),
          ],
        ),
      ),
    );
  }

  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
            child: Text(label, style: const TextStyle(color: Colors.grey)),
          ),
          Expanded(
            child: Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}

class _WarrantyCard extends StatelessWidget {
  const _WarrantyCard({required this.warranty});

  final Warranty? warranty;

  @override
  Widget build(BuildContext context) {
    final w = warranty;
    final status = w?.status;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  status?.icon ?? Icons.shield_outlined,
                  color: status?.color ?? Colors.grey,
                ),
                const SizedBox(width: 8),
                Text(
                  status?.label ?? 'Garantía',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (w != null) ...[
              _row('Cobertura', '${w.warrantyMonths ?? 0} meses'),
              _row('Vence', formatDate(w.expiresAt)),
              if (w.daysRemaining != null && w.active == true)
                _row('Días restantes', '${w.daysRemaining}'),
            ] else
              const Text('Sin información de garantía.'),
          ],
        ),
      ),
    );
  }

  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 140,
            child: Text(label, style: const TextStyle(color: Colors.grey)),
          ),
          Expanded(
            child: Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}

class _TicketsSection extends StatelessWidget {
  const _TicketsSection({required this.tickets});

  final List<SupportTicket> tickets;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Tickets asociados',
            style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        ...tickets.map(
          (t) => Card(
            child: ListTile(
              leading: const Icon(Icons.confirmation_number_outlined),
              title: Text(t.subject ?? 'Ticket #${t.id ?? '—'}'),
              subtitle: t.status != null ? Text(t.status!.value) : null,
              trailing: const Icon(Icons.chevron_right),
              onTap: t.id == null
                  ? null
                  : () => context.push('/client/tickets/${t.id}'),
            ),
          ),
        ),
      ],
    );
  }
}
