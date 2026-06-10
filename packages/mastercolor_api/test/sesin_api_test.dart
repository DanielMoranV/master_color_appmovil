import 'package:test/test.dart';
import 'package:mastercolor_api/mastercolor_api.dart';


/// tests for SesinApi
void main() {
  final instance = MastercolorApi().getSesinApi();

  group(SesinApi, () {
    // Usuario staff autenticado
    //
    //Future<AuthMeGet200Response> authMeGet() async
    test('test authMeGet', () async {
      // TODO
    });

    // Cliente autenticado
    //
    //Future<ClientAuthMeGet200Response> clientAuthMeGet() async
    test('test clientAuthMeGet', () async {
      // TODO
    });

  });
}
