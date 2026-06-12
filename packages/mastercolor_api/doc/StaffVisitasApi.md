# mastercolor_api.api.StaffVisitasApi

## Load the API package
```dart
import 'package:mastercolor_api/api.dart';
```

All URIs are relative to *http://localhost:8000/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**supportTicketsIdCheckInPost**](StaffVisitasApi.md#supportticketsidcheckinpost) | **POST** /support/tickets/{id}/check-in | Check-in de la visita (registra llegada con geolocalización)
[**supportTicketsIdCheckOutPost**](StaffVisitasApi.md#supportticketsidcheckoutpost) | **POST** /support/tickets/{id}/check-out | Check-out de la visita (registra salida con geolocalización)
[**supportTicketsIdServiceReportPost**](StaffVisitasApi.md#supportticketsidservicereportpost) | **POST** /support/tickets/{id}/service-report | Reporte de servicio / acta de conformidad con firma


# **supportTicketsIdCheckInPost**
> SupportTicketsIdCheckInPost201Response supportTicketsIdCheckInPost(id, visitCheckRequest)

Check-in de la visita (registra llegada con geolocalización)

Inicia una visita en sitio. Falla con 409 si ya hay una visita en curso (sin check-out).

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getStaffVisitasApi();
final int id = 56; // int | 
final VisitCheckRequest visitCheckRequest = ; // VisitCheckRequest | 

try {
    final response = api.supportTicketsIdCheckInPost(id, visitCheckRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StaffVisitasApi->supportTicketsIdCheckInPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **visitCheckRequest** | [**VisitCheckRequest**](VisitCheckRequest.md)|  | [optional] 

### Return type

[**SupportTicketsIdCheckInPost201Response**](SupportTicketsIdCheckInPost201Response.md)

### Authorization

[staffAuth](../README.md#staffAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **supportTicketsIdCheckOutPost**
> SupportTicketsIdCheckInPost201Response supportTicketsIdCheckOutPost(id, visitCheckRequest)

Check-out de la visita (registra salida con geolocalización)

Cierra la visita en curso y calcula el tiempo en sitio. Falla con 409 si no hay visita abierta.

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getStaffVisitasApi();
final int id = 56; // int | 
final VisitCheckRequest visitCheckRequest = ; // VisitCheckRequest | 

try {
    final response = api.supportTicketsIdCheckOutPost(id, visitCheckRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StaffVisitasApi->supportTicketsIdCheckOutPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **visitCheckRequest** | [**VisitCheckRequest**](VisitCheckRequest.md)|  | [optional] 

### Return type

[**SupportTicketsIdCheckInPost201Response**](SupportTicketsIdCheckInPost201Response.md)

### Authorization

[staffAuth](../README.md#staffAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **supportTicketsIdServiceReportPost**
> SupportTicketsIdCheckInPost201Response supportTicketsIdServiceReportPost(id, serviceReportRequest)

Reporte de servicio / acta de conformidad con firma

Cierra formalmente la visita: registra el trabajo realizado, los repuestos consumidos (descuentan inventario), las fotos y la firma de conformidad del cliente, y genera un acta en PDF. La firma puede enviarse como cadena base64 (`client_signature`, JSON) o como archivo (`client_signature_file`, multipart). Las fotos (`photos[]`) requieren multipart/form-data. 

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getStaffVisitasApi();
final int id = 56; // int | 
final ServiceReportRequest serviceReportRequest = ; // ServiceReportRequest | 

try {
    final response = api.supportTicketsIdServiceReportPost(id, serviceReportRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StaffVisitasApi->supportTicketsIdServiceReportPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **serviceReportRequest** | [**ServiceReportRequest**](ServiceReportRequest.md)|  | 

### Return type

[**SupportTicketsIdCheckInPost201Response**](SupportTicketsIdCheckInPost201Response.md)

### Authorization

[staffAuth](../README.md#staffAuth)

### HTTP request headers

 - **Content-Type**: application/json, multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

