import '../auth/session.dart';
import '../network/api_client.dart';

/// Registro de token push y manejo de notificaciones (FCM).
///
/// STUB: la integración con Firebase Messaging es un paso aparte que requiere
/// `flutterfire configure` + los archivos de configuración (google-services.json
/// / GoogleService-Info.plist). Mientras tanto este servicio define el contrato.
///
/// Flujo previsto (ver docs/flutter/KICKOFF.md §7):
///  1. Tras login: pedir permiso y obtener el token FCM.
///  2. Registrarlo: cliente `POST /client/devices`, staff `POST /support/devices`.
///  3. Escuchar `onTokenRefresh` -> re-registrar.
///  4. En logout: `DELETE /client/devices/{token}` (o `/support/devices/{token}`).
///
/// Payload `data` del backend para deep-link:
///   { "ticket_id": "123", "type": "ticket_status|ticket_message|ticket_assigned" }
class PushService {
  PushService(this._api);

  final ApiClient _api;

  String _devicesPath(UserRole role) =>
      role == UserRole.client ? '/client/devices' : '/support/devices';

  /// Registra el token FCM en el backend para el rol activo.
  Future<void> registerToken({
    required UserRole role,
    required String token,
    required String platform, // 'android' | 'ios'
  }) async {
    await _api.post<void>(
      _devicesPath(role),
      body: {'token': token, 'platform': platform},
    );
  }

  /// Elimina el token al cerrar sesión.
  Future<void> unregisterToken({
    required UserRole role,
    required String token,
  }) async {
    await _api.delete<void>('${_devicesPath(role)}/$token');
  }

  // TODO(push): inicializar Firebase, pedir permisos, getToken(),
  // onTokenRefresh, onMessage / onMessageOpenedApp / getInitialMessage.
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
