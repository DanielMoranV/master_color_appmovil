import 'package:test/test.dart';
import 'package:mastercolor_api/mastercolor_api.dart';

// tests for ServiceReportRequest
void main() {
  final ServiceReportRequest? instance = /* ServiceReportRequest(...) */ null;
  // TODO add properties to the entity

  group(ServiceReportRequest, () {
    // String workDone
    test('to test the property `workDone`', () async {
      // TODO
    });

    // String clientSignedName
    test('to test the property `clientSignedName`', () async {
      // TODO
    });

    // Firma como cadena base64 (data URI o base64 puro). Alternativa a client_signature_file.
    // String clientSignature
    test('to test the property `clientSignature`', () async {
      // TODO
    });

    // Firma como imagen (multipart). Alternativa a client_signature.
    // MultipartFile clientSignatureFile
    test('to test the property `clientSignatureFile`', () async {
      // TODO
    });

    // Repuestos consumidos durante la visita (descuentan inventario).
    // List<ServiceReportRequestPartsInner> parts
    test('to test the property `parts`', () async {
      // TODO
    });

    // Fotos del servicio (multipart).
    // List<MultipartFile> photos
    test('to test the property `photos`', () async {
      // TODO
    });

    // Si es true, marca el ticket como 'resuelto' al cerrar el acta.
    // bool resolve
    test('to test the property `resolve`', () async {
      // TODO
    });

  });
}
