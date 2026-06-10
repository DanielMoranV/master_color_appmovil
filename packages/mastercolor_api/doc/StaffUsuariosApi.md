# mastercolor_api.api.StaffUsuariosApi

## Load the API package
```dart
import 'package:mastercolor_api/api.dart';
```

All URIs are relative to *http://localhost:8000/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**supportTechniciansGet**](StaffUsuariosApi.md#supporttechniciansget) | **GET** /support/technicians | Listar técnicos asignables


# **supportTechniciansGet**
> SupportTechniciansGet200Response supportTechniciansGet(page, perPage, search)

Listar técnicos asignables

Usuarios con rol `Tecnico` activos, para asignar en `PATCH /support/tickets/{id}/assign`.

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getStaffUsuariosApi();
final int page = 56; // int | 
final int perPage = 56; // int | 
final String search = search_example; // String | Busca por nombre o email.

try {
    final response = api.supportTechniciansGet(page, perPage, search);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StaffUsuariosApi->supportTechniciansGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] [default to 1]
 **perPage** | **int**|  | [optional] [default to 15]
 **search** | **String**| Busca por nombre o email. | [optional] 

### Return type

[**SupportTechniciansGet200Response**](SupportTechniciansGet200Response.md)

### Authorization

[staffAuth](../README.md#staffAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

