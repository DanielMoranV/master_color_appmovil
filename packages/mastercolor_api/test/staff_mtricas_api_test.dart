import 'package:test/test.dart';
import 'package:mastercolor_api/mastercolor_api.dart';


/// tests for StaffMtricasApi
void main() {
  final instance = MastercolorApi().getStaffMtricasApi();

  group(StaffMtricasApi, () {
    // Indicadores del área de soporte
    //
    //Future<SupportMetricsGet200Response> supportMetricsGet({ DateTime dateFrom, DateTime dateTo }) async
    test('test supportMetricsGet', () async {
      // TODO
    });

  });
}
