import 'package:test/test.dart';
import 'package:mastercolor_api/mastercolor_api.dart';


/// tests for StaffUsuariosApi
void main() {
  final instance = MastercolorApi().getStaffUsuariosApi();

  group(StaffUsuariosApi, () {
    // Listar técnicos asignables
    //
    // Usuarios con rol `Tecnico` activos, para asignar en `PATCH /support/tickets/{id}/assign`.
    //
    //Future<SupportTechniciansGet200Response> supportTechniciansGet({ int page, int perPage, String search }) async
    test('test supportTechniciansGet', () async {
      // TODO
    });

  });
}
