import 'package:url_launcher/url_launcher.dart';

/// Lanzadores de apps externas (mapas, teléfono, correo, archivos web).
///
/// Todos devuelven `true` si se pudo abrir el destino y `false` si no hubo
/// app capaz de manejar el enlace, sin lanzar excepciones a la UI.

/// Abre la navegación "Cómo llegar" hacia un destino.
///
/// Si hay [latitude]/[longitude] usa Google Maps con esas coordenadas; si no,
/// cae al texto [fallbackQuery] (p. ej. la dirección completa) como destino.
/// Devuelve `false` si no se pudo construir ni abrir ningún destino.
Future<bool> openDirections({
  double? latitude,
  double? longitude,
  String? fallbackQuery,
}) {
  final Uri uri;
  if (latitude != null && longitude != null) {
    uri = Uri.parse(
      'https://www.google.com/maps/dir/?api=1&destination=$latitude,$longitude',
    );
  } else if (fallbackQuery != null && fallbackQuery.trim().isNotEmpty) {
    uri = Uri.https('www.google.com', '/maps/search/', {
      'api': '1',
      'query': fallbackQuery.trim(),
    });
  } else {
    return Future.value(false);
  }
  return _launch(uri);
}

/// Abre el marcador telefónico con [phone].
Future<bool> openPhone(String phone) =>
    _launch(Uri(scheme: 'tel', path: phone.trim()));

/// Abre el cliente de correo con destinatario [email].
Future<bool> openEmail(String email) =>
    _launch(Uri(scheme: 'mailto', path: email.trim()));

/// Abre una URL absoluta (p. ej. el PDF del acta) en una app externa.
Future<bool> openWebUrl(String url) => _launch(Uri.parse(url));

Future<bool> _launch(Uri uri) async {
  if (!await canLaunchUrl(uri)) return false;
  return launchUrl(uri, mode: LaunchMode.externalApplication);
}
