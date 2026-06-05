import 'package:flutter/material.dart';

import '../../shared/widgets/feature_placeholder.dart';

/// Dashboard de métricas (técnico). Home del área staff.
/// TODO(metrics): GET /support/metrics.
class MetricsScreen extends StatelessWidget {
  const MetricsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const FeaturePlaceholder(
      title: 'Métricas',
      icon: Icons.dashboard_outlined,
      description: 'Pendiente: dashboard de soporte y cola de tickets.',
    );
  }
}
