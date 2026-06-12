//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:mastercolor_api/src/deserialize.dart';
import 'package:dio/dio.dart';

import 'package:mastercolor_api/src/model/api_error.dart';
import 'package:mastercolor_api/src/model/support_technicians_get200_response.dart';
import 'package:mastercolor_api/src/model/support_technicians_me_patch200_response.dart';
import 'package:mastercolor_api/src/model/technician_profile_request.dart';
import 'package:mastercolor_api/src/model/validation_error.dart';

class StaffUsuariosApi {

  final Dio _dio;

  const StaffUsuariosApi(this._dio);

  /// Listar técnicos asignables
  /// Usuarios con rol &#x60;Tecnico&#x60; activos, para asignar en &#x60;PATCH /support/tickets/{id}/assign&#x60;.
  ///
  /// Parameters:
  /// * [page] 
  /// * [perPage] 
  /// * [search] - Busca por nombre o email.
  /// * [specialty] - Filtra técnicos que atienden esta categoría.
  /// * [zone] - Filtra técnicos que cubren este distrito/zona.
  /// * [availableOnly] - Si es true, solo técnicos disponibles.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [SupportTechniciansGet200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<SupportTechniciansGet200Response>> supportTechniciansGet({ 
    int? page = 1,
    int? perPage = 15,
    String? search,
    String? specialty,
    String? zone,
    bool? availableOnly,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/support/technicians';
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'http',
            'scheme': 'bearer',
            'name': 'staffAuth',
          },
        ],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      if (page != null) r'page': page,
      if (perPage != null) r'per_page': perPage,
      if (search != null) r'search': search,
      if (specialty != null) r'specialty': specialty,
      if (zone != null) r'zone': zone,
      if (availableOnly != null) r'available_only': availableOnly,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    SupportTechniciansGet200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<SupportTechniciansGet200Response, SupportTechniciansGet200Response>(rawData, 'SupportTechniciansGet200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<SupportTechniciansGet200Response>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// Actualizar el perfil del técnico autenticado
  /// Permite al técnico definir sus especialidades, zonas de cobertura y disponibilidad.
  ///
  /// Parameters:
  /// * [technicianProfileRequest] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [SupportTechniciansMePatch200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<SupportTechniciansMePatch200Response>> supportTechniciansMePatch({ 
    required TechnicianProfileRequest technicianProfileRequest,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/support/technicians/me';
    final _options = Options(
      method: r'PATCH',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'http',
            'scheme': 'bearer',
            'name': 'staffAuth',
          },
        ],
        ...?extra,
      },
      contentType: 'application/json',
      validateStatus: validateStatus,
    );

    dynamic _bodyData;

    try {
      _bodyData = jsonEncode(technicianProfileRequest);

    } catch(error, stackTrace) {
      throw DioException(
         requestOptions: _options.compose(
          _dio.options,
          _path,
        ),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    SupportTechniciansMePatch200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<SupportTechniciansMePatch200Response, SupportTechniciansMePatch200Response>(rawData, 'SupportTechniciansMePatch200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<SupportTechniciansMePatch200Response>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

}
