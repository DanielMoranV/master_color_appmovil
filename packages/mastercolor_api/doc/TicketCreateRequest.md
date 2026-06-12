# mastercolor_api.model.TicketCreateRequest

## Load the model package
```dart
import 'package:mastercolor_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**soldUnitId** | **int** | Unidad asociada (opcional para consultas generales). | [optional] 
**category** | [**TicketCategory**](TicketCategory.md) |  | 
**priority** | [**TicketPriority**](TicketPriority.md) |  | [optional] 
**subject** | **String** |  | 
**description** | **String** |  | 
**serviceType** | **String** | Tipo de servicio. Si es 'domicilio', service_address_id es obligatorio. | [optional] [default to 'remoto']
**serviceAddressId** | **int** | Dirección del cliente a la que va el técnico (requerido si service_type=domicilio). | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


