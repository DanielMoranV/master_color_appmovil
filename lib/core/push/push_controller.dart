import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth/auth_controller.dart';
import '../auth/session.dart';
import '../router/app_router.dart';
import 'device_repository.dart';
import 'push_service.dart';

final pushServiceProvider = Provider<PushService>((ref) => PushService());

/// Orquesta el ciclo de vida de las notificaciones siguiendo a la sesión:
///  - Al autenticarse: inicializa FCM, registra el token y escucha refrescos y
///    aperturas de notificación (deep-link al ticket).
///  - Al cerrar sesión: da de baja el token y limpia las suscripciones.
///
/// Si Firebase no está configurado, [PushService.initialize] devuelve null y
/// todo el flujo queda inactivo sin afectar al resto de la app.
class PushController extends Notifier<void> {
  String? _token;
  UserRole? _role;
  final List<StreamSubscription<dynamic>> _subs = [];

  @override
  void build() {
    ref.onDispose(_cancelSubs);
    ref.listen<AuthState>(
      authControllerProvider,
      (_, next) => _onAuthChanged(next),
      fireImmediately: true,
    );
  }

  Future<void> _onAuthChanged(AuthState state) async {
    if (state is AuthAuthenticated) {
      await _setup(state.session.role);
    } else if (state is AuthUnauthenticated) {
      await _teardown();
    }
  }

  Future<void> _setup(UserRole role) async {
    if (_role == role && _token != null) return; // ya configurado
    final push = ref.read(pushServiceProvider);
    final token = await push.initialize();
    if (token == null) return; // Firebase no disponible o permiso denegado.

    _token = token;
    _role = role;
    await ref.read(deviceRepositoryProvider).register(role: role, token: token);

    _cancelSubs();
    _subs.add(push.onTokenRefresh.listen(_onTokenRefresh));
    _subs.add(push.onMessageOpenedApp.listen(_handleDeepLink));
    _subs.add(push.onForegroundMessage.listen(_handleForeground));

    // App abierta desde estado terminado por una notificación.
    final initial = await push.initialMessage();
    if (initial != null) _handleDeepLink(initial);
  }

  Future<void> _teardown() async {
    final token = _token;
    final role = _role;
    _cancelSubs();
    _token = null;
    _role = null;
    if (token != null && role != null) {
      await ref.read(deviceRepositoryProvider).unregister(role: role, token: token);
    }
  }

  Future<void> _onTokenRefresh(String token) async {
    final role = _role;
    if (role == null) return;
    _token = token;
    await ref.read(deviceRepositoryProvider).register(role: role, token: token);
  }

  void _handleForeground(RemoteMessage message) {
    // El sistema no muestra notificación en primer plano (Android). Aquí se
    // podría mostrar un banner in-app; por ahora solo se registra.
    if (kDebugMode) {
      debugPrint('Push (foreground): ${message.notification?.title} '
          '· data=${message.data}');
    }
  }

  void _handleDeepLink(RemoteMessage message) {
    final rawId = message.data['ticket_id'];
    final id = int.tryParse('$rawId');
    if (id == null) return;
    final role = _role ?? ref.read(currentRoleProvider);
    if (role == null) return;
    final base = role == UserRole.client ? '/client/tickets' : '/staff/tickets';
    ref.read(routerProvider).go('$base/$id');
  }

  void _cancelSubs() {
    for (final s in _subs) {
      s.cancel();
    }
    _subs.clear();
  }
}

final pushControllerProvider =
    NotifierProvider<PushController, void>(PushController.new);
