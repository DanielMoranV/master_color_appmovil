# mastercolor_api.api.StaffDispositivosApi

## Load the API package
```dart
import 'package:mastercolor_api/api.dart';
```

All URIs are relative to *http://localhost:8000/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**supportDevicesPost**](StaffDispositivosApi.md#supportdevicespost) | **POST** /support/devices | Registrar token push (FCM) del staff
[**supportDevicesTokenDelete**](StaffDispositivosApi.md#supportdevicestokendelete) | **DELETE** /support/devices/{token} | Eliminar token push del staff (logout/desinstalación)


# **supportDevicesPost**
> ApiSuccess supportDevicesPost(deviceTokenRequest)

Registrar token push (FCM) del staff

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getStaffDispositivosApi();
final DeviceTokenRequest deviceTokenRequest = ; // DeviceTokenRequest | 

try {
    final response = api.supportDevicesPost(deviceTokenRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StaffDispositivosApi->supportDevicesPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceTokenRequest** | [**DeviceTokenRequest**](DeviceTokenRequest.md)|  | 

### Return type

[**ApiSuccess**](ApiSuccess.md)

### Authorization

[staffAuth](../README.md#staffAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **supportDevicesTokenDelete**
> ApiSuccess supportDevicesTokenDelete(token)

Eliminar token push del staff (logout/desinstalación)

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getStaffDispositivosApi();
final String token = token_example; // String | 

try {
    final response = api.supportDevicesTokenDelete(token);
    print(response);
} on DioException catch (e) {
    print('Exception when calling StaffDispositivosApi->supportDevicesTokenDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **token** | **String**|  | 

### Return type

[**ApiSuccess**](ApiSuccess.md)

### Authorization

[staffAuth](../README.md#staffAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

