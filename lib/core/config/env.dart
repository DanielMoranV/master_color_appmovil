/// Configuración por entorno (flavors).
///
/// Sobrescribe la base URL al ejecutar:
///   flutter run --dart-define=API_BASE_URL=https://api.mastercolor.example/api
///
/// Nota: en el emulador de Android, `localhost` del host es `10.0.2.2`.
class Env {
  const Env._();

  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://localhost:8000/api',
  );
}
