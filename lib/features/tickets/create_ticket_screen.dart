import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mastercolor_api/mastercolor_api.dart';

import '../../core/auth/session.dart';
import '../../core/network/api_exception.dart';
import '../addresses/addresses_repository.dart';
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
  TicketCreateRequestServiceTypeEnum _serviceType =
      TicketCreateRequestServiceTypeEnum.remoto;
  int? _soldUnitId;
  int? _serviceAddressId;
  final List<XFile> _attachments = [];
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

  /// Selecciona fotos y/o videos cortos de la avería (opcional). Un mismo
  /// selector permite elegir imágenes y videos a la vez.
  Future<void> _pickAttachments() async {
    if (_submitting) return;
    try {
      final picked = await ImagePicker().pickMultipleMedia();
      if (picked.isEmpty) return;
      setState(() => _attachments.addAll(picked));
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No se pudo abrir la galería.')),
        );
      }
    }
  }

  void _removeAttachment(XFile file) {
    setState(() => _attachments.remove(file));
  }

  bool _isVideo(XFile f) {
    final mime = f.mimeType;
    if (mime != null) return mime.startsWith('video/');
    final name = f.name.toLowerCase();
    return name.endsWith('.mp4') ||
        name.endsWith('.mov') ||
        name.endsWith('.avi') ||
        name.endsWith('.mkv') ||
        name.endsWith('.webm') ||
        name.endsWith('.3gp');
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate() || _submitting) return;
    // Para servicio a domicilio, la dirección es obligatoria.
    if (_serviceType == TicketCreateRequestServiceTypeEnum.domicilio &&
        _serviceAddressId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Selecciona la dirección para el servicio a domicilio.'),
        ),
      );
      return;
    }
    setState(() => _submitting = true);
    try {
      final ticket = await ref.read(ticketsRepositoryProvider).create(
            soldUnitId: _soldUnitId,
            category: _category,
            priority: _priority,
            subject: _subject.text.trim(),
            description: _description.text.trim(),
            serviceType: _serviceType,
            serviceAddressId:
                _serviceType == TicketCreateRequestServiceTypeEnum.domicilio
                    ? _serviceAddressId
                    : null,
          );
      // El ticket ya está creado: los adjuntos son un paso opcional posterior.
      // Si su subida falla, no perdemos el ticket; se pueden añadir desde el detalle.
      var successMsg = 'Ticket creado.';
      if (_attachments.isNotEmpty && ticket.id != null) {
        try {
          await ref.read(ticketsRepositoryProvider).addAttachments(
                role: UserRole.client,
                id: ticket.id!,
                files: _attachments,
              );
        } catch (_) {
          successMsg =
              'Ticket creado, pero no se pudieron subir los adjuntos. Agrégalos desde el detalle.';
        }
      }
      ref.read(ticketsControllerProvider.notifier).refresh();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(successMsg)),
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
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Tipo de servicio',
                  style: Theme.of(context).textTheme.labelLarge),
            ),
            const SizedBox(height: 8),
            SegmentedButton<TicketCreateRequestServiceTypeEnum>(
              segments: [
                for (final t in TicketCreateRequestServiceTypeEnum.values)
                  ButtonSegment(value: t, label: Text(t.label)),
              ],
              selected: {_serviceType},
              showSelectedIcon: false,
              onSelectionChanged: (s) =>
                  setState(() => _serviceType = s.first),
            ),
            if (_serviceType ==
                TicketCreateRequestServiceTypeEnum.domicilio) ...[
              const SizedBox(height: 16),
              _AddressSelector(
                selectedId: _serviceAddressId,
                onChanged: (id) => setState(() => _serviceAddressId = id),
              ),
            ],
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
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Adjuntos (opcional)',
                  style: Theme.of(context).textTheme.labelLarge),
            ),
            const SizedBox(height: 4),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Agrega fotos o videos cortos de la avería.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: OutlinedButton.icon(
                onPressed: _submitting ? null : _pickAttachments,
                icon: const Icon(Icons.attach_file),
                label: const Text('Agregar fotos o video'),
              ),
            ),
            if (_attachments.isNotEmpty) ...[
              const SizedBox(height: 12),
              SizedBox(
                height: 92,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _attachments.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 8),
                  itemBuilder: (context, i) => _AttachmentThumb(
                    file: _attachments[i],
                    isVideo: _isVideo(_attachments[i]),
                    onRemove: () => _removeAttachment(_attachments[i]),
                  ),
                ),
              ),
            ],
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

/// Miniatura de un adjunto seleccionado (imagen o video) con botón para
/// quitarlo antes de enviar.
class _AttachmentThumb extends StatelessWidget {
  const _AttachmentThumb({
    required this.file,
    required this.isVideo,
    required this.onRemove,
  });

  final XFile file;
  final bool isVideo;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            width: 92,
            height: 92,
            child: isVideo
                ? Container(
                    color: Colors.black87,
                    child: const Center(
                      child: Icon(Icons.play_circle_outline,
                          color: Colors.white, size: 32),
                    ),
                  )
                : Image.file(File(file.path), fit: BoxFit.cover),
          ),
        ),
        Positioned(
          top: 2,
          right: 2,
          child: GestureDetector(
            onTap: onRemove,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black54,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(2),
              child: const Icon(Icons.close, color: Colors.white, size: 16),
            ),
          ),
        ),
      ],
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

/// Selector de la dirección a la que irá el técnico (servicio a domicilio).
/// Las direcciones se gestionan fuera de la app (el contrato solo las lista).
class _AddressSelector extends ConsumerWidget {
  const _AddressSelector({required this.selectedId, required this.onChanged});

  final int? selectedId;
  final ValueChanged<int?> onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addressesAsync = ref.watch(clientAddressesProvider);
    return addressesAsync.when(
      loading: () => const InputDecorator(
        decoration: InputDecoration(
          labelText: 'Dirección del servicio',
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
            Text('Cargando direcciones…'),
          ],
        ),
      ),
      error: (e, _) => InputDecorator(
        decoration: const InputDecoration(
          labelText: 'Dirección del servicio',
          border: OutlineInputBorder(),
        ),
        child: Row(
          children: [
            const Expanded(child: Text('No se pudieron cargar las direcciones.')),
            TextButton(
              onPressed: () => ref.invalidate(clientAddressesProvider),
              child: const Text('Reintentar'),
            ),
          ],
        ),
      ),
      data: (addresses) {
        if (addresses.isEmpty) {
          return const InputDecorator(
            decoration: InputDecoration(
              labelText: 'Dirección del servicio',
              border: OutlineInputBorder(),
            ),
            child: Text('No tienes direcciones registradas.'),
          );
        }
        final hasSelected = addresses.any((a) => a.id == selectedId);
        return DropdownButtonFormField<int?>(
          initialValue: hasSelected ? selectedId : null,
          isExpanded: true,
          decoration: const InputDecoration(
            labelText: 'Dirección del servicio',
            helperText: 'A dónde irá el técnico.',
            border: OutlineInputBorder(),
          ),
          validator: (v) => v == null ? 'Selecciona una dirección' : null,
          items: [
            for (final a in addresses)
              DropdownMenuItem<int?>(
                value: a.id,
                child: Text(
                  a.addressFull ?? 'Dirección #${a.id ?? '—'}',
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
