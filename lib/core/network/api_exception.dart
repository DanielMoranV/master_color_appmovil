import 'package:dio/dio.dart';

/// Excepción normalizada de la capa de red. Traduce errores de Dio y del
/// envelope `{success,data,errors}` a algo que la UI pueda mostrar.
class ApiException implements Exception {
  ApiException(this.message, {this.statusCode, this.errors});

  final String message;
  final int? statusCode;

  /// Errores de validación `campo -> [mensajes]` (422), si los hay.
  final Map<String, List<String>>? errors;

  bool get isUnauthorized => statusCode == 401;
  bool get isValidation => statusCode == 422;

  /// Mensaje listo para la UI: el primer error de validación si lo hay, o el
  /// mensaje general. Nunca incluye detalles técnicos como el código.
  String get displayMessage {
    final errs = errors;
    if (errs != null && errs.isNotEmpty) {
      final first = errs.values.first;
      if (first.isNotEmpty) return first.first;
    }
    return message;
  }

  /// Construye la excepción a partir de un [DioException].
  factory ApiException.fromDio(DioException e) {
    final response = e.response;
    final data = response?.data;

    String message = 'Ocurrió un error inesperado.';
    Map<String, List<String>>? errors;

    if (data is Map<String, dynamic>) {
      message = data['message'] as String? ?? message;
      final rawErrors = data['errors'];
      if (rawErrors is Map) {
        errors = rawErrors.map(
          (key, value) => MapEntry(
            key.toString(),
            (value is List)
                ? value.map((v) => v.toString()).toList()
                : <String>[value.toString()],
          ),
        );
      }
    } else if (response == null) {
      // Sin respuesta HTTP: timeout, DNS, TLS o un corte de conexión que Dio
      // envuelve como `unknown` (p. ej. SocketException/HttpException
      // "Software caused connection abort"). Todos son fallos de transporte.
      message = e.type == DioExceptionType.cancel
          ? 'La operación fue cancelada.'
          : 'No se pudo conectar con el servidor.';
    }

    return ApiException(
      message,
      statusCode: response?.statusCode,
      errors: errors,
    );
  }

  @override
  String toString() => 'ApiException($statusCode): $message';
}
