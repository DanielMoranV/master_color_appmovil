import 'package:flutter/material.dart';

import '../../shared/widgets/feature_placeholder.dart';

/// Tickets: crear/seguir/chat (cliente) y cola/atender (técnico).
/// TODO(tickets): index paginado, detalle con timeline, mensajes y adjuntos.
class TicketsScreen extends StatelessWidget {
  const TicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const FeaturePlaceholder(
      title: 'Tickets',
      icon: Icons.confirmation_number_outlined,
      description: 'Pendiente: lista, detalle, chat y adjuntos.',
    );
  }
}
