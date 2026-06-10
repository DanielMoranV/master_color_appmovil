import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/auth/current_user.dart';
import '../../core/network/api_exception.dart';
import 'tickets_controller.dart';
import 'tickets_repository.dart';

/// Abre el diálogo de asignación. Devuelve true si se asignó correctamente.
Future<bool> showAssignDialog(BuildContext context, {required int ticketId}) async {
  return await showDialog<bool>(
        context: context,
        builder: (_) => _AssignDialog(ticketId: ticketId),
      ) ??
      false;
}

/// Abre el diálogo de diagnóstico/cierre. Devuelve true si se registró.
Future<bool> showDiagnosisDialog(BuildContext context,
    {required int ticketId}) async {
  return await showDialog<bool>(
        context: context,
        builder: (_) => _DiagnosisDialog(ticketId: ticketId),
      ) ??
      false;
}

const _manualSentinel = -1;

class _AssignDialog extends ConsumerStatefulWidget {
  const _AssignDialog({required this.ticketId});

  final int ticketId;

  @override
  ConsumerState<_AssignDialog> createState() => _AssignDialogState();
}

class _AssignDialogState extends ConsumerState<_AssignDialog> {
  int? _selected;
  final _manualId = TextEditingController();
  bool _submitting = false;
  String? _error;

  @override
  void dispose() {
    _manualId.dispose();
    super.dispose();
  }

  int? get _resolvedUserId {
    if (_selected == _manualSentinel) {
      return int.tryParse(_manualId.text.trim());
    }
    return _selected;
  }

  Future<void> _submit() async {
    final userId = _resolvedUserId;
    if (userId == null) {
      setState(() => _error = 'Selecciona o escribe un ID de técnico válido.');
      return;
    }
    await _assignTo(userId);
  }

  Future<void> _assignTo(int userId) async {
    setState(() {
      _submitting = true;
      _error = null;
    });
    try {
      await ref
          .read(ticketsRepositoryProvider)
          .assign(id: widget.ticketId, assignedUserId: userId);
      if (mounted) Navigator.of(context).pop(true);
    } on ApiException catch (e) {
      setState(() => _error = e.displayMessage);
    } catch (_) {
      setState(() => _error = 'No se pudo asignar el ticket.');
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final techs = ref.watch(assignableTechniciansProvider);
    final me = ref.watch(currentUserProvider).asData?.value;
    return AlertDialog(
      title: const Text('Asignar técnico'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (me != null) ...[
            Align(
              alignment: Alignment.centerLeft,
              child: FilledButton.tonalIcon(
                onPressed: _submitting ? null : () => _assignTo(me.id),
                icon: const Icon(Icons.person_pin_circle_outlined),
                label: Text('Asignarme a mí (${me.name})'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Row(children: [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text('o', style: TextStyle(color: Colors.grey)),
                ),
                Expanded(child: Divider()),
              ]),
            ),
          ],
          techs.when(
            loading: () => const Padding(
              padding: EdgeInsets.all(8),
              child: CircularProgressIndicator(),
            ),
            error: (_, _) => const Text(
                'No se pudo cargar la lista; usa el ID manual.'),
            data: (list) => DropdownButtonFormField<int>(
              initialValue: _selected,
              isExpanded: true,
              decoration: const InputDecoration(
                labelText: 'Técnico',
                border: OutlineInputBorder(),
              ),
              items: [
                for (final t in list)
                  DropdownMenuItem(
                    value: t.id,
                    child: Text(
                      '${t.name ?? 'Técnico'} (#${t.id ?? '—'})',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                const DropdownMenuItem(
                  value: _manualSentinel,
                  child: Text('Otro (ID manual)…'),
                ),
              ],
              onChanged: (v) => setState(() => _selected = v),
            ),
          ),
          if (_selected == _manualSentinel) ...[
            const SizedBox(height: 12),
            TextField(
              controller: _manualId,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'ID de técnico',
                border: OutlineInputBorder(),
              ),
            ),
          ],
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
              : const Text('Asignar'),
        ),
      ],
    );
  }
}

class _DiagnosisDialog extends ConsumerStatefulWidget {
  const _DiagnosisDialog({required this.ticketId});

  final int ticketId;

  @override
  ConsumerState<_DiagnosisDialog> createState() => _DiagnosisDialogState();
}

class _DiagnosisDialogState extends ConsumerState<_DiagnosisDialog> {
  final _diagnosis = TextEditingController();
  final _parts = TextEditingController();
  bool _resolve = false;
  bool _submitting = false;
  String? _error;

  @override
  void dispose() {
    _diagnosis.dispose();
    _parts.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final diagnosis = _diagnosis.text.trim();
    if (diagnosis.length < 10) {
      setState(() => _error = 'Describe el diagnóstico (mín. 10 caracteres).');
      return;
    }
    setState(() {
      _submitting = true;
      _error = null;
    });
    try {
      await ref.read(ticketsRepositoryProvider).diagnose(
            id: widget.ticketId,
            diagnosis: diagnosis,
            partsUsed: _parts.text.trim().isEmpty ? null : _parts.text.trim(),
            resolve: _resolve,
          );
      if (mounted) Navigator.of(context).pop(true);
    } on ApiException catch (e) {
      setState(() => _error = e.displayMessage);
    } catch (_) {
      setState(() => _error = 'No se pudo registrar el diagnóstico.');
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Diagnóstico'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _diagnosis,
              minLines: 3,
              maxLines: 6,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                labelText: 'Diagnóstico técnico',
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _parts,
              minLines: 1,
              maxLines: 3,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                labelText: 'Repuestos usados (opcional)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              value: _resolve,
              onChanged: (v) => setState(() => _resolve = v),
              title: const Text('Marcar como resuelto'),
              subtitle: const Text('Cierra el servicio del ticket.'),
            ),
            if (_error != null)
              Text(_error!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error)),
          ],
        ),
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
              : Text(_resolve ? 'Guardar y resolver' : 'Guardar'),
        ),
      ],
    );
  }
}
