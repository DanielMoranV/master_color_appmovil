import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

/// Handler de mensajes en segundo plano. Debe ser una función top-level
/// (se ejecuta en un isolate aparte). Protegida: si Firebase no está
/// configurado, simplemente no hace nada.
@pragma('vm:entry-point')
Future<void> firebaseBackgroundHandler(RemoteMessage message) async {
  try {
    await Firebase.initializeApp();
  } catch (_) {
    // Firebase no configurado: nada que hacer en background.
  }
  // El sistema ya muestra la notificación cuando trae payload `notification`.
}

/// Envoltura sobre Firebase Messaging.
///
/// **Guarda segura:** si el proyecto Firebase aún no está configurado
/// (`flutterfire configure` pendiente), `initialize()` falla de forma
/// controlada, [isAvailable] queda en `false` y el resto de la app sigue
/// funcionando con normalidad. Cuando se añadan los archivos de configuración
/// nativos, la integración se activa sin cambios de código.
///
/// Tipos de `data.type` que envía el backend: `ticket_status`,
/// `ticket_message`, `ticket_assigned`; con `ticket_id` para el deep-link.
class PushService {
  PushService();

  bool _available = false;
  bool get isAvailable => _available;

  FirebaseMessaging? _messaging;

  /// Inicializa Firebase + Messaging y pide permisos. Devuelve el token FCM
  /// actual, o `null` si Firebase no está disponible o se denegó el permiso.
  Future<String?> initialize() async {
    try {
      await Firebase.initializeApp();
    } catch (e) {
      _available = false;
      if (kDebugMode) {
        debugPrint('PushService: Firebase no configurado, push deshabilitado ($e).');
      }
      return null;
    }

    _available = true;
    final messaging = _messaging = FirebaseMessaging.instance;
    FirebaseMessaging.onBackgroundMessage(firebaseBackgroundHandler);

    final settings = await messaging.requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.denied) {
      return null;
    }

    // En iOS, mostrar la notificación también en primer plano.
    await messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    try {
      return await messaging.getToken();
    } catch (e) {
      if (kDebugMode) debugPrint('PushService: getToken falló ($e).');
      return null;
    }
  }

  /// Emite el nuevo token cada vez que Firebase lo rota.
  Stream<String> get onTokenRefresh =>
      _messaging?.onTokenRefresh ?? const Stream.empty();

  /// Mensajes recibidos con la app en primer plano.
  Stream<RemoteMessage> get onForegroundMessage =>
      _available ? FirebaseMessaging.onMessage : const Stream.empty();

  /// Mensajes que abrieron la app (tap en la notificación, app en background).
  Stream<RemoteMessage> get onMessageOpenedApp =>
      _available ? FirebaseMessaging.onMessageOpenedApp : const Stream.empty();

  /// Mensaje que abrió la app desde estado terminado (cold start), o null.
  Future<RemoteMessage?> initialMessage() async {
    if (!_available) return null;
    return _messaging?.getInitialMessage();
  }
}

/// Tipos de notificación que envía el backend (campo `data.type`).
enum PushType {
  ticketStatus,
  ticketMessage,
  ticketAssigned;

  static PushType? fromValue(String? value) => switch (value) {
        'ticket_status' => PushType.ticketStatus,
        'ticket_message' => PushType.ticketMessage,
        'ticket_assigned' => PushType.ticketAssigned,
        _ => null,
      };
}
