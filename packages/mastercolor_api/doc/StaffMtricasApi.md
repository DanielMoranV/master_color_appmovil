# mastercolor_api.api.StaffMtricasApi

## Load the API package
```dart
import 'package:mastercolor_api/api.dart';
```

All URIs are relative to *http://localhost:8000/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**supportMetricsGet**](StaffMtricasApi.md#supportmetricsget) | **GET** /support/metrics | Indicadores del área de soporte


# **supportMetricsGet**
> SupportMetricsGet200Response supportMetricsGet(dateFrom, dateTo)

Indicadores del área de soporte

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getStaffMtricasApi();
final DateTime dateFrom = 2013-10-20; // DateTime | 
final DateTime dateTo = 2013-10-20; // DateTime | 

try {
    final response = api.supportMetricsGet(dateFrom, dateTo);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StaffMtricasApi->supportMetricsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dateFrom** | **DateTime**|  | [optional] 
 **dateTo** | **DateTime**|  | [optional] 

### Return type

[**SupportMetricsGet200Response**](SupportMetricsGet200Response.md)

### Authorization

[staffAuth](../README.md#staffAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

