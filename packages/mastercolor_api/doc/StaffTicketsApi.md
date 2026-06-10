# mastercolor_api.api.StaffTicketsApi

## Load the API package
```dart
import 'package:mastercolor_api/api.dart';
```

All URIs are relative to *http://localhost:8000/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**supportTicketsGet**](StaffTicketsApi.md#supportticketsget) | **GET** /support/tickets | Listar/filtrar tickets (cola de soporte)
[**supportTicketsIdAssignPatch**](StaffTicketsApi.md#supportticketsidassignpatch) | **PATCH** /support/tickets/{id}/assign | Asignar el ticket a un técnico
[**supportTicketsIdAttachmentsPost**](StaffTicketsApi.md#supportticketsidattachmentspost) | **POST** /support/tickets/{id}/attachments | Adjuntar evidencia al ticket (foto de diagnóstico, etc.)
[**supportTicketsIdDiagnosisPost**](StaffTicketsApi.md#supportticketsiddiagnosispost) | **POST** /support/tickets/{id}/diagnosis | Registrar diagnóstico técnico y cierre de servicio
[**supportTicketsIdGet**](StaffTicketsApi.md#supportticketsidget) | **GET** /support/tickets/{id} | Detalle completo del ticket (incluye notas internas)
[**supportTicketsIdMessagesPost**](StaffTicketsApi.md#supportticketsidmessagespost) | **POST** /support/tickets/{id}/messages | Responder o agregar nota interna
[**supportTicketsIdStatusPatch**](StaffTicketsApi.md#supportticketsidstatuspatch) | **PATCH** /support/tickets/{id}/status | Cambiar el estado del ticket
[**supportTicketsMineGet**](StaffTicketsApi.md#supportticketsmineget) | **GET** /support/tickets/mine | Tickets asignados al técnico autenticado


# **supportTicketsGet**
> ClientSupportTicketsGet200Response supportTicketsGet(page, perPage, status, priority, category, assignedUserId, clientId, search)

Listar/filtrar tickets (cola de soporte)

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getStaffTicketsApi();
final int page = 56; // int | 
final int perPage = 56; // int | 
final TicketStatus status = ; // TicketStatus | 
final TicketPriority priority = ; // TicketPriority | 
final TicketCategory category = ; // TicketCategory | 
final int assignedUserId = 56; // int | 
final int clientId = 56; // int | 
final String search = search_example; // String | Busca por código, asunto o cliente.

try {
    final response = api.supportTicketsGet(page, perPage, status, priority, category, assignedUserId, clientId, search);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StaffTicketsApi->supportTicketsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] [default to 1]
 **perPage** | **int**|  | [optional] [default to 15]
 **status** | [**TicketStatus**](.md)|  | [optional] 
 **priority** | [**TicketPriority**](.md)|  | [optional] 
 **category** | [**TicketCategory**](.md)|  | [optional] 
 **assignedUserId** | **int**|  | [optional] 
 **clientId** | **int**|  | [optional] 
 **search** | **String**| Busca por código, asunto o cliente. | [optional] 

### Return type

[**ClientSupportTicketsGet200Response**](ClientSupportTicketsGet200Response.md)

### Authorization

[staffAuth](../README.md#staffAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **supportTicketsIdAssignPatch**
> ClientSupportTicketsPost201Response supportTicketsIdAssignPatch(id, supportTicketsIdAssignPatchRequest)

Asignar el ticket a un técnico

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getStaffTicketsApi();
final int id = 56; // int | 
final SupportTicketsIdAssignPatchRequest supportTicketsIdAssignPatchRequest = ; // SupportTicketsIdAssignPatchRequest | 

try {
    final response = api.supportTicketsIdAssignPatch(id, supportTicketsIdAssignPatchRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StaffTicketsApi->supportTicketsIdAssignPatch: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **supportTicketsIdAssignPatchRequest** | [**SupportTicketsIdAssignPatchRequest**](SupportTicketsIdAssignPatchRequest.md)|  | 

### Return type

[**ClientSupportTicketsPost201Response**](ClientSupportTicketsPost201Response.md)

### Authorization

[staffAuth](../README.md#staffAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **supportTicketsIdAttachmentsPost**
> ClientSupportTicketsIdAttachmentsPost201Response supportTicketsIdAttachmentsPost(id, files, messageId)

Adjuntar evidencia al ticket (foto de diagnóstico, etc.)

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getStaffTicketsApi();
final int id = 56; // int | 
final List<MultipartFile> files = /path/to/file.txt; // List<MultipartFile> | Imágenes (jpg/jpeg/png/webp, máx 5MB c/u, máx 5 por petición).
final int messageId = 56; // int | Adjuntar a un mensaje específico (opcional).

try {
    final response = api.supportTicketsIdAttachmentsPost(id, files, messageId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StaffTicketsApi->supportTicketsIdAttachmentsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **files** | [**List&lt;MultipartFile&gt;**](MultipartFile.md)| Imágenes (jpg/jpeg/png/webp, máx 5MB c/u, máx 5 por petición). | 
 **messageId** | **int**| Adjuntar a un mensaje específico (opcional). | [optional] 

### Return type

[**ClientSupportTicketsIdAttachmentsPost201Response**](ClientSupportTicketsIdAttachmentsPost201Response.md)

### Authorization

[staffAuth](../README.md#staffAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **supportTicketsIdDiagnosisPost**
> ClientSupportTicketsIdGet200Response supportTicketsIdDiagnosisPost(id, diagnosisRequest)

Registrar diagnóstico técnico y cierre de servicio

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getStaffTicketsApi();
final int id = 56; // int | 
final DiagnosisRequest diagnosisRequest = ; // DiagnosisRequest | 

try {
    final response = api.supportTicketsIdDiagnosisPost(id, diagnosisRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StaffTicketsApi->supportTicketsIdDiagnosisPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **diagnosisRequest** | [**DiagnosisRequest**](DiagnosisRequest.md)|  | 

### Return type

[**ClientSupportTicketsIdGet200Response**](ClientSupportTicketsIdGet200Response.md)

### Authorization

[staffAuth](../README.md#staffAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **supportTicketsIdGet**
> ClientSupportTicketsIdGet200Response supportTicketsIdGet(id)

Detalle completo del ticket (incluye notas internas)

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getStaffTicketsApi();
final int id = 56; // int | 

try {
    final response = api.supportTicketsIdGet(id);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StaffTicketsApi->supportTicketsIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**ClientSupportTicketsIdGet200Response**](ClientSupportTicketsIdGet200Response.md)

### Authorization

[staffAuth](../README.md#staffAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **supportTicketsIdMessagesPost**
> ClientSupportTicketsIdMessagesPost201Response supportTicketsIdMessagesPost(id, supportTicketsIdMessagesPostRequest)

Responder o agregar nota interna

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getStaffTicketsApi();
final int id = 56; // int | 
final SupportTicketsIdMessagesPostRequest supportTicketsIdMessagesPostRequest = ; // SupportTicketsIdMessagesPostRequest | 

try {
    final response = api.supportTicketsIdMessagesPost(id, supportTicketsIdMessagesPostRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StaffTicketsApi->supportTicketsIdMessagesPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **supportTicketsIdMessagesPostRequest** | [**SupportTicketsIdMessagesPostRequest**](SupportTicketsIdMessagesPostRequest.md)|  | 

### Return type

[**ClientSupportTicketsIdMessagesPost201Response**](ClientSupportTicketsIdMessagesPost201Response.md)

### Authorization

[staffAuth](../README.md#staffAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **supportTicketsIdStatusPatch**
> ClientSupportTicketsPost201Response supportTicketsIdStatusPatch(id, supportTicketsIdStatusPatchRequest)

Cambiar el estado del ticket

Transiciones válidas: `abierto→asignado`, `asignado→en_proceso`, `en_proceso⇄en_espera_cliente`, `en_proceso→resuelto`, `resuelto→cerrado`, `*→cancelado`. 

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getStaffTicketsApi();
final int id = 56; // int | 
final SupportTicketsIdStatusPatchRequest supportTicketsIdStatusPatchRequest = ; // SupportTicketsIdStatusPatchRequest | 

try {
    final response = api.supportTicketsIdStatusPatch(id, supportTicketsIdStatusPatchRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StaffTicketsApi->supportTicketsIdStatusPatch: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **supportTicketsIdStatusPatchRequest** | [**SupportTicketsIdStatusPatchRequest**](SupportTicketsIdStatusPatchRequest.md)|  | 

### Return type

[**ClientSupportTicketsPost201Response**](ClientSupportTicketsPost201Response.md)

### Authorization

[staffAuth](../README.md#staffAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **supportTicketsMineGet**
> ClientSupportTicketsGet200Response supportTicketsMineGet(status)

Tickets asignados al técnico autenticado

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getStaffTicketsApi();
final TicketStatus status = ; // TicketStatus | 

try {
    final response = api.supportTicketsMineGet(status);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StaffTicketsApi->supportTicketsMineGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **status** | [**TicketStatus**](.md)|  | [optional] 

### Return type

[**ClientSupportTicketsGet200Response**](ClientSupportTicketsGet200Response.md)

### Authorization

[staffAuth](../README.md#staffAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

