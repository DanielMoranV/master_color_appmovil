# mastercolor_api.api.ClienteDispositivosApi

## Load the API package
```dart
import 'package:mastercolor_api/api.dart';
```

All URIs are relative to *http://localhost:8000/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**clientDevicesPost**](ClienteDispositivosApi.md#clientdevicespost) | **POST** /client/devices | Registrar token push (FCM) del cliente
[**clientDevicesTokenDelete**](ClienteDispositivosApi.md#clientdevicestokendelete) | **DELETE** /client/devices/{token} | Eliminar token push (logout/desinstalación)


# **clientDevicesPost**
> ApiSuccess clientDevicesPost(deviceTokenRequest)

Registrar token push (FCM) del cliente

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getClienteDispositivosApi();
final DeviceTokenRequest deviceTokenRequest = ; // DeviceTokenRequest | 

try {
    final response = api.clientDevicesPost(deviceTokenRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ClienteDispositivosApi->clientDevicesPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceTokenRequest** | [**DeviceTokenRequest**](DeviceTokenRequest.md)|  | 

### Return type

[**ApiSuccess**](ApiSuccess.md)

### Authorization

[clientAuth](../README.md#clientAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **clientDevicesTokenDelete**
> ApiSuccess clientDevicesTokenDelete(token)

Eliminar token push (logout/desinstalación)

### Example
```dart
import 'package:mastercolor_api/api.dart';

final api = MastercolorApi().getClienteDispositivosApi();
final String token = token_example; // String | 

try {
    final response = api.clientDevicesTokenDelete(token);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ClienteDispositivosApi->clientDevicesTokenDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **token** | **String**|  | 

### Return type

[**ApiSuccess**](ApiSuccess.md)

### Authorization

[clientAuth](../README.md#clientAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

