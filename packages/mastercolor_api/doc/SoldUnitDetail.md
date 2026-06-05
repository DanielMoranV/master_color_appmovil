# mastercolor_api.model.SoldUnitDetail

## Load the model package
```dart
import 'package:mastercolor_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** |  | [optional] 
**clientId** | **int** |  | [optional] 
**productId** | **int** |  | [optional] 
**productName** | **String** |  | [optional] 
**orderId** | **int** |  | [optional] 
**serialNumber** | **String** | Opcional (productos no serializados). | [optional] 
**purchaseDate** | [**DateTime**](DateTime.md) |  | [optional] 
**warrantyMonths** | **int** |  | [optional] 
**warrantyExpiresAt** | [**DateTime**](DateTime.md) |  | [optional] 
**warrantyActive** | **bool** |  | [optional] 
**registrationSource** | **String** |  | [optional] 
**status** | [**SoldUnitStatus**](SoldUnitStatus.md) |  | [optional] 
**createdAt** | [**DateTime**](DateTime.md) |  | [optional] 
**proofFileUrl** | **String** |  | [optional] 
**warranty** | [**Warranty**](Warranty.md) |  | [optional] 
**tickets** | [**List&lt;SupportTicket&gt;**](SupportTicket.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


