//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:dio/dio.dart';
import 'package:mastercolor_api/src/auth/api_key_auth.dart';
import 'package:mastercolor_api/src/auth/basic_auth.dart';
import 'package:mastercolor_api/src/auth/bearer_auth.dart';
import 'package:mastercolor_api/src/auth/oauth.dart';
import 'package:mastercolor_api/src/api/cliente_direcciones_api.dart';
import 'package:mastercolor_api/src/api/cliente_dispositivos_api.dart';
import 'package:mastercolor_api/src/api/cliente_productos_api.dart';
import 'package:mastercolor_api/src/api/cliente_tickets_api.dart';
import 'package:mastercolor_api/src/api/cliente_unidades_api.dart';
import 'package:mastercolor_api/src/api/sesin_api.dart';
import 'package:mastercolor_api/src/api/staff_dispositivos_api.dart';
import 'package:mastercolor_api/src/api/staff_mtricas_api.dart';
import 'package:mastercolor_api/src/api/staff_repuestos_api.dart';
import 'package:mastercolor_api/src/api/staff_tickets_api.dart';
import 'package:mastercolor_api/src/api/staff_unidades_api.dart';
import 'package:mastercolor_api/src/api/staff_usuarios_api.dart';
import 'package:mastercolor_api/src/api/staff_visitas_api.dart';

class MastercolorApi {
  static const String basePath = r'http://localhost:8000/api';

  final Dio dio;
  MastercolorApi({
    Dio? dio,
    String? basePathOverride,
    List<Interceptor>? interceptors,
  })  : 
        this.dio = dio ??
            Dio(BaseOptions(
              baseUrl: basePathOverride ?? basePath,
              connectTimeout: const Duration(milliseconds: 5000),
              receiveTimeout: const Duration(milliseconds: 3000),
            )) {
    if (interceptors == null) {
      this.dio.interceptors.addAll([
        OAuthInterceptor(),
        BasicAuthInterceptor(),
        BearerAuthInterceptor(),
        ApiKeyAuthInterceptor(),
      ]);
    } else {
      this.dio.interceptors.addAll(interceptors);
    }
  }

  void setOAuthToken(String name, String token) {
    if (this.dio.interceptors.any((i) => i is OAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is OAuthInterceptor) as OAuthInterceptor).tokens[name] = token;
    }
  }

  /// Removes the OAuth token associated with the given [name].
  ///
  /// If no [OAuthInterceptor] is registered or no token exists for the given
  /// [name], this method has no effect.
  void removeOAuthToken(String name) {
    if (this.dio.interceptors.any((i) => i is OAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is OAuthInterceptor) as OAuthInterceptor).tokens.remove(name);
    }
  }

  void setBearerAuth(String name, String token) {
    if (this.dio.interceptors.any((i) => i is BearerAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BearerAuthInterceptor) as BearerAuthInterceptor).tokens[name] = token;
    }
  }

  /// Removes the bearer authentication token associated with the given [name].
  ///
  /// If no [BearerAuthInterceptor] is registered or no token exists for the
  /// given [name], this method has no effect.
  void removeBearerAuth(String name) {
    if (this.dio.interceptors.any((i) => i is BearerAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BearerAuthInterceptor) as BearerAuthInterceptor).tokens.remove(name);
    }
  }

  void setBasicAuth(String name, String username, String password) {
    if (this.dio.interceptors.any((i) => i is BasicAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BasicAuthInterceptor) as BasicAuthInterceptor).authInfo[name] = BasicAuthInfo(username, password);
    }
  }

  /// Removes the basic authentication credentials associated with the given [name].
  ///
  /// If no [BasicAuthInterceptor] is registered or no credentials exist for the
  /// given [name], this method has no effect.
  void removeBasicAuth(String name) {
    if (this.dio.interceptors.any((i) => i is BasicAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BasicAuthInterceptor) as BasicAuthInterceptor).authInfo.remove(name);
    }
  }

  void setApiKey(String name, String apiKey) {
    if (this.dio.interceptors.any((i) => i is ApiKeyAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((element) => element is ApiKeyAuthInterceptor) as ApiKeyAuthInterceptor).apiKeys[name] = apiKey;
    }
  }

  /// Removes the API key associated with the given [name].
  ///
  /// If no [ApiKeyAuthInterceptor] is registered or no API key exists for the
  /// given [name], this method has no effect.
  void removeApiKey(String name) {
    if (this.dio.interceptors.any((i) => i is ApiKeyAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((element) => element is ApiKeyAuthInterceptor) as ApiKeyAuthInterceptor).apiKeys.remove(name);
    }
  }

  /// Get ClienteDireccionesApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ClienteDireccionesApi getClienteDireccionesApi() {
    return ClienteDireccionesApi(dio);
  }

  /// Get ClienteDispositivosApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ClienteDispositivosApi getClienteDispositivosApi() {
    return ClienteDispositivosApi(dio);
  }

  /// Get ClienteProductosApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ClienteProductosApi getClienteProductosApi() {
    return ClienteProductosApi(dio);
  }

  /// Get ClienteTicketsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ClienteTicketsApi getClienteTicketsApi() {
    return ClienteTicketsApi(dio);
  }

  /// Get ClienteUnidadesApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ClienteUnidadesApi getClienteUnidadesApi() {
    return ClienteUnidadesApi(dio);
  }

  /// Get SesinApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  SesinApi getSesinApi() {
    return SesinApi(dio);
  }

  /// Get StaffDispositivosApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  StaffDispositivosApi getStaffDispositivosApi() {
    return StaffDispositivosApi(dio);
  }

  /// Get StaffMtricasApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  StaffMtricasApi getStaffMtricasApi() {
    return StaffMtricasApi(dio);
  }

  /// Get StaffRepuestosApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  StaffRepuestosApi getStaffRepuestosApi() {
    return StaffRepuestosApi(dio);
  }

  /// Get StaffTicketsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  StaffTicketsApi getStaffTicketsApi() {
    return StaffTicketsApi(dio);
  }

  /// Get StaffUnidadesApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  StaffUnidadesApi getStaffUnidadesApi() {
    return StaffUnidadesApi(dio);
  }

  /// Get StaffUsuariosApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  StaffUsuariosApi getStaffUsuariosApi() {
    return StaffUsuariosApi(dio);
  }

  /// Get StaffVisitasApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  StaffVisitasApi getStaffVisitasApi() {
    return StaffVisitasApi(dio);
  }
}
