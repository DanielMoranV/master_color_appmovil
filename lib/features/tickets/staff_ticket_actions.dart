import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

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

/// Abre el diálogo para crear la cotización del ticket (staff). Devuelve true
/// si se creó.
Future<bool> showQuoteDialog(BuildContext context,
    {required int ticketId}) async {
  return await showDialog<bool>(
        context: context,
        builder: (_) => _QuoteDialog(ticketId: ticketId),
      ) ??
      false;
}

/// Abre el diálogo de programación de la visita. [current] precarga la fecha/hora
/// si el ticket ya estaba programado. Devuelve true si se programó.
Future<bool> showScheduleDialog(
  BuildContext context, {
  required int ticketId,
  DateTime? current,
  int? currentWindowMinutes,
}) async {
  return await showDialog<bool>(
        context: context,
        builder: (_) => _ScheduleDialog(
          ticketId: ticketId,
          current: current,
          currentWindowMinutes: currentWindowMinutes,
        ),
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

// Especialidades disponibles para filtrar (valor de API → etiqueta).
const _specialtyOptions = <(String, String)>[
  ('garantia', 'Garantía'),
  ('instalacion', 'Instalación'),
  ('falla', 'Falla'),
  ('consulta', 'Consulta'),
  ('otro', 'Otro'),
];

class _AssignDialogState extends ConsumerState<_AssignDialog> {
  int? _selected;
  final _manualId = TextEditingController();
  final _zoneInput = TextEditingController();
  String? _filterSpecialty;
  String? _filterZone;
  bool _availableOnly = false;
  bool _submitting = false;
  String? _error;

  @override
  void dispose() {
    _manualId.dispose();
    _zoneInput.dispose();
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
    final techs = ref.watch(assignableTechniciansProvider((
      specialty: _filterSpecialty,
      zone: _filterZone,
      availableOnly: _availableOnly,
    )));
    final me = ref.watch(currentUserProvider).asData?.value;
    return AlertDialog(
      title: const Text('Asignar técnico'),
      content: SingleChildScrollView(
        child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Filtros para sugerir el técnico adecuado por especialidad/zona/
          // disponibilidad.
          DropdownButtonFormField<String?>(
            initialValue: _filterSpecialty,
            isExpanded: true,
            decoration: const InputDecoration(
              labelText: 'Especialidad',
              border: OutlineInputBorder(),
              isDense: true,
            ),
            items: [
              const DropdownMenuItem(value: null, child: Text('Todas')),
              for (final s in _specialtyOptions)
                DropdownMenuItem(value: s.$1, child: Text(s.$2)),
            ],
            onChanged: (v) => setState(() {
              _filterSpecialty = v;
              _selected = null;
            }),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _zoneInput,
            textInputAction: TextInputAction.search,
            onSubmitted: (v) => setState(() {
              _filterZone = v.trim().isEmpty ? null : v.trim();
              _selected = null;
            }),
            decoration: const InputDecoration(
              labelText: 'Zona (distrito)',
              hintText: 'Enter para filtrar',
              border: OutlineInputBorder(),
              isDense: true,
            ),
          ),
          const SizedBox(height: 4),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            dense: true,
            value: _availableOnly,
            onChanged: (v) => setState(() {
              _availableOnly = v;
              _selected = null;
            }),
            title: const Text('Solo disponibles'),
          ),
          const Divider(),
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

class _ScheduleDialog extends ConsumerStatefulWidget {
  const _ScheduleDialog({
    required this.ticketId,
    this.current,
    this.currentWindowMinutes,
  });

  final int ticketId;
  final DateTime? current;
  final int? currentWindowMinutes;

  @override
  ConsumerState<_ScheduleDialog> createState() => _ScheduleDialogState();
}

class _ScheduleDialogState extends ConsumerState<_ScheduleDialog> {
  static const _windows = [30, 60, 90, 120];
  static final _dateFormat = DateFormat('EEE d MMM yyyy', 'es');

  late DateTime _date;
  late TimeOfDay _time;
  late int _window;
  final _note = TextEditingController();
  bool _submitting = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    final base = widget.current?.toLocal() ??
        DateTime.now().add(const Duration(hours: 1));
    _date = DateTime(base.year, base.month, base.day);
    _time = TimeOfDay(hour: base.hour, minute: base.minute);
    _window = _windows.contains(widget.currentWindowMinutes)
        ? widget.currentWindowMinutes!
        : 60;
  }

  @override
  void dispose() {
    _note.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime.now().subtract(const Duration(days: 1)),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() => _date = DateTime(picked.year, picked.month, picked.day));
    }
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(context: context, initialTime: _time);
    if (picked != null) setState(() => _time = picked);
  }

  Future<void> _submit() async {
    setState(() {
      _submitting = true;
      _error = null;
    });
    final scheduledAt = DateTime(
      _date.year,
      _date.month,
      _date.day,
      _time.hour,
      _time.minute,
    );
    try {
      await ref.read(ticketsRepositoryProvider).schedule(
            id: widget.ticketId,
            scheduledAt: scheduledAt,
            windowMinutes: _window,
            note: _note.text,
          );
      if (mounted) Navigator.of(context).pop(true);
    } on ApiException catch (e) {
      setState(() => _error = e.displayMessage);
    } catch (_) {
      setState(() => _error = 'No se pudo programar la visita.');
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Programar visita'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.calendar_today_outlined),
              title: Text(_dateFormat.format(_date)),
              trailing: const Icon(Icons.edit, size: 18),
              onTap: _pickDate,
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.schedule),
              title: Text(_time.format(context)),
              trailing: const Icon(Icons.edit, size: 18),
              onTap: _pickTime,
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<int>(
              initialValue: _window,
              decoration: const InputDecoration(
                labelText: 'Ventana de atención',
                border: OutlineInputBorder(),
              ),
              items: [
                for (final w in _windows)
                  DropdownMenuItem(value: w, child: Text('$w minutos')),
              ],
              onChanged: (v) => setState(() => _window = v ?? _window),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _note,
              minLines: 1,
              maxLines: 3,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                labelText: 'Nota (opcional)',
                border: OutlineInputBorder(),
              ),
            ),
            if (_error != null) ...[
              const SizedBox(height: 8),
              Text(_error!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error)),
            ],
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
              : const Text('Programar'),
        ),
      ],
    );
  }
}

class _QuoteDialog extends ConsumerStatefulWidget {
  const _QuoteDialog({required this.ticketId});

  final int ticketId;

  @override
  ConsumerState<_QuoteDialog> createState() => _QuoteDialogState();
}

class _QuoteDialogState extends ConsumerState<_QuoteDialog> {
  final _labor = TextEditingController();
  final _parts = TextEditingController();
  final _note = TextEditingController();
  String _currency = 'PEN';
  bool _submitting = false;
  String? _error;

  static const _currencies = ['PEN', 'USD'];
  static final _decimal =
      FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}'));

  @override
  void dispose() {
    _labor.dispose();
    _parts.dispose();
    _note.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final labor = double.tryParse(_labor.text.trim());
    if (labor == null || labor < 0) {
      setState(() => _error = 'Ingresa el costo de mano de obra.');
      return;
    }
    final partsText = _parts.text.trim();
    final parts = partsText.isEmpty ? null : double.tryParse(partsText);
    setState(() {
      _submitting = true;
      _error = null;
    });
    try {
      await ref.read(ticketsRepositoryProvider).createQuote(
            id: widget.ticketId,
            laborCost: labor,
            partsCost: parts,
            currency: _currency,
            note: _note.text,
          );
      if (mounted) Navigator.of(context).pop(true);
    } on ApiException catch (e) {
      setState(() => _error = e.displayMessage);
    } catch (_) {
      setState(() => _error = 'No se pudo crear la cotización.');
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Crear cotización'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _labor,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [_decimal],
              decoration: const InputDecoration(
                labelText: 'Mano de obra',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _parts,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [_decimal],
              decoration: const InputDecoration(
                labelText: 'Repuestos (opcional)',
                helperText: 'Si se omite, se calcula de los repuestos.',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              initialValue: _currency,
              decoration: const InputDecoration(
                labelText: 'Moneda',
                border: OutlineInputBorder(),
              ),
              items: [
                for (final c in _currencies)
                  DropdownMenuItem(value: c, child: Text(c)),
              ],
              onChanged: (v) => setState(() => _currency = v ?? _currency),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _note,
              minLines: 1,
              maxLines: 3,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                labelText: 'Nota (opcional)',
                border: OutlineInputBorder(),
              ),
            ),
            if (_error != null) ...[
              const SizedBox(height: 8),
              Text(_error!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error)),
            ],
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
              : const Text('Enviar al cliente'),
        ),
      ],
    );
  }
}
