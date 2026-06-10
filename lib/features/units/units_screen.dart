import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mastercolor_api/mastercolor_api.dart';

import '../../core/auth/auth_controller.dart';
import '../../core/auth/current_user.dart';
import '../../core/network/api_exception.dart';
import 'unit_presentation.dart';
import 'units_controller.dart';

/// Mis unidades + garantía (cliente). Home del área cliente.
class UnitsScreen extends ConsumerWidget {
  const UnitsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unitsAsync = ref.watch(unitsControllerProvider);
    final controller = ref.read(unitsControllerProvider.notifier);
    final name = ref.watch(currentUserProvider).asData?.value?.name;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name == null ? 'Mis unidades' : 'Hola, $name'),
            if (name != null)
              Text(
                'Mis unidades',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white70,
                    ),
              ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.confirmation_number_outlined),
            tooltip: 'Tickets',
            onPressed: () => context.go('/client/tickets'),
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Cerrar sesión',
            onPressed: () => ref.read(authControllerProvider.notifier).logout(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/client/units/new'),
        icon: const Icon(Icons.add),
        label: const Text('Registrar'),
      ),
      body: Column(
        children: [
          _StatusFilterBar(
            selected: controller.status,
            onChanged: controller.setFilter,
          ),
          _WarrantyFilterBar(
            selected: controller.warranty,
            onChanged: controller.setWarranty,
          ),
          const Divider(height: 1),
          Expanded(
            child: RefreshIndicator(
              onRefresh: controller.refresh,
              child: unitsAsync.when(
                data: (paged) => _UnitsList(
                  units: paged.items,
                  isLoadingMore: paged.isLoadingMore,
                  onLoadMore: controller.loadMore,
                ),
                error: (err, _) => _ErrorView(
                  message: err is ApiException
                      ? err.displayMessage
                      : 'No se pudieron cargar las unidades.',
                  onRetry: controller.refresh,
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusFilterBar extends StatelessWidget {
  const _StatusFilterBar({required this.selected, required this.onChanged});

  final SoldUnitStatus? selected;
  final ValueChanged<SoldUnitStatus?> onChanged;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          _chip(context, label: 'Todas', value: null),
          for (final status in SoldUnitStatus.values)
            _chip(context, label: status.label, value: status),
        ],
      ),
    );
  }

  Widget _chip(
    BuildContext context, {
    required String label,
    required SoldUnitStatus? value,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: selected == value,
        onSelected: (_) => onChanged(value),
      ),
    );
  }
}

/// Filtro por estado de garantía: vigente / vencida (el backend solo admite
/// esos dos valores).
class _WarrantyFilterBar extends StatelessWidget {
  const _WarrantyFilterBar({required this.selected, required this.onChanged});

  final String? selected;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 8),
            child: Center(
              child: Text('Garantía:', style: TextStyle(color: Colors.grey)),
            ),
          ),
          _chip(label: 'Todas', value: null),
          _chip(label: 'Vigente', value: 'vigente'),
          _chip(label: 'Vencida', value: 'vencida'),
        ],
      ),
    );
  }

  Widget _chip({required String label, required String? value}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: selected == value,
        onSelected: (_) => onChanged(value),
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
      // ListView para que el pull-to-refresh siga funcionando aún vacío.
      return ListView(
        children: const [
          SizedBox(height: 120),
          Center(child: Text('No tienes unidades registradas.')),
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
        onTap: id == null ? null : () => context.push('/client/units/$id'),
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
                      unit.productName ?? 'Producto #${unit.productId ?? '—'}',
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
              const SizedBox(height: 8),
              if (unit.serialNumber != null)
                _row(Icons.qr_code_2, 'Serie: ${unit.serialNumber}'),
              _row(Icons.event, 'Compra: ${formatDate(unit.purchaseDate)}'),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    unit.warrantyActive == true
                        ? Icons.verified_outlined
                        : Icons.shield_outlined,
                    size: 16,
                    color: unit.warrantyActive == true
                        ? Colors.green
                        : Colors.grey,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    unit.warrantyActive == true
                        ? 'Garantía vigente · vence ${formatDate(unit.warrantyExpiresAt)}'
                        : 'Sin garantía vigente',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
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

  Widget _row(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.grey),
          const SizedBox(width: 6),
          Expanded(child: Text(text)),
        ],
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
        Center(child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(message, textAlign: TextAlign.center),
        )),
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
