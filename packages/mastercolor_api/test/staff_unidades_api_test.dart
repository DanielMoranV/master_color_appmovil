import 'package:test/test.dart';
import 'package:mastercolor_api/mastercolor_api.dart';


/// tests for StaffUnidadesApi
void main() {
  final instance = MastercolorApi().getStaffUnidadesApi();

  group(StaffUnidadesApi, () {
    // Buscar unidades vendidas
    //
    //Future<ClientUnitsGet200Response> supportUnitsGet({ int page, int perPage, String serialNumber, int clientId, int productId }) async
    test('test supportUnitsGet', () async {
      // TODO
    });

    // Detalle de una unidad (con historial de tickets)
    //
    //Future<ClientUnitsIdGet200Response> supportUnitsIdGet(int id) async
    test('test supportUnitsIdGet', () async {
      // TODO
    });

    // Actualizar una unidad (asignar nº de serie / estado)
    //
    //Future<ClientUnitsPost201Response> supportUnitsIdPatch(int id, SupportUnitsIdPatchRequest supportUnitsIdPatchRequest) async
    test('test supportUnitsIdPatch', () async {
      // TODO
    });

  });
}
