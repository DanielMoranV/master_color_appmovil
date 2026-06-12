# mastercolor_api.api.ClienteDireccionesApi

## Load the API package
```dart
import 'package:mastercolor_api/api.dart';
```

All URIs are relative to *http://localhost:8000/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**clientAddressesGet**](ClienteDireccionesApi.md#clientaddressesget) | **GET** /client/addresses | Listar direcciones del cliente


# **clientAddressesGet**
> ClientAddressesGet200Response clientAddressesGet()

Listar direcciones del cliente

Direcciones del cliente autenticado, con coordenadas (latitude/longitude) cuando estén disponibles. Se usan para elegir a dónde va el técnico en un servicio a domicilio.

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getClienteDireccionesApi();

try {
    final response = api.clientAddressesGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling ClienteDireccionesApi->clientAddressesGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ClientAddressesGet200Response**](ClientAddressesGet200Response.md)

### Authorization

[clientAuth](../README.md#clientAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

