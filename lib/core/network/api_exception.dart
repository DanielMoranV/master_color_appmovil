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
    } else if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.connectionError) {
      message = 'No se pudo conectar con el servidor.';
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
