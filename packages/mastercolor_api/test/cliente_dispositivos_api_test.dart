import 'package:test/test.dart';
import 'package:mastercolor_api/mastercolor_api.dart';


/// tests for ClienteDispositivosApi
void main() {
  final instance = MastercolorApi().getClienteDispositivosApi();

  group(ClienteDispositivosApi, () {
    // Registrar token push (FCM) del cliente
    //
    //Future<ApiSuccess> clientDevicesPost(DeviceTokenRequest deviceTokenRequest) async
    test('test clientDevicesPost', () async {
      // TODO
    });

    // Eliminar token push (logout/desinstalación)
    //
    //Future<ApiSuccess> clientDevicesTokenDelete(String token) async
    test('test clientDevicesTokenDelete', () async {
      // TODO
    });

  });
}
