import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/api_exception.dart';
import 'tickets_repository.dart';

/// Abre el diálogo para buscar un repuesto en inventario y registrar su consumo
/// en el ticket. Devuelve true si se registró.
Future<bool> showAddPartDialog(BuildContext context,
    {required int ticketId}) async {
  return await showDialog<bool>(
        context: context,
        builder: (_) => _AddPartDialog(ticketId: ticketId),
      ) ??
      false;
}

class _AddPartDialog extends ConsumerStatefulWidget {
  const _AddPartDialog({required this.ticketId});

  final int ticketId;

  @override
  ConsumerState<_AddPartDialog> createState() => _AddPartDialogState();
}

class _AddPartDialogState extends ConsumerState<_AddPartDialog> {
  final _search = TextEditingController();
  final _quantity = TextEditingController(text: '1');
  List<StockPart> _results = const [];
  StockPart? _selected;
  bool _searching = false;
  bool _submitting = false;
  String? _error;

  @override
  void dispose() {
    _search.dispose();
    _quantity.dispose();
    super.dispose();
  }

  Future<void> _runSearch() async {
    final term = _search.text.trim();
    setState(() {
      _searching = true;
      _error = null;
    });
    try {
      final res = await ref
          .read(ticketsRepositoryProvider)
          .searchParts(search: term.isEmpty ? null : term);
      setState(() => _results = res);
    } on ApiException catch (e) {
      setState(() => _error = e.displayMessage);
    } catch (_) {
      setState(() => _error = 'No se pudo buscar repuestos.');
    } finally {
      if (mounted) setState(() => _searching = false);
    }
  }

  Future<void> _submit() async {
    final selected = _selected;
    if (selected?.stockId == null) return;
    final qty = int.tryParse(_quantity.text.trim()) ?? 0;
    if (qty < 1) {
      setState(() => _error = 'Cantidad inválida.');
      return;
    }
    setState(() {
      _submitting = true;
      _error = null;
    });
    try {
      await ref.read(ticketsRepositoryProvider).addPart(
            id: widget.ticketId,
            stockId: selected!.stockId!,
            quantity: qty,
            unitCost: selected.purchasePrice,
          );
      if (mounted) Navigator.of(context).pop(true);
    } on ApiException catch (e) {
      setState(() => _error = e.displayMessage);
    } catch (_) {
      setState(() => _error = 'No se pudo registrar el repuesto.');
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final selected = _selected;
    return AlertDialog(
      title: const Text('Agregar repuesto'),
      content: SizedBox(
        width: double.maxFinite,
        child: selected != null
            ? _quantityStep(selected)
            : _searchStep(),
      ),
      actions: [
        TextButton(
          onPressed: _submitting ? null : () => Navigator.of(context).pop(false),
          child: const Text('Cancelar'),
        ),
        if (selected != null) ...[
          TextButton(
            onPressed:
                _submitting ? null : () => setState(() => _selected = null),
            child: const Text('Cambiar'),
          ),
          FilledButton(
            onPressed: _submitting ? null : _submit,
            child: _submitting
                ? const SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('Agregar'),
          ),
        ],
      ],
    );
  }

  Widget _searchStep() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _search,
          autofocus: true,
          textInputAction: TextInputAction.search,
          onSubmitted: (_) => _runSearch(),
          decoration: InputDecoration(
            hintText: 'Buscar (nombre o SKU)…',
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
              icon: const Icon(Icons.search),
              onPressed: _searching ? null : _runSearch,
            ),
          ),
        ),
        const SizedBox(height: 12),
        if (_searching)
          const Padding(
            padding: EdgeInsets.all(16),
            child: CircularProgressIndicator(),
          )
        else if (_error != null)
          Text(_error!,
              style: TextStyle(color: Theme.of(context).colorScheme.error))
        else if (_results.isEmpty)
          const Text('Busca un repuesto del inventario.')
        else
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 280),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _results.length,
              itemBuilder: (_, i) {
                final p = _results[i];
                final qty = p.availableQty ?? 0;
                return ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: Text(p.productName ?? 'Repuesto'),
                  subtitle: Text(
                    [
                      if (p.sku != null) p.sku,
                      'stock: $qty',
                      if (p.purchasePrice != null)
                        'S/ ${p.purchasePrice!.toStringAsFixed(2)}',
                    ].whereType<String>().join(' · '),
                  ),
                  enabled: qty > 0,
                  onTap: qty > 0
                      ? () => setState(() {
                            _selected = p;
                            _error = null;
                          })
                      : null,
                );
              },
            ),
          ),
      ],
    );
  }

  Widget _quantityStep(StockPart part) {
    final max = part.availableQty ?? 0;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(part.productName ?? 'Repuesto',
            style: Theme.of(context).textTheme.titleMedium),
        if (part.sku != null)
          Text(part.sku!, style: Theme.of(context).textTheme.bodySmall),
        Text('Disponible: $max',
            style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 16),
        TextField(
          controller: _quantity,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: const InputDecoration(
            labelText: 'Cantidad',
            border: OutlineInputBorder(),
          ),
        ),
        if (_error != null) ...[
          const SizedBox(height: 8),
          Text(_error!,
              style: TextStyle(color: Theme.of(context).colorScheme.error)),
        ],
      ],
    );
  }
}
