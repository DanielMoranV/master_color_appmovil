import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../auth/session.dart';

/// Almacenamiento seguro de tokens y rol (flutter_secure_storage).
class SecureStorage {
  SecureStorage([FlutterSecureStorage? storage])
      : _storage = storage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _storage;

  static const _kAccessToken = 'access_token';
  static const _kRefreshToken = 'refresh_token';
  static const _kRole = 'role';

  Future<void> saveSession({
    required String accessToken,
    required UserRole role,
    String? refreshToken,
  }) async {
    await _storage.write(key: _kAccessToken, value: accessToken);
    await _storage.write(key: _kRole, value: role.value);
    if (refreshToken != null) {
      await _storage.write(key: _kRefreshToken, value: refreshToken);
    }
  }

  Future<String?> get accessToken => _storage.read(key: _kAccessToken);
  Future<String?> get refreshToken => _storage.read(key: _kRefreshToken);

  Future<UserRole?> get role async =>
      UserRole.fromValue(await _storage.read(key: _kRole));

  /// Reconstruye la sesión persistida, o null si no hay login previo.
  Future<Session?> readSession() async {
    final token = await accessToken;
    final storedRole = await role;
    if (token == null || storedRole == null) return null;
    return Session(accessToken: token, role: storedRole);
  }

  Future<void> clear() => _storage.deleteAll();
}
