# mastercolor_api.api.StaffRepuestosApi

## Load the API package
```dart
import 'package:mastercolor_api/api.dart';
```

All URIs are relative to *http://localhost:8000/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**supportPartsGet**](StaffRepuestosApi.md#supportpartsget) | **GET** /support/parts | Buscar repuestos del inventario
[**supportTicketsIdPartsPartIdDelete**](StaffRepuestosApi.md#supportticketsidpartspartiddelete) | **DELETE** /support/tickets/{id}/parts/{partId} | Quitar repuesto (revierte el descuento de stock)
[**supportTicketsIdPartsPost**](StaffRepuestosApi.md#supportticketsidpartspost) | **POST** /support/tickets/{id}/parts | Registrar repuesto consumido (descuenta inventario)


# **supportPartsGet**
> SupportPartsGet200Response supportPartsGet(page, perPage, search)

Buscar repuestos del inventario

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getStaffRepuestosApi();
final int page = 56; // int | 
final int perPage = 56; // int | 
final String search = search_example; // String | Busca por nombre o SKU del producto.

try {
    final response = api.supportPartsGet(page, perPage, search);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StaffRepuestosApi->supportPartsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] [default to 1]
 **perPage** | **int**|  | [optional] [default to 15]
 **search** | **String**| Busca por nombre o SKU del producto. | [optional] 

### Return type

[**SupportPartsGet200Response**](SupportPartsGet200Response.md)

### Authorization

[staffAuth](../README.md#staffAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **supportTicketsIdPartsPartIdDelete**
> ApiSuccess supportTicketsIdPartsPartIdDelete(id, partId)

Quitar repuesto (revierte el descuento de stock)

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getStaffRepuestosApi();
final int id = 56; // int | 
final int partId = 56; // int | 

try {
    final response = api.supportTicketsIdPartsPartIdDelete(id, partId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StaffRepuestosApi->supportTicketsIdPartsPartIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **partId** | **int**|  | 

### Return type

[**ApiSuccess**](ApiSuccess.md)

### Authorization

[staffAuth](../README.md#staffAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **supportTicketsIdPartsPost**
> SupportTicketsIdPartsPost201Response supportTicketsIdPartsPost(id, ticketPartAddRequest)

Registrar repuesto consumido (descuenta inventario)

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getStaffRepuestosApi();
final int id = 56; // int | 
final TicketPartAddRequest ticketPartAddRequest = ; // TicketPartAddRequest | 

try {
    final response = api.supportTicketsIdPartsPost(id, ticketPartAddRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StaffRepuestosApi->supportTicketsIdPartsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **ticketPartAddRequest** | [**TicketPartAddRequest**](TicketPartAddRequest.md)|  | 

### Return type

[**SupportTicketsIdPartsPost201Response**](SupportTicketsIdPartsPost201Response.md)

### Authorization

[staffAuth](../README.md#staffAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

