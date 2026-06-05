import '../network/api_client.dart';
import '../storage/secure_storage.dart';
import 'session.dart';

/// Maneja login/refresh/logout para ambos guards (cliente y staff) y resuelve
/// los endpoints según el [UserRole] activo.
class AuthRepository {
  AuthRepository({required ApiClient api, required SecureStorage storage})
      : _api = api,
        _storage = storage {
    // Registra el refresh y el cierre de sesión en el cliente HTTP.
    _api.onRefresh = refresh;
    _api.onSessionExpired = logoutLocal;
  }

  final ApiClient _api;
  final SecureStorage _storage;

  String _loginPath(UserRole role) =>
      role == UserRole.client ? '/client/auth/login' : '/auth/login';
  String _refreshPath(UserRole role) =>
      role == UserRole.client ? '/client/auth/refresh' : '/auth/refresh';
  String _logoutPath(UserRole role) =>
      role == UserRole.client ? '/client/auth/logout' : '/auth/logout';

  /// Inicia sesión según [role] y persiste el token. Devuelve la sesión.
  Future<Session> login({
    required UserRole role,
    required String email,
    required String password,
  }) async {
    final res = await _api.post<Map<String, dynamic>>(
      _loginPath(role),
      body: {'email': email, 'password': password},
      fromData: (data) => (data as Map).cast<String, dynamic>(),
    );

    final token = res.data?['access_token'] as String?;
    if (token == null) {
      throw StateError(res.message.isNotEmpty ? res.message : 'Login fallido');
    }

    await _storage.saveSession(accessToken: token, role: role);
    return Session(accessToken: token, role: role);
  }

  /// Refresca el token del rol activo. Devuelve true si lo consiguió.
  Future<bool> refresh() async {
    final role = await _storage.role;
    if (role == null) return false;
    try {
      final res = await _api.post<Map<String, dynamic>>(
        _refreshPath(role),
        fromData: (data) => (data as Map).cast<String, dynamic>(),
      );
      final token = res.data?['access_token'] as String?;
      if (token == null) return false;
      await _storage.saveSession(accessToken: token, role: role);
      return true;
    } catch (_) {
      return false;
    }
  }

  /// Cierra sesión en el backend (best-effort) y limpia el almacenamiento.
  Future<void> logout() async {
    final role = await _storage.role;
    if (role != null) {
      try {
        await _api.post<void>(_logoutPath(role));
      } catch (_) {
        // Ignorar fallos de red al cerrar sesión.
      }
    }
    await logoutLocal();
  }

  /// Limpia solo el estado local (usado cuando el refresh falla).
  Future<void> logoutLocal() => _storage.clear();

  /// Restaura la sesión persistida al arrancar, o null.
  Future<Session?> restore() => _storage.readSession();
}
