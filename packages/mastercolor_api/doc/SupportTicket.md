# mastercolor_api.model.SupportTicket

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
**serviceType** | **String** | Tipo de servicio. Si es 'domicilio', service_address está presente. | [optional] 
**serviceAddressId** | **int** |  | [optional] 
**scheduledAt** | [**DateTime**](DateTime.md) | Fecha/hora programada de la visita. | [optional] 
**scheduledWindowMinutes** | **int** | Ventana de tolerancia en minutos. | [optional] 
**assignedUserId** | **int** |  | [optional] 
**assignedUserName** | **String** |  | [optional] 
**isWarrantyCovered** | **bool** |  | [optional] 
**slaDueAt** | [**DateTime**](DateTime.md) |  | [optional] 
**slaStatus** | **String** | Estado del SLA del ticket; null si está resuelto/cerrado/cancelado o sin SLA. | [optional] 
**firstResponseAt** | [**DateTime**](DateTime.md) |  | [optional] 
**resolvedAt** | [**DateTime**](DateTime.md) |  | [optional] 
**closedAt** | [**DateTime**](DateTime.md) |  | [optional] 
**rating** | **int** |  | [optional] 
**ratingComment** | **String** |  | [optional] 
**createdAt** | [**DateTime**](DateTime.md) |  | [optional] 
**updatedAt** | [**DateTime**](DateTime.md) |  | [optional] 
**client** | [**SupportTicketClient**](SupportTicketClient.md) |  | [optional] 
**serviceAddress** | [**Address**](Address.md) | Dirección del servicio a domicilio (presente si aplica). | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


