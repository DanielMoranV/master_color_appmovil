import 'package:flutter/material.dart';

import '../../shared/widgets/feature_placeholder.dart';

/// Mis unidades + garantía (cliente). Home del área cliente.
/// TODO(units): GET /client/units, detalle /{id}, garantía /{id}/warranty.
class UnitsScreen extends StatelessWidget {
  const UnitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const FeaturePlaceholder(
      title: 'Mis unidades',
      icon: Icons.inventory_2_outlined,
      description: 'Pendiente: listado, detalle y estado de garantía.',
    );
  }
}
