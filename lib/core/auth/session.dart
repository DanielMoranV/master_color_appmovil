/// Rol activo de la sesión. Define qué guard/endpoints usa la app.
enum UserRole {
  client,
  staff;

  String get value => name;

  static UserRole? fromValue(String? value) {
    return switch (value) {
      'client' => UserRole.client,
      'staff' => UserRole.staff,
      _ => null,
    };
  }
}

/// Estado de sesión: token de acceso + rol activo.
class Session {
  const Session({required this.accessToken, required this.role});

  final String accessToken;
  final UserRole role;

  bool get isClient => role == UserRole.client;
  bool get isStaff => role == UserRole.staff;
}
