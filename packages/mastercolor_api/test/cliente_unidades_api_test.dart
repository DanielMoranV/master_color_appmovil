import 'package:test/test.dart';
import 'package:mastercolor_api/mastercolor_api.dart';


/// tests for ClienteUnidadesApi
void main() {
  final instance = MastercolorApi().getClienteUnidadesApi();

  group(ClienteUnidadesApi, () {
    // Listar mis unidades vendidas
    //
    // Unidades derivadas de las órdenes del cliente más las registradas manualmente.
    //
    //Future<ClientUnitsGet200Response> clientUnitsGet({ int page, int perPage, SoldUnitStatus status, String warranty }) async
    test('test clientUnitsGet', () async {
      // TODO
    });

    // Detalle de una unidad
    //
    //Future<ClientUnitsIdGet200Response> clientUnitsIdGet(int id) async
    test('test clientUnitsIdGet', () async {
      // TODO
    });

    // Estado de garantía de una unidad
    //
    //Future<ClientUnitsIdWarrantyGet200Response> clientUnitsIdWarrantyGet(int id) async
    test('test clientUnitsIdWarrantyGet', () async {
      // TODO
    });

    // Registrar una unidad manualmente
    //
    // Para unidades compradas fuera del canal online. El `serial_number` es opcional (productos no serializados). Puede adjuntar comprobante de compra. 
    //
    //Future<ClientUnitsPost201Response> clientUnitsPost(int productId, DateTime purchaseDate, { String serialNumber, MultipartFile proofFile }) async
    test('test clientUnitsPost', () async {
      // TODO
    });

  });
}
