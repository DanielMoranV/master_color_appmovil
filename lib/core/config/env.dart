/// Configuración por entorno (flavors).
///
/// Por defecto apunta al backend desplegado. Para apuntar a uno local:
///   flutter run --dart-define=API_BASE_URL=http://10.0.2.2:8000/api
///
/// Nota: en el emulador de Android, `localhost` del host es `10.0.2.2`.
class Env {
  const Env._();

  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://mc-api.djasoft.net.pe/api',
  );
}
