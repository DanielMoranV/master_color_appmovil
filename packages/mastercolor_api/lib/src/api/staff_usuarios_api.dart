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

}
