# mastercolor_api.model.ServiceReportRequest

## Load the model package
```dart
import 'package:mastercolor_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**workDone** | **String** |  | 
**clientSignedName** | **String** |  | [optional] 
**clientSignature** | **String** | Firma como cadena base64 (data URI o base64 puro). Alternativa a client_signature_file. | [optional] 
**clientSignatureFile** | [**MultipartFile**](MultipartFile.md) | Firma como imagen (multipart). Alternativa a client_signature. | [optional] 
**parts** | [**List&lt;ServiceReportRequestPartsInner&gt;**](ServiceReportRequestPartsInner.md) | Repuestos consumidos durante la visita (descuentan inventario). | [optional] 
**photos** | [**List&lt;MultipartFile&gt;**](MultipartFile.md) | Fotos del servicio (multipart). | [optional] 
**resolve** | **bool** | Si es true, marca el ticket como 'resuelto' al cerrar el acta. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


