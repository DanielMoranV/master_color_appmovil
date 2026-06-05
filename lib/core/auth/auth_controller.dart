import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../network/api_client.dart';
import '../storage/secure_storage.dart';
import 'auth_repository.dart';
import 'session.dart';

// ---- Providers de infraestructura ----

final secureStorageProvider = Provider<SecureStorage>((ref) => SecureStorage());

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(storage: ref.watch(secureStorageProvider));
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(
    api: ref.watch(apiClientProvider),
    storage: ref.watch(secureStorageProvider),
  );
});

// ---- Estado de sesión ----

/// Estado de autenticación expuesto al router y a la UI.
sealed class AuthState {
  const AuthState();
}

/// Estado inicial mientras se restaura la sesión persistida.
class AuthUnknown extends AuthState {
  const AuthUnknown();
}

class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated();
}

class AuthAuthenticated extends AuthState {
  const AuthAuthenticated(this.session);
  final Session session;
}

/// Controla el ciclo de vida de la sesión (login/logout/restauración).
class AuthController extends Notifier<AuthState> {
  AuthRepository get _repo => ref.read(authRepositoryProvider);

  @override
  AuthState build() {
    _restore();
    return const AuthUnknown();
  }

  Future<void> _restore() async {
    final session = await _repo.restore();
    state = session == null
        ? const AuthUnauthenticated()
        : AuthAuthenticated(session);
  }

  Future<void> login({
    required UserRole role,
    required String email,
    required String password,
  }) async {
    final session = await _repo.login(
      role: role,
      email: email,
      password: password,
    );
    state = AuthAuthenticated(session);
  }

  Future<void> logout() async {
    await _repo.logout();
    state = const AuthUnauthenticated();
  }
}

final authControllerProvider =
    NotifierProvider<AuthController, AuthState>(AuthController.new);
