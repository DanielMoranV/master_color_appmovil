import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../config/env.dart';
import '../storage/secure_storage.dart';
import 'api_exception.dart';
import 'api_response.dart';

/// Cliente HTTP central (Dio) con interceptores de auth, refresh y logging.
///
/// El refresh y el cierre de sesión se inyectan como callbacks
/// ([onRefresh] / [onSessionExpired]) para evitar una dependencia circular con
/// la capa de auth. `AuthRepository` los registra tras construirse.
class ApiClient {
  ApiClient({required SecureStorage storage, Dio? dio})
      : _storage = storage,
        _dio = dio ?? Dio() {
    _dio.options
      ..baseUrl = Env.baseUrl
      ..connectTimeout = const Duration(seconds: 15)
      ..receiveTimeout = const Duration(seconds: 20)
      ..headers['Accept'] = 'application/json';

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: _onRequest,
        onError: _onError,
      ),
    );

    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
      ));
    }
  }

  final Dio _dio;
  final SecureStorage _storage;

  /// Intenta refrescar el token. Devuelve true si lo consiguió.
  Future<bool> Function()? onRefresh;

  /// Se invoca cuando el refresh falla y hay que cerrar sesión.
  Future<void> Function()? onSessionExpired;

  bool _isRefreshing = false;

  Dio get dio => _dio;

  Future<void> _onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _storage.accessToken;
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  Future<void> _onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final isAuthError = err.response?.statusCode == 401;
    // Login/refresh/logout no deben disparar el refresco: un 401 ahí es una
    // credencial inválida o una sesión ya expirada, no un token caducado.
    final path = err.requestOptions.path;
    final isAuthEndpoint = path.contains('/auth/login') ||
        path.contains('/auth/refresh') ||
        path.contains('/auth/logout');

    if (isAuthError && !isAuthEndpoint && onRefresh != null && !_isRefreshing) {
      _isRefreshing = true;
      try {
        final refreshed = await onRefresh!.call();
        if (refreshed) {
          final retried = await _retry(err.requestOptions);
          return handler.resolve(retried);
        }
      } finally {
        _isRefreshing = false;
      }
      await onSessionExpired?.call();
    }

    handler.next(err);
  }

  Future<Response<dynamic>> _retry(RequestOptions options) {
    final token = _storage.accessToken;
    return token.then((value) {
      final headers = Map<String, dynamic>.from(options.headers);
      if (value != null) headers['Authorization'] = 'Bearer $value';
      return _dio.request<dynamic>(
        options.path,
        data: options.data,
        queryParameters: options.queryParameters,
        options: Options(method: options.method, headers: headers),
      );
    });
  }

  // ---- Helpers tipados que desenvuelven el envelope {success,data,errors} ----

  Future<ApiResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? query,
    T Function(Object? data)? fromData,
  }) =>
      _send(() => _dio.get<dynamic>(path, queryParameters: query), fromData);

  Future<ApiResponse<T>> post<T>(
    String path, {
    Object? body,
    T Function(Object? data)? fromData,
  }) =>
      _send(() => _dio.post<dynamic>(path, data: body), fromData);

  Future<ApiResponse<T>> put<T>(
    String path, {
    Object? body,
    T Function(Object? data)? fromData,
  }) =>
      _send(() => _dio.put<dynamic>(path, data: body), fromData);

  Future<ApiResponse<T>> patch<T>(
    String path, {
    Object? body,
    T Function(Object? data)? fromData,
  }) =>
      _send(() => _dio.patch<dynamic>(path, data: body), fromData);

  Future<ApiResponse<T>> delete<T>(
    String path, {
    Object? body,
    T Function(Object? data)? fromData,
  }) =>
      _send(() => _dio.delete<dynamic>(path, data: body), fromData);

  Future<ApiResponse<T>> _send<T>(
    Future<Response<dynamic>> Function() request,
    T Function(Object? data)? fromData,
  ) async {
    try {
      final response = await request();
      final json = response.data as Map<String, dynamic>;
      return ApiResponse<T>.fromJson(json, fromData);
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }
}
