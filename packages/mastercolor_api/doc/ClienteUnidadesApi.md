# mastercolor_api.api.ClienteUnidadesApi

## Load the API package
```dart
import 'package:mastercolor_api/api.dart';
```

All URIs are relative to *http://localhost:8000/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**clientUnitsGet**](ClienteUnidadesApi.md#clientunitsget) | **GET** /client/units | Listar mis unidades vendidas
[**clientUnitsIdGet**](ClienteUnidadesApi.md#clientunitsidget) | **GET** /client/units/{id} | Detalle de una unidad
[**clientUnitsIdWarrantyGet**](ClienteUnidadesApi.md#clientunitsidwarrantyget) | **GET** /client/units/{id}/warranty | Estado de garantía de una unidad
[**clientUnitsPost**](ClienteUnidadesApi.md#clientunitspost) | **POST** /client/units | Registrar una unidad manualmente


# **clientUnitsGet**
> ClientUnitsGet200Response clientUnitsGet(page, perPage, status, warranty)

Listar mis unidades vendidas

Unidades derivadas de las órdenes del cliente más las registradas manualmente.

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getClienteUnidadesApi();
final int page = 56; // int | 
final int perPage = 56; // int | 
final SoldUnitStatus status = ; // SoldUnitStatus | 
final String warranty = warranty_example; // String | Filtra por estado de garantía.

try {
    final response = api.clientUnitsGet(page, perPage, status, warranty);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ClienteUnidadesApi->clientUnitsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] [default to 1]
 **perPage** | **int**|  | [optional] [default to 15]
 **status** | [**SoldUnitStatus**](.md)|  | [optional] 
 **warranty** | **String**| Filtra por estado de garantía. | [optional] 

### Return type

[**ClientUnitsGet200Response**](ClientUnitsGet200Response.md)

### Authorization

[clientAuth](../README.md#clientAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **clientUnitsIdGet**
> ClientUnitsIdGet200Response clientUnitsIdGet(id)

Detalle de una unidad

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getClienteUnidadesApi();
final int id = 56; // int | 

try {
    final response = api.clientUnitsIdGet(id);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ClienteUnidadesApi->clientUnitsIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**ClientUnitsIdGet200Response**](ClientUnitsIdGet200Response.md)

### Authorization

[clientAuth](../README.md#clientAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **clientUnitsIdWarrantyGet**
> ClientUnitsIdWarrantyGet200Response clientUnitsIdWarrantyGet(id)

Estado de garantía de una unidad

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getClienteUnidadesApi();
final int id = 56; // int | 

try {
    final response = api.clientUnitsIdWarrantyGet(id);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ClienteUnidadesApi->clientUnitsIdWarrantyGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**ClientUnitsIdWarrantyGet200Response**](ClientUnitsIdWarrantyGet200Response.md)

### Authorization

[clientAuth](../README.md#clientAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **clientUnitsPost**
> ClientUnitsPost201Response clientUnitsPost(productId, purchaseDate, serialNumber, proofFile)

Registrar una unidad manualmente

Para unidades compradas fuera del canal online. El `serial_number` es opcional (productos no serializados). Puede adjuntar comprobante de compra. 

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getClienteUnidadesApi();
final int productId = 56; // int | 
final DateTime purchaseDate = 2013-10-20; // DateTime | 
final String serialNumber = serialNumber_example; // String | 
final MultipartFile proofFile = BINARY_DATA_HERE; // MultipartFile | Comprobante de compra (imagen jpg/jpeg/png/webp, máx 5MB). Opcional.

try {
    final response = api.clientUnitsPost(productId, purchaseDate, serialNumber, proofFile);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ClienteUnidadesApi->clientUnitsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **productId** | **int**|  | 
 **purchaseDate** | **DateTime**|  | 
 **serialNumber** | **String**|  | [optional] 
 **proofFile** | **MultipartFile**| Comprobante de compra (imagen jpg/jpeg/png/webp, máx 5MB). Opcional. | [optional] 

### Return type

[**ClientUnitsPost201Response**](ClientUnitsPost201Response.md)

### Authorization

[clientAuth](../README.md#clientAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

