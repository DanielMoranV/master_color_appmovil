import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:signature/signature.dart';

import '../../core/network/api_exception.dart';
import '../tickets/tickets_repository.dart';

/// Acta de conformidad / reporte de servicio de una visita en sitio.
///
/// Captura el trabajo realizado, la firma del cliente (pad), fotos opcionales y
/// un interruptor para resolver el ticket. Al guardar genera el acta PDF en el
/// backend. Devuelve `true` por `Navigator.pop` si se registró.
class ServiceReportScreen extends ConsumerStatefulWidget {
  const ServiceReportScreen({super.key, required this.ticketId});

  final int ticketId;

  @override
  ConsumerState<ServiceReportScreen> createState() =>
      _ServiceReportScreenState();
}

class _ServiceReportScreenState extends ConsumerState<ServiceReportScreen> {
  final _formKey = GlobalKey<FormState>();
  final _workDone = TextEditingController();
  final _signedName = TextEditingController();
  final _signature = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );
  final List<XFile> _photos = [];
  bool _resolve = false;
  bool _submitting = false;

  @override
  void dispose() {
    _workDone.dispose();
    _signedName.dispose();
    _signature.dispose();
    super.dispose();
  }

  Future<void> _pickPhotos() async {
    final picked = await ImagePicker().pickMultiImage();
    if (picked.isNotEmpty) {
      setState(() => _photos.addAll(picked.take(10 - _photos.length)));
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate() || _submitting) return;
    setState(() => _submitting = true);
    try {
      final signaturePng =
          _signature.isNotEmpty ? await _signature.toPngBytes() : null;
      await ref.read(ticketsRepositoryProvider).serviceReport(
            id: widget.ticketId,
            workDone: _workDone.text.trim(),
            clientSignedName: _signedName.text.trim(),
            signaturePng: signaturePng,
            photos: _photos,
            resolve: _resolve,
          );
      if (mounted) Navigator.of(context).pop(true);
    } on ApiException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.displayMessage)));
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No se pudo registrar el acta.')),
        );
      }
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Acta de servicio')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _workDone,
              minLines: 3,
              maxLines: 6,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                labelText: 'Trabajo realizado',
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
              ),
              validator: (v) => (v == null || v.trim().length < 5)
                  ? 'Describe el trabajo realizado'
                  : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _signedName,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: 'Nombre de quien firma (cliente)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Firma del cliente',
                  style: Theme.of(context).textTheme.labelLarge),
            ),
            const SizedBox(height: 8),
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).dividerColor),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Signature(
                  controller: _signature,
                  height: 180,
                  backgroundColor: const Color(0xFFF5F5F5),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                icon: const Icon(Icons.clear, size: 18),
                label: const Text('Limpiar firma'),
                onPressed: () => _signature.clear(),
              ),
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              icon: const Icon(Icons.add_a_photo_outlined),
              label: Text(_photos.isEmpty
                  ? 'Agregar fotos (opcional)'
                  : '${_photos.length} foto(s) · agregar más'),
              onPressed: _photos.length >= 10 ? null : _pickPhotos,
            ),
            if (_photos.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (var i = 0; i < _photos.length; i++)
                      Chip(
                        label: Text('Foto ${i + 1}'),
                        onDeleted: () => setState(() => _photos.removeAt(i)),
                      ),
                  ],
                ),
              ),
            const SizedBox(height: 8),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              value: _resolve,
              onChanged: (v) => setState(() => _resolve = v),
              title: const Text('Marcar el ticket como resuelto'),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: _submitting ? null : _submit,
              child: _submitting
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Guardar acta'),
            ),
          ],
        ),
      ),
    );
  }
}
