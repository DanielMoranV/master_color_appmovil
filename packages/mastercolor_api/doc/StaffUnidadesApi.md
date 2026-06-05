# mastercolor_api.api.StaffUnidadesApi

## Load the API package
```dart
import 'package:mastercolor_api/api.dart';
```

All URIs are relative to *http://localhost:8000/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**supportUnitsGet**](StaffUnidadesApi.md#supportunitsget) | **GET** /support/units | Buscar unidades vendidas
[**supportUnitsIdGet**](StaffUnidadesApi.md#supportunitsidget) | **GET** /support/units/{id} | Detalle de una unidad (con historial de tickets)
[**supportUnitsIdPatch**](StaffUnidadesApi.md#supportunitsidpatch) | **PATCH** /support/units/{id} | Actualizar una unidad (asignar nº de serie / estado)


# **supportUnitsGet**
> ClientUnitsGet200Response supportUnitsGet(page, perPage, serialNumber, clientId, productId)

Buscar unidades vendidas

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getStaffUnidadesApi();
final int page = 56; // int | 
final int perPage = 56; // int | 
final String serialNumber = serialNumber_example; // String | 
final int clientId = 56; // int | 
final int productId = 56; // int | 

try {
    final response = api.supportUnitsGet(page, perPage, serialNumber, clientId, productId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StaffUnidadesApi->supportUnitsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] [default to 1]
 **perPage** | **int**|  | [optional] [default to 15]
 **serialNumber** | **String**|  | [optional] 
 **clientId** | **int**|  | [optional] 
 **productId** | **int**|  | [optional] 

### Return type

[**ClientUnitsGet200Response**](ClientUnitsGet200Response.md)

### Authorization

[staffAuth](../README.md#staffAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **supportUnitsIdGet**
> ClientUnitsIdGet200Response supportUnitsIdGet(id)

Detalle de una unidad (con historial de tickets)

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getStaffUnidadesApi();
final int id = 56; // int | 

try {
    final response = api.supportUnitsIdGet(id);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StaffUnidadesApi->supportUnitsIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**ClientUnitsIdGet200Response**](ClientUnitsIdGet200Response.md)

### Authorization

[staffAuth](../README.md#staffAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **supportUnitsIdPatch**
> ClientUnitsPost201Response supportUnitsIdPatch(id, supportUnitsIdPatchRequest)

Actualizar una unidad (asignar nº de serie / estado)

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getStaffUnidadesApi();
final int id = 56; // int | 
final SupportUnitsIdPatchRequest supportUnitsIdPatchRequest = ; // SupportUnitsIdPatchRequest | 

try {
    final response = api.supportUnitsIdPatch(id, supportUnitsIdPatchRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StaffUnidadesApi->supportUnitsIdPatch: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **supportUnitsIdPatchRequest** | [**SupportUnitsIdPatchRequest**](SupportUnitsIdPatchRequest.md)|  | 

### Return type

[**ClientUnitsPost201Response**](ClientUnitsPost201Response.md)

### Authorization

[staffAuth](../README.md#staffAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

