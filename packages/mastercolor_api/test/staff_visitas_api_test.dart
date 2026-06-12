import 'package:test/test.dart';
import 'package:mastercolor_api/mastercolor_api.dart';


/// tests for StaffVisitasApi
void main() {
  final instance = MastercolorApi().getStaffVisitasApi();

  group(StaffVisitasApi, () {
    // Check-in de la visita (registra llegada con geolocalización)
    //
    // Inicia una visita en sitio. Falla con 409 si ya hay una visita en curso (sin check-out).
    //
    //Future<SupportTicketsIdCheckInPost201Response> supportTicketsIdCheckInPost(int id, { VisitCheckRequest visitCheckRequest }) async
    test('test supportTicketsIdCheckInPost', () async {
      // TODO
    });

    // Check-out de la visita (registra salida con geolocalización)
    //
    // Cierra la visita en curso y calcula el tiempo en sitio. Falla con 409 si no hay visita abierta.
    //
    //Future<SupportTicketsIdCheckInPost201Response> supportTicketsIdCheckOutPost(int id, { VisitCheckRequest visitCheckRequest }) async
    test('test supportTicketsIdCheckOutPost', () async {
      // TODO
    });

    // Reporte de servicio / acta de conformidad con firma
    //
    // Cierra formalmente la visita: registra el trabajo realizado, los repuestos consumidos (descuentan inventario), las fotos y la firma de conformidad del cliente, y genera un acta en PDF. La firma puede enviarse como cadena base64 (`client_signature`, JSON) o como archivo (`client_signature_file`, multipart). Las fotos (`photos[]`) requieren multipart/form-data. 
    //
    //Future<SupportTicketsIdCheckInPost201Response> supportTicketsIdServiceReportPost(int id, ServiceReportRequest serviceReportRequest) async
    test('test supportTicketsIdServiceReportPost', () async {
      // TODO
    });

  });
}
