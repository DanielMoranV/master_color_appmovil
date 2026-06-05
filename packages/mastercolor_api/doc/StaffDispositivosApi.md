# mastercolor_api.api.StaffDispositivosApi

## Load the API package
```dart
import 'package:mastercolor_api/api.dart';
```

All URIs are relative to *http://localhost:8000/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**supportDevicesPost**](StaffDispositivosApi.md#supportdevicespost) | **POST** /support/devices | Registrar token push (FCM) del staff


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

