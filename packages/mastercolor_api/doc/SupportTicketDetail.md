# mastercolor_api.model.SupportTicketDetail

## Load the model package
```dart
import 'package:mastercolor_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** |  | [optional] 
**code** | **String** |  | [optional] 
**clientId** | **int** |  | [optional] 
**soldUnitId** | **int** |  | [optional] 
**productId** | **int** |  | [optional] 
**category** | [**TicketCategory**](TicketCategory.md) |  | [optional] 
**priority** | [**TicketPriority**](TicketPriority.md) |  | [optional] 
**subject** | **String** |  | [optional] 
**description** | **String** |  | [optional] 
**status** | [**TicketStatus**](TicketStatus.md) |  | [optional] 
**channel** | [**TicketChannel**](TicketChannel.md) |  | [optional] 
**assignedUserId** | **int** |  | [optional] 
**assignedUserName** | **String** |  | [optional] 
**isWarrantyCovered** | **bool** |  | [optional] 
**slaDueAt** | [**DateTime**](DateTime.md) |  | [optional] 
**firstResponseAt** | [**DateTime**](DateTime.md) |  | [optional] 
**resolvedAt** | [**DateTime**](DateTime.md) |  | [optional] 
**closedAt** | [**DateTime**](DateTime.md) |  | [optional] 
**rating** | **int** |  | [optional] 
**createdAt** | [**DateTime**](DateTime.md) |  | [optional] 
**updatedAt** | [**DateTime**](DateTime.md) |  | [optional] 
**soldUnit** | [**SoldUnit**](SoldUnit.md) |  | [optional] 
**messages** | [**List&lt;TicketMessage&gt;**](TicketMessage.md) |  | [optional] 
**attachments** | [**List&lt;TicketAttachment&gt;**](TicketAttachment.md) |  | [optional] 
**statusHistory** | [**List&lt;TicketStatusHistory&gt;**](TicketStatusHistory.md) |  | [optional] 
**diagnosis** | **String** |  | [optional] 
**partsUsed** | **String** |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


