# mastercolor_api.api.SesinApi

## Load the API package
```dart
import 'package:mastercolor_api/api.dart';
```

All URIs are relative to *http://localhost:8000/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**authMeGet**](SesinApi.md#authmeget) | **GET** /auth/me | Usuario staff autenticado
[**clientAuthMeGet**](SesinApi.md#clientauthmeget) | **GET** /client/auth/me | Cliente autenticado


# **authMeGet**
> AuthMeGet200Response authMeGet()

Usuario staff autenticado

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getSesinApi();

try {
    final response = api.authMeGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling SesinApi->authMeGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**AuthMeGet200Response**](AuthMeGet200Response.md)

### Authorization

[staffAuth](../README.md#staffAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **clientAuthMeGet**
> ClientAuthMeGet200Response clientAuthMeGet()

Cliente autenticado

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getSesinApi();

try {
    final response = api.clientAuthMeGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling SesinApi->clientAuthMeGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ClientAuthMeGet200Response**](ClientAuthMeGet200Response.md)

### Authorization

[clientAuth](../README.md#clientAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

