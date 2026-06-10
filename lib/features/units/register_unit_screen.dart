import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mastercolor_api/mastercolor_api.dart';

import '../../core/network/api_exception.dart';
import 'unit_presentation.dart' show formatDate, ProductThumb;
import 'units_controller.dart';
import 'units_repository.dart';

/// Registro manual de una unidad: producto MasterColor comprado fuera del canal
/// online (tienda física, distribuidor…). Habilita garantía/soporte con
/// comprobante de compra.
class RegisterUnitScreen extends ConsumerStatefulWidget {
  const RegisterUnitScreen({super.key});

  @override
  ConsumerState<RegisterUnitScreen> createState() => _RegisterUnitScreenState();
}

class _RegisterUnitScreenState extends ConsumerState<RegisterUnitScreen> {
  final _serial = TextEditingController();
  ClientProduct? _product;
  DateTime? _purchaseDate;
  XFile? _proof;
  bool _submitting = false;
  String? _error;

  @override
  void dispose() {
    _serial.dispose();
    super.dispose();
  }

  Future<void> _pickProduct() async {
    final selected = await showModalBottomSheet<ClientProduct>(
      context: context,
      isScrollControlled: true,
      builder: (_) => const _ProductPickerSheet(),
    );
    if (selected != null) setState(() => _product = selected);
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _purchaseDate ?? now,
      firstDate: DateTime(now.year - 10),
      lastDate: now,
      helpText: 'Fecha de compra',
    );
    if (picked != null) setState(() => _purchaseDate = picked);
  }

  Future<void> _pickProof() async {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img != null) setState(() => _proof = img);
  }

  Future<void> _submit() async {
    if (_product == null) {
      setState(() => _error = 'Selecciona el producto.');
      return;
    }
    if (_purchaseDate == null) {
      setState(() => _error = 'Indica la fecha de compra.');
      return;
    }
    setState(() {
      _submitting = true;
      _error = null;
    });
    try {
      await ref.read(unitsRepositoryProvider).registerUnit(
            productId: _product!.id!,
            purchaseDate: _purchaseDate!,
            serialNumber: _serial.text,
            proofFile: _proof,
          );
      ref.read(unitsControllerProvider.notifier).refresh();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Unidad registrada.')),
        );
        Navigator.of(context).pop();
      }
    } on ApiException catch (e) {
      setState(() => _error = e.displayMessage);
    } catch (_) {
      setState(() => _error = 'No se pudo registrar la unidad. Intenta de nuevo.');
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrar unidad')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Registra un producto MasterColor que compraste fuera de la tienda '
            'online para activar su garantía y soporte.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 16),

          // Producto
          _FieldCard(
            label: 'Producto',
            onTap: _pickProduct,
            child: _product == null
                ? const Text('Seleccionar producto MasterColor…',
                    style: TextStyle(color: Colors.grey))
                : Row(
                    children: [
                      ProductThumb(imageUrl: _product!.imageUrl, size: 44),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_product!.name ?? 'Producto',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600)),
                            const SizedBox(height: 2),
                            Text(
                              [
                                if (_product!.sku != null)
                                  'SKU ${_product!.sku}',
                                if (_product!.warrantyMonths != null)
                                  'Garantía ${_product!.warrantyMonths} meses',
                              ].join(' · '),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
          const SizedBox(height: 12),

          // Fecha de compra
          _FieldCard(
            label: 'Fecha de compra',
            onTap: _pickDate,
            trailing: const Icon(Icons.calendar_today, size: 18),
            child: Text(
              _purchaseDate == null ? 'Seleccionar fecha…' : formatDate(_purchaseDate),
              style: TextStyle(
                color: _purchaseDate == null ? Colors.grey : null,
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Número de serie (opcional)
          TextField(
            controller: _serial,
            decoration: const InputDecoration(
              labelText: 'Número de serie (opcional)',
              helperText: 'Déjalo vacío si el producto no es serializado.',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),

          // Comprobante (opcional)
          _FieldCard(
            label: 'Comprobante de compra (opcional)',
            onTap: _pickProof,
            trailing: Icon(_proof == null ? Icons.upload_file : Icons.check_circle,
                size: 18, color: _proof == null ? null : Colors.green),
            child: Text(
              _proof?.name ?? 'Adjuntar imagen (jpg/png/webp)…',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: _proof == null ? Colors.grey : null),
            ),
          ),

          if (_error != null) ...[
            const SizedBox(height: 16),
            Text(_error!,
                style: TextStyle(color: Theme.of(context).colorScheme.error)),
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
                : const Text('Registrar unidad'),
          ),
        ],
      ),
    );
  }
}

/// Tarjeta tipo "campo" tappable con etiqueta arriba y contenido debajo.
class _FieldCard extends StatelessWidget {
  const _FieldCard({
    required this.label,
    required this.child,
    required this.onTap,
    this.trailing,
  });

  final String label;
  final Widget child;
  final VoidCallback onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Theme.of(context).dividerColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(label,
                        style: TextStyle(
                            fontSize: 12, color: Theme.of(context).hintColor)),
                    const SizedBox(height: 4),
                    child,
                  ],
                ),
              ),
              trailing ?? const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}

/// Hoja de selección de producto con búsqueda en el catálogo.
class _ProductPickerSheet extends ConsumerStatefulWidget {
  const _ProductPickerSheet();

  @override
  ConsumerState<_ProductPickerSheet> createState() => _ProductPickerSheetState();
}

class _ProductPickerSheetState extends ConsumerState<_ProductPickerSheet> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final results = ref.watch(productSearchProvider(_query));
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return Padding(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.7,
        maxChildSize: 0.9,
        builder: (_, scrollController) => Column(
          children: [
            const SizedBox(height: 8),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                autofocus: true,
                textInputAction: TextInputAction.search,
                onChanged: (v) => setState(() => _query = v),
                decoration: const InputDecoration(
                  hintText: 'Buscar producto por nombre o SKU',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
              ),
            ),
            Expanded(
              child: results.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      e is ApiException
                          ? e.displayMessage
                          : 'No se pudo cargar el catálogo.',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                data: (products) => products.isEmpty
                    ? const Center(child: Text('Sin resultados.'))
                    : ListView.separated(
                        controller: scrollController,
                        itemCount: products.length,
                        separatorBuilder: (_, _) => const Divider(height: 1),
                        itemBuilder: (_, i) {
                          final p = products[i];
                          return ListTile(
                            leading: ProductThumb(imageUrl: p.imageUrl, size: 48),
                            title: Text(p.name ?? 'Producto #${p.id ?? '—'}'),
                            subtitle: Text([
                              if (p.sku != null) 'SKU ${p.sku}',
                              if (p.warrantyMonths != null)
                                'Garantía ${p.warrantyMonths} meses',
                            ].join(' · ')),
                            onTap: () => Navigator.of(context).pop(p),
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
