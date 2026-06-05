import 'package:test/test.dart';
import 'package:mastercolor_api/mastercolor_api.dart';


/// tests for StaffDispositivosApi
void main() {
  final instance = MastercolorApi().getStaffDispositivosApi();

  group(StaffDispositivosApi, () {
    // Registrar token push (FCM) del staff
    //
    //Future<ApiSuccess> supportDevicesPost(DeviceTokenRequest deviceTokenRequest) async
    test('test supportDevicesPost', () async {
      // TODO
    });

  });
}
