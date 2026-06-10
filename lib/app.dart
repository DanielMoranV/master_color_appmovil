import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/push/push_controller.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

class MasterColorApp extends ConsumerWidget {
  const MasterColorApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    // Mantiene vivo el orquestador de notificaciones durante toda la app:
    // sigue la sesión para registrar/dar de baja el token y abrir deep-links.
    ref.watch(pushControllerProvider);
    return MaterialApp.router(
      title: 'MasterColor Soporte',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: router,
    );
  }
}
