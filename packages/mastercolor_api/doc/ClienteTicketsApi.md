# mastercolor_api.api.ClienteTicketsApi

## Load the API package
```dart
import 'package:mastercolor_api/api.dart';
```

All URIs are relative to *http://localhost:8000/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**clientSupportTicketsGet**](ClienteTicketsApi.md#clientsupportticketsget) | **GET** /client/support/tickets | Listar mis tickets de soporte
[**clientSupportTicketsIdAttachmentsPost**](ClienteTicketsApi.md#clientsupportticketsidattachmentspost) | **POST** /client/support/tickets/{id}/attachments | Adjuntar archivos al ticket
[**clientSupportTicketsIdGet**](ClienteTicketsApi.md#clientsupportticketsidget) | **GET** /client/support/tickets/{id} | Detalle de un ticket (con conversación)
[**clientSupportTicketsIdMessagesPost**](ClienteTicketsApi.md#clientsupportticketsidmessagespost) | **POST** /client/support/tickets/{id}/messages | Enviar un mensaje en el ticket
[**clientSupportTicketsIdQuoteApprovePost**](ClienteTicketsApi.md#clientsupportticketsidquoteapprovepost) | **POST** /client/support/tickets/{id}/quote/approve | Aprobar el presupuesto vigente
[**clientSupportTicketsIdQuoteRejectPost**](ClienteTicketsApi.md#clientsupportticketsidquoterejectpost) | **POST** /client/support/tickets/{id}/quote/reject | Rechazar el presupuesto vigente
[**clientSupportTicketsIdRatePost**](ClienteTicketsApi.md#clientsupportticketsidratepost) | **POST** /client/support/tickets/{id}/rate | Calificar la atención de un ticket resuelto
[**clientSupportTicketsIdReopenPut**](ClienteTicketsApi.md#clientsupportticketsidreopenput) | **PUT** /client/support/tickets/{id}/reopen | Reabrir un ticket resuelto/cerrado
[**clientSupportTicketsPost**](ClienteTicketsApi.md#clientsupportticketspost) | **POST** /client/support/tickets | Crear un ticket de soporte


# **clientSupportTicketsGet**
> ClientSupportTicketsGet200Response clientSupportTicketsGet(page, perPage, status)

Listar mis tickets de soporte

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getClienteTicketsApi();
final int page = 56; // int | 
final int perPage = 56; // int | 
final TicketStatus status = ; // TicketStatus | 

try {
    final response = api.clientSupportTicketsGet(page, perPage, status);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ClienteTicketsApi->clientSupportTicketsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] [default to 1]
 **perPage** | **int**|  | [optional] [default to 15]
 **status** | [**TicketStatus**](.md)|  | [optional] 

### Return type

[**ClientSupportTicketsGet200Response**](ClientSupportTicketsGet200Response.md)

### Authorization

[clientAuth](../README.md#clientAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **clientSupportTicketsIdAttachmentsPost**
> ClientSupportTicketsIdAttachmentsPost201Response clientSupportTicketsIdAttachmentsPost(id, files, messageId)

Adjuntar archivos al ticket

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getClienteTicketsApi();
final int id = 56; // int | 
final List<MultipartFile> files = /path/to/file.txt; // List<MultipartFile> | Imágenes o video (máx. recomendado 5 por petición).
final int messageId = 56; // int | Adjuntar a un mensaje específico (opcional).

try {
    final response = api.clientSupportTicketsIdAttachmentsPost(id, files, messageId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ClienteTicketsApi->clientSupportTicketsIdAttachmentsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **files** | [**List&lt;MultipartFile&gt;**](MultipartFile.md)| Imágenes o video (máx. recomendado 5 por petición). | 
 **messageId** | **int**| Adjuntar a un mensaje específico (opcional). | [optional] 

### Return type

[**ClientSupportTicketsIdAttachmentsPost201Response**](ClientSupportTicketsIdAttachmentsPost201Response.md)

### Authorization

[clientAuth](../README.md#clientAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **clientSupportTicketsIdGet**
> ClientSupportTicketsIdGet200Response clientSupportTicketsIdGet(id)

Detalle de un ticket (con conversación)

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getClienteTicketsApi();
final int id = 56; // int | 

try {
    final response = api.clientSupportTicketsIdGet(id);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ClienteTicketsApi->clientSupportTicketsIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**ClientSupportTicketsIdGet200Response**](ClientSupportTicketsIdGet200Response.md)

### Authorization

[clientAuth](../README.md#clientAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **clientSupportTicketsIdMessagesPost**
> ClientSupportTicketsIdMessagesPost201Response clientSupportTicketsIdMessagesPost(id, clientSupportTicketsIdMessagesPostRequest)

Enviar un mensaje en el ticket

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getClienteTicketsApi();
final int id = 56; // int | 
final ClientSupportTicketsIdMessagesPostRequest clientSupportTicketsIdMessagesPostRequest = ; // ClientSupportTicketsIdMessagesPostRequest | 

try {
    final response = api.clientSupportTicketsIdMessagesPost(id, clientSupportTicketsIdMessagesPostRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ClienteTicketsApi->clientSupportTicketsIdMessagesPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **clientSupportTicketsIdMessagesPostRequest** | [**ClientSupportTicketsIdMessagesPostRequest**](ClientSupportTicketsIdMessagesPostRequest.md)|  | 

### Return type

[**ClientSupportTicketsIdMessagesPost201Response**](ClientSupportTicketsIdMessagesPost201Response.md)

### Authorization

[clientAuth](../README.md#clientAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **clientSupportTicketsIdQuoteApprovePost**
> ClientSupportTicketsIdGet200Response clientSupportTicketsIdQuoteApprovePost(id)

Aprobar el presupuesto vigente

El cliente aprueba la cotización; el ticket vuelve a 'en_proceso'.

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getClienteTicketsApi();
final int id = 56; // int | 

try {
    final response = api.clientSupportTicketsIdQuoteApprovePost(id);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ClienteTicketsApi->clientSupportTicketsIdQuoteApprovePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**ClientSupportTicketsIdGet200Response**](ClientSupportTicketsIdGet200Response.md)

### Authorization

[clientAuth](../README.md#clientAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **clientSupportTicketsIdQuoteRejectPost**
> ClientSupportTicketsIdGet200Response clientSupportTicketsIdQuoteRejectPost(id)

Rechazar el presupuesto vigente

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getClienteTicketsApi();
final int id = 56; // int | 

try {
    final response = api.clientSupportTicketsIdQuoteRejectPost(id);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ClienteTicketsApi->clientSupportTicketsIdQuoteRejectPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**ClientSupportTicketsIdGet200Response**](ClientSupportTicketsIdGet200Response.md)

### Authorization

[clientAuth](../README.md#clientAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **clientSupportTicketsIdRatePost**
> ClientSupportTicketsPost201Response clientSupportTicketsIdRatePost(id, clientSupportTicketsIdRatePostRequest)

Calificar la atención de un ticket resuelto

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getClienteTicketsApi();
final int id = 56; // int | 
final ClientSupportTicketsIdRatePostRequest clientSupportTicketsIdRatePostRequest = ; // ClientSupportTicketsIdRatePostRequest | 

try {
    final response = api.clientSupportTicketsIdRatePost(id, clientSupportTicketsIdRatePostRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ClienteTicketsApi->clientSupportTicketsIdRatePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **clientSupportTicketsIdRatePostRequest** | [**ClientSupportTicketsIdRatePostRequest**](ClientSupportTicketsIdRatePostRequest.md)|  | 

### Return type

[**ClientSupportTicketsPost201Response**](ClientSupportTicketsPost201Response.md)

### Authorization

[clientAuth](../README.md#clientAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **clientSupportTicketsIdReopenPut**
> ClientSupportTicketsPost201Response clientSupportTicketsIdReopenPut(id, clientSupportTicketsIdReopenPutRequest)

Reabrir un ticket resuelto/cerrado

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getClienteTicketsApi();
final int id = 56; // int | 
final ClientSupportTicketsIdReopenPutRequest clientSupportTicketsIdReopenPutRequest = ; // ClientSupportTicketsIdReopenPutRequest | 

try {
    final response = api.clientSupportTicketsIdReopenPut(id, clientSupportTicketsIdReopenPutRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ClienteTicketsApi->clientSupportTicketsIdReopenPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **clientSupportTicketsIdReopenPutRequest** | [**ClientSupportTicketsIdReopenPutRequest**](ClientSupportTicketsIdReopenPutRequest.md)|  | 

### Return type

[**ClientSupportTicketsPost201Response**](ClientSupportTicketsPost201Response.md)

### Authorization

[clientAuth](../README.md#clientAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **clientSupportTicketsPost**
> ClientSupportTicketsPost201Response clientSupportTicketsPost(ticketCreateRequest)

Crear un ticket de soporte

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getClienteTicketsApi();
final TicketCreateRequest ticketCreateRequest = ; // TicketCreateRequest | 

try {
    final response = api.clientSupportTicketsPost(ticketCreateRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ClienteTicketsApi->clientSupportTicketsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ticketCreateRequest** | [**TicketCreateRequest**](TicketCreateRequest.md)|  | 

### Return type

[**ClientSupportTicketsPost201Response**](ClientSupportTicketsPost201Response.md)

### Authorization

[clientAuth](../README.md#clientAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

