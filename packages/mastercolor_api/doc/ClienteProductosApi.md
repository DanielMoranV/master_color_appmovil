# mastercolor_api.api.ClienteProductosApi

## Load the API package
```dart
import 'package:mastercolor_api/api.dart';
```

All URIs are relative to *http://localhost:8000/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**clientProductsGet**](ClienteProductosApi.md#clientproductsget) | **GET** /client/products | Catálogo de productos (para registro manual de unidad)


# **clientProductsGet**
> ClientProductsGet200Response clientProductsGet(page, perPage, search)

Catálogo de productos (para registro manual de unidad)

Búsqueda paginada de productos para seleccionar al registrar una unidad.

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getClienteProductosApi();
final int page = 56; // int | 
final int perPage = 56; // int | 
final String search = search_example; // String | Busca por nombre o SKU.

try {
    final response = api.clientProductsGet(page, perPage, search);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ClienteProductosApi->clientProductsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] [default to 1]
 **perPage** | **int**|  | [optional] [default to 15]
 **search** | **String**| Busca por nombre o SKU. | [optional] 

### Return type

[**ClientProductsGet200Response**](ClientProductsGet200Response.md)

### Authorization

[clientAuth](../README.md#clientAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

