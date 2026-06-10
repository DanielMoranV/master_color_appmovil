import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mastercolor_api/mastercolor_api.dart';

import '../auth/auth_controller.dart';
import '../auth/session.dart';
import '../network/api_client.dart';
import '../network/mastercolor_api_provider.dart';

/// Registro/baja del token FCM en el backend, según el rol activo:
///  - cliente: `POST /client/devices`, `DELETE /client/devices/{token}`
///  - staff:   `POST /support/devices`, `DELETE /support/devices/{token}`
///
/// Es best-effort: los fallos se registran pero no se propagan, para no romper
/// el flujo de login/logout por un problema de notificaciones.
class DeviceRepository {
  DeviceRepository({required MastercolorApi api, required ApiClient http})
      : _api = api,
        _http = http;

  final MastercolorApi _api;
  final ApiClient _http;

  /// Plataforma actual mapeada al enum del contrato, o null si no aplica.
  DevicePlatform? get _platform {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return DevicePlatform.android;
    }
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return DevicePlatform.ios;
    }
    return null;
  }

  Future<void> register({required UserRole role, required String token}) async {
    final platform = _platform;
    if (platform == null) return;
    final request = DeviceTokenRequest(token: token, platform: platform);
    try {
      if (role == UserRole.client) {
        await _api.getClienteDispositivosApi().clientDevicesPost(
              deviceTokenRequest: request,
            );
      } else {
        await _api.getStaffDispositivosApi().supportDevicesPost(
              deviceTokenRequest: request,
            );
      }
    } catch (e) {
      if (kDebugMode) debugPrint('DeviceRepository.register falló: $e');
    }
  }

  Future<void> unregister({required UserRole role, required String token}) async {
    try {
      if (role == UserRole.client) {
        await _api.getClienteDispositivosApi().clientDevicesTokenDelete(
              token: token,
            );
      } else {
        // El cliente generado no expone el delete de staff; vía HTTP directo.
        await _http.delete<void>('/support/devices/$token');
      }
    } catch (e) {
      if (kDebugMode) debugPrint('DeviceRepository.unregister falló: $e');
    }
  }
}

final deviceRepositoryProvider = Provider<DeviceRepository>((ref) {
  return DeviceRepository(
    api: ref.watch(mastercolorApiProvider),
    http: ref.watch(apiClientProvider),
  );
});
