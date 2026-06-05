/// Modelo del envelope uniforme que devuelve el backend en TODAS las respuestas:
///
/// ```json
/// { "success": true, "message": "...", "status": 200, "data": { }, "errors": null }
/// ```
///
/// - En error: `success:false`, `data:[]`, `errors` con detalle.
/// - En validación (422): `errors` es `{ "campo": ["mensaje", ...] }`.
class ApiResponse<T> {
  const ApiResponse({
    required this.success,
    required this.message,
    required this.status,
    this.data,
    this.errors,
  });

  final bool success;
  final String message;
  final int status;
  final T? data;

  /// Mapa `campo -> [mensajes]` cuando hay errores de validación, o null.
  final Map<String, List<String>>? errors;

  /// Parsea el envelope. [fromData] convierte el nodo `data` al tipo [T].
  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? data)? fromData,
  ) {
    final rawData = json['data'];
    return ApiResponse<T>(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      status: json['status'] as int? ?? 0,
      data: fromData != null ? fromData(rawData) : rawData as T?,
      errors: _parseErrors(json['errors']),
    );
  }

  static Map<String, List<String>>? _parseErrors(Object? raw) {
    if (raw is! Map) return null;
    return raw.map(
      (key, value) => MapEntry(
        key.toString(),
        (value is List)
            ? value.map((e) => e.toString()).toList()
            : <String>[value.toString()],
      ),
    );
  }

  /// Primer mensaje de error de validación, útil para mostrar en UI.
  String? get firstError {
    if (errors == null || errors!.isEmpty) return null;
    final first = errors!.values.first;
    return first.isNotEmpty ? first.first : null;
  }
}
