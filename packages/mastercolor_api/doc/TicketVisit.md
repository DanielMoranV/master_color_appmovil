# mastercolor_api.model.TicketVisit

## Load the model package
```dart
import 'package:mastercolor_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** |  | [optional] 
**ticketId** | **int** |  | [optional] 
**technicianId** | **int** |  | [optional] 
**technicianName** | **String** |  | [optional] 
**checkinAt** | [**DateTime**](DateTime.md) |  | [optional] 
**checkinLatitude** | **double** |  | [optional] 
**checkinLongitude** | **double** |  | [optional] 
**checkoutAt** | [**DateTime**](DateTime.md) |  | [optional] 
**checkoutLatitude** | **double** |  | [optional] 
**checkoutLongitude** | **double** |  | [optional] 
**durationMinutes** | **int** | Tiempo en sitio (null mientras la visita siga abierta). | [optional] 
**workDone** | **String** |  | [optional] 
**clientSignedName** | **String** |  | [optional] 
**signatureUrl** | **String** |  | [optional] 
**reportPdfUrl** | **String** | URL del acta de conformidad en PDF. | [optional] 
**reportedAt** | [**DateTime**](DateTime.md) |  | [optional] 
**createdAt** | [**DateTime**](DateTime.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


