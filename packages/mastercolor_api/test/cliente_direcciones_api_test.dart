import 'package:test/test.dart';
import 'package:mastercolor_api/mastercolor_api.dart';


/// tests for ClienteDireccionesApi
void main() {
  final instance = MastercolorApi().getClienteDireccionesApi();

  group(ClienteDireccionesApi, () {
    // Listar direcciones del cliente
    //
    // Direcciones del cliente autenticado, con coordenadas (latitude/longitude) cuando estén disponibles. Se usan para elegir a dónde va el técnico en un servicio a domicilio.
    //
    //Future<ClientAddressesGet200Response> clientAddressesGet() async
    test('test clientAddressesGet', () async {
      // TODO
    });

  });
}
