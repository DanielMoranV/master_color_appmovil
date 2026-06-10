import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mastercolor_api/mastercolor_api.dart';

import '../../core/network/api_exception.dart';
import '../units/unit_presentation.dart';
import 'staff_units_controller.dart';

/// Listado de unidades para staff, con búsqueda por número de serie.
class StaffUnitsScreen extends ConsumerWidget {
  const StaffUnitsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unitsAsync = ref.watch(staffUnitsControllerProvider);
    final controller = ref.read(staffUnitsControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/staff'),
        ),
        title: const Text('Unidades'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
            child: _SerialSearch(
              initial: controller.serial,
              onSubmit: controller.setSerial,
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: RefreshIndicator(
              onRefresh: controller.refresh,
              child: unitsAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, _) => _ErrorView(
                  message: err is ApiException
                      ? err.displayMessage
                      : 'No se pudieron cargar las unidades.',
                  onRetry: controller.refresh,
                ),
                data: (paged) => _UnitsList(
                  units: paged.items,
                  isLoadingMore: paged.isLoadingMore,
                  onLoadMore: controller.loadMore,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SerialSearch extends StatefulWidget {
  const _SerialSearch({required this.initial, required this.onSubmit});

  final String? initial;
  final ValueChanged<String?> onSubmit;

  @override
  State<_SerialSearch> createState() => _SerialSearchState();
}

class _SerialSearchState extends State<_SerialSearch> {
  late final TextEditingController _ctrl =
      TextEditingController(text: widget.initial);

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _ctrl,
      textInputAction: TextInputAction.search,
      onSubmitted: widget.onSubmit,
      decoration: InputDecoration(
        hintText: 'Buscar por número de serie',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            _ctrl.clear();
            widget.onSubmit(null);
          },
        ),
        isDense: true,
        border: const OutlineInputBorder(),
      ),
    );
  }
}

class _UnitsList extends StatefulWidget {
  const _UnitsList({
    required this.units,
    required this.isLoadingMore,
    required this.onLoadMore,
  });

  final List<SoldUnit> units;
  final bool isLoadingMore;
  final Future<void> Function() onLoadMore;

  @override
  State<_UnitsList> createState() => _UnitsListState();
}

class _UnitsListState extends State<_UnitsList> {
  final _scroll = ScrollController();

  @override
  void initState() {
    super.initState();
    _scroll.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scroll.removeListener(_onScroll);
    _scroll.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scroll.position.pixels >= _scroll.position.maxScrollExtent - 300) {
      widget.onLoadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.units.isEmpty) {
      return ListView(
        children: const [
          SizedBox(height: 120),
          Center(child: Text('No se encontraron unidades.')),
        ],
      );
    }
    final count = widget.units.length + (widget.isLoadingMore ? 1 : 0);
    return ListView.separated(
      controller: _scroll,
      padding: const EdgeInsets.all(12),
      itemCount: count,
      separatorBuilder: (_, _) => const SizedBox(height: 8),
      itemBuilder: (_, i) {
        if (i >= widget.units.length) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        return _UnitCard(unit: widget.units[i]);
      },
    );
  }
}

class _UnitCard extends StatelessWidget {
  const _UnitCard({required this.unit});

  final SoldUnit unit;

  @override
  Widget build(BuildContext context) {
    final id = unit.id;
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: id == null ? null : () => context.push('/staff/units/$id'),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductThumb(imageUrl: unit.imageUrl),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            unit.productName ??
                                'Producto #${unit.productId ?? '—'}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        if (unit.status != null)
                          StatusChip(
                            label: unit.status!.label,
                            color: unit.status!.color,
                          ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Serie: ${unit.serialNumber ?? '—'}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      'Cliente #${unit.clientId ?? '—'} · Compra ${formatDate(unit.purchaseDate)}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message, required this.onRetry});

  final String message;
  final Future<void> Function() onRetry;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 100),
        Icon(Icons.error_outline,
            size: 56, color: Theme.of(context).colorScheme.error),
        const SizedBox(height: 12),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(message, textAlign: TextAlign.center),
          ),
        ),
        const SizedBox(height: 12),
        Center(
          child: FilledButton.tonal(
            onPressed: onRetry,
            child: const Text('Reintentar'),
          ),
        ),
      ],
    );
  }
}
