import 'package:test/test.dart';
import 'package:mastercolor_api/mastercolor_api.dart';


/// tests for StaffRepuestosApi
void main() {
  final instance = MastercolorApi().getStaffRepuestosApi();

  group(StaffRepuestosApi, () {
    // Buscar repuestos del inventario
    //
    //Future<SupportPartsGet200Response> supportPartsGet({ int page, int perPage, String search }) async
    test('test supportPartsGet', () async {
      // TODO
    });

    // Quitar repuesto (revierte el descuento de stock)
    //
    //Future<ApiSuccess> supportTicketsIdPartsPartIdDelete(int id, int partId) async
    test('test supportTicketsIdPartsPartIdDelete', () async {
      // TODO
    });

    // Registrar repuesto consumido (descuenta inventario)
    //
    //Future<SupportTicketsIdPartsPost201Response> supportTicketsIdPartsPost(int id, TicketPartAddRequest ticketPartAddRequest) async
    test('test supportTicketsIdPartsPost', () async {
      // TODO
    });

  });
}
