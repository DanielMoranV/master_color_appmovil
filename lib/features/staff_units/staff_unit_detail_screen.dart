import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mastercolor_api/mastercolor_api.dart';

import '../../core/network/api_exception.dart';
import '../units/unit_presentation.dart';
import 'staff_units_controller.dart';
import 'staff_units_repository.dart';

/// Detalle de una unidad para staff, con edición de número de serie y estado.
class StaffUnitDetailScreen extends ConsumerWidget {
  const StaffUnitDetailScreen({super.key, required this.unitId});

  final int unitId;

  Future<void> _edit(BuildContext context, WidgetRef ref, SoldUnitDetail unit) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (_) => _EditUnitDialog(unit: unit),
    );
    if (ok == true) {
      ref.invalidate(staffUnitDetailProvider(unitId));
      ref.read(staffUnitsControllerProvider.notifier).refresh();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Unidad actualizada.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(staffUnitDetailProvider(unitId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Unidad'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            tooltip: 'Historial de servicio',
            onPressed: () => context.push('/staff/units/$unitId/history'),
          ),
          detailAsync.maybeWhen(
            data: (unit) => IconButton(
              icon: const Icon(Icons.edit_outlined),
              tooltip: 'Editar',
              onPressed: () => _edit(context, ref, unit),
            ),
            orElse: () => const SizedBox.shrink(),
          ),
        ],
      ),
      body: detailAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  err is ApiException ? err.displayMessage : 'Error al cargar.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                FilledButton.tonal(
                  onPressed: () =>
                      ref.invalidate(staffUnitDetailProvider(unitId)),
                  child: const Text('Reintentar'),
                ),
              ],
            ),
          ),
        ),
        data: (unit) => RefreshIndicator(
          onRefresh: () async => ref.invalidate(staffUnitDetailProvider(unitId)),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              if (unit.imageUrl != null && unit.imageUrl!.isNotEmpty) ...[
                Center(
                  child: ProductThumb(
                      imageUrl: unit.imageUrl, size: 140, radius: 12),
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
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      _row('Número de serie', unit.serialNumber ?? '—'),
                      _row('Cliente', '#${unit.clientId ?? '—'}'),
                      _row('Fecha de compra', formatDate(unit.purchaseDate)),
                      _row(
                          'Origen',
                          unit.registrationSource?.value == 'manual'
                              ? 'Registro manual'
                              : 'Orden de compra'),
                      if (unit.orderId != null) _row('Orden', '#${unit.orderId}'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _WarrantyCard(warranty: unit.warranty),
              if (unit.tickets != null && unit.tickets!.isNotEmpty) ...[
                const SizedBox(height: 16),
                Text('Tickets asociados',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                ...unit.tickets!.map(
                  (t) => Card(
                    child: ListTile(
                      leading: const Icon(Icons.confirmation_number_outlined),
                      title: Text(t.subject ?? 'Ticket #${t.id ?? '—'}'),
                      subtitle: t.status != null ? Text(t.status!.value) : null,
                    ),
                  ),
                ),
              ],
            ],
          ),
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
            child:
                Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
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
        child: Row(
          children: [
            Icon(status?.icon ?? Icons.shield_outlined,
                color: status?.color ?? Colors.grey),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(status?.label ?? 'Garantía',
                      style: Theme.of(context).textTheme.titleMedium),
                  if (w != null)
                    Text(
                      'Vence ${formatDate(w.expiresAt)} · ${w.warrantyMonths ?? 0} meses',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EditUnitDialog extends ConsumerStatefulWidget {
  const _EditUnitDialog({required this.unit});

  final SoldUnitDetail unit;

  @override
  ConsumerState<_EditUnitDialog> createState() => _EditUnitDialogState();
}

class _EditUnitDialogState extends ConsumerState<_EditUnitDialog> {
  late final TextEditingController _serial =
      TextEditingController(text: widget.unit.serialNumber ?? '');
  late SoldUnitStatus? _status = widget.unit.status;
  bool _submitting = false;
  String? _error;

  @override
  void dispose() {
    _serial.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    setState(() {
      _submitting = true;
      _error = null;
    });
    try {
      await ref.read(staffUnitsRepositoryProvider).update(
            id: widget.unit.id!,
            serialNumber: _serial.text.trim().isEmpty ? null : _serial.text.trim(),
            status: _status,
          );
      if (mounted) Navigator.of(context).pop(true);
    } on ApiException catch (e) {
      setState(() => _error = e.displayMessage);
    } catch (_) {
      setState(() => _error = 'No se pudo actualizar la unidad.');
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Editar unidad'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButtonFormField<SoldUnitStatus>(
            initialValue: _status,
            decoration: const InputDecoration(
              labelText: 'Estado',
              border: OutlineInputBorder(),
            ),
            items: [
              for (final s in SoldUnitStatus.values)
                DropdownMenuItem(value: s, child: Text(s.label)),
            ],
            onChanged: (v) => setState(() => _status = v),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _serial,
            decoration: const InputDecoration(
              labelText: 'Número de serie',
              border: OutlineInputBorder(),
            ),
          ),
          if (_error != null) ...[
            const SizedBox(height: 12),
            Text(_error!,
                style: TextStyle(color: Theme.of(context).colorScheme.error)),
          ],
        ],
      ),
      actions: [
        TextButton(
          onPressed: _submitting ? null : () => Navigator.of(context).pop(false),
          child: const Text('Cancelar'),
        ),
        FilledButton(
          onPressed: _submitting ? null : _submit,
          child: _submitting
              ? const SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Guardar'),
        ),
      ],
    );
  }
}
