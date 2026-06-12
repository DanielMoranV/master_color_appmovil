# mastercolor_api.model.ServiceHistoryEvent

## Load the model package
```dart
import 'package:mastercolor_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**type** | **String** |  | [optional] 
**at** | [**DateTime**](DateTime.md) |  | [optional] 
**ticketId** | **int** |  | [optional] 
**ticketCode** | **String** |  | [optional] 
**category** | **String** | Solo en ticket_opened. | [optional] 
**subject** | **String** | Solo en ticket_opened. | [optional] 
**technician** | **String** | Técnico (visit / resolved). | [optional] 
**checkinAt** | [**DateTime**](DateTime.md) | Solo en visit. | [optional] 
**checkoutAt** | [**DateTime**](DateTime.md) | Solo en visit. | [optional] 
**durationMinutes** | **int** | Solo en visit. | [optional] 
**workDone** | **String** | Solo en visit. | [optional] 
**reportedAt** | [**DateTime**](DateTime.md) | Solo en visit. | [optional] 
**diagnosis** | **String** | Solo en resolved. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


