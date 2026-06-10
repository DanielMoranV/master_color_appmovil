import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mastercolor_api/mastercolor_api.dart';

import '../../core/network/api_exception.dart';
import '../units/units_controller.dart';
import 'ticket_presentation.dart';
import 'tickets_controller.dart';
import 'tickets_repository.dart';

/// Formulario para crear un ticket de soporte (cliente).
class CreateTicketScreen extends ConsumerStatefulWidget {
  const CreateTicketScreen({super.key, this.soldUnitId});

  /// Unidad asociada, si se llega desde el detalle de una unidad.
  final int? soldUnitId;

  @override
  ConsumerState<CreateTicketScreen> createState() => _CreateTicketScreenState();
}

class _CreateTicketScreenState extends ConsumerState<CreateTicketScreen> {
  final _formKey = GlobalKey<FormState>();
  final _subject = TextEditingController();
  final _description = TextEditingController();
  TicketCategory _category = TicketCategory.consulta;
  TicketPriority _priority = TicketPriority.media;
  int? _soldUnitId;
  bool _submitting = false;

  @override
  void initState() {
    super.initState();
    _soldUnitId = widget.soldUnitId;
  }

  @override
  void dispose() {
    _subject.dispose();
    _description.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate() || _submitting) return;
    setState(() => _submitting = true);
    try {
      await ref.read(ticketsRepositoryProvider).create(
            soldUnitId: _soldUnitId,
            category: _category,
            priority: _priority,
            subject: _subject.text.trim(),
            description: _description.text.trim(),
          );
      ref.read(ticketsControllerProvider.notifier).refresh();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ticket creado.')),
        );
        Navigator.of(context).pop();
      }
    } on ApiException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.displayMessage)));
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No se pudo crear el ticket.')),
        );
      }
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo ticket')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _UnitSelector(
              selectedId: _soldUnitId,
              onChanged: (id) => setState(() => _soldUnitId = id),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<TicketCategory>(
              initialValue: _category,
              decoration: const InputDecoration(
                labelText: 'Categoría',
                border: OutlineInputBorder(),
              ),
              items: [
                for (final c in TicketCategory.values)
                  DropdownMenuItem(value: c, child: Text(c.label)),
              ],
              onChanged: (v) => setState(() => _category = v ?? _category),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<TicketPriority>(
              initialValue: _priority,
              decoration: const InputDecoration(
                labelText: 'Prioridad',
                border: OutlineInputBorder(),
              ),
              items: [
                for (final p in TicketPriority.values)
                  DropdownMenuItem(value: p, child: Text(p.label)),
              ],
              onChanged: (v) => setState(() => _priority = v ?? _priority),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _subject,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                labelText: 'Asunto',
                border: OutlineInputBorder(),
              ),
              validator: (v) =>
                  (v == null || v.trim().length < 5) ? 'Mínimo 5 caracteres' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _description,
              textCapitalization: TextCapitalization.sentences,
              minLines: 4,
              maxLines: 8,
              decoration: const InputDecoration(
                labelText: 'Descripción',
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
              ),
              validator: (v) =>
                  (v == null || v.trim().length < 10) ? 'Describe el problema' : null,
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: _submitting ? null : _submit,
              child: _submitting
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Crear ticket'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Selector opcional de la unidad asociada al ticket. Lista las unidades del
/// cliente; "General" deja el ticket sin unidad.
class _UnitSelector extends ConsumerWidget {
  const _UnitSelector({required this.selectedId, required this.onChanged});

  final int? selectedId;
  final ValueChanged<int?> onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unitsAsync = ref.watch(clientUnitsForPickerProvider);
    return unitsAsync.when(
      loading: () => const InputDecorator(
        decoration: InputDecoration(
          labelText: 'Unidad (opcional)',
          border: OutlineInputBorder(),
        ),
        child: Row(
          children: [
            SizedBox(
              height: 16,
              width: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            SizedBox(width: 12),
            Text('Cargando unidades…'),
          ],
        ),
      ),
      error: (_, _) => const SizedBox.shrink(),
      data: (units) {
        // Si la unidad preseleccionada no está en la lista, no forzamos valor.
        final hasSelected = units.any((u) => u.id == selectedId);
        return DropdownButtonFormField<int?>(
          initialValue: hasSelected ? selectedId : null,
          isExpanded: true,
          decoration: const InputDecoration(
            labelText: 'Unidad (opcional)',
            helperText: 'Asocia el ticket a una de tus unidades.',
            border: OutlineInputBorder(),
          ),
          items: [
            const DropdownMenuItem<int?>(
              value: null,
              child: Text('General (sin unidad)'),
            ),
            for (final u in units)
              DropdownMenuItem<int?>(
                value: u.id,
                child: Text(
                  u.productName ?? 'Unidad #${u.id ?? '—'}',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
          ],
          onChanged: onChanged,
        );
      },
    );
  }
}
