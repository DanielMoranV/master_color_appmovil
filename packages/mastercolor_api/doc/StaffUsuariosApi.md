# mastercolor_api.api.StaffUsuariosApi

## Load the API package
```dart
import 'package:mastercolor_api/api.dart';
```

All URIs are relative to *http://localhost:8000/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**supportTechniciansGet**](StaffUsuariosApi.md#supporttechniciansget) | **GET** /support/technicians | Listar técnicos asignables
[**supportTechniciansMePatch**](StaffUsuariosApi.md#supporttechniciansmepatch) | **PATCH** /support/technicians/me | Actualizar el perfil del técnico autenticado


# **supportTechniciansGet**
> SupportTechniciansGet200Response supportTechniciansGet(page, perPage, search, specialty, zone, availableOnly)

Listar técnicos asignables

Usuarios con rol `Tecnico` activos, para asignar en `PATCH /support/tickets/{id}/assign`.

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getStaffUsuariosApi();
final int page = 56; // int | 
final int perPage = 56; // int | 
final String search = search_example; // String | Busca por nombre o email.
final String specialty = specialty_example; // String | Filtra técnicos que atienden esta categoría.
final String zone = zone_example; // String | Filtra técnicos que cubren este distrito/zona.
final bool availableOnly = true; // bool | Si es true, solo técnicos disponibles.

try {
    final response = api.supportTechniciansGet(page, perPage, search, specialty, zone, availableOnly);
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
 **specialty** | **String**| Filtra técnicos que atienden esta categoría. | [optional] 
 **zone** | **String**| Filtra técnicos que cubren este distrito/zona. | [optional] 
 **availableOnly** | **bool**| Si es true, solo técnicos disponibles. | [optional] 

### Return type

[**SupportTechniciansGet200Response**](SupportTechniciansGet200Response.md)

### Authorization

[staffAuth](../README.md#staffAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **supportTechniciansMePatch**
> SupportTechniciansMePatch200Response supportTechniciansMePatch(technicianProfileRequest)

Actualizar el perfil del técnico autenticado

Permite al técnico definir sus especialidades, zonas de cobertura y disponibilidad.

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getStaffUsuariosApi();
final TechnicianProfileRequest technicianProfileRequest = ; // TechnicianProfileRequest | 

try {
    final response = api.supportTechniciansMePatch(technicianProfileRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StaffUsuariosApi->supportTechniciansMePatch: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **technicianProfileRequest** | [**TechnicianProfileRequest**](TechnicianProfileRequest.md)|  | 

### Return type

[**SupportTechniciansMePatch200Response**](SupportTechniciansMePatch200Response.md)

### Authorization

[staffAuth](../README.md#staffAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

