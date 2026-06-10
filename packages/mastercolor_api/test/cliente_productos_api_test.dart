import 'package:test/test.dart';
import 'package:mastercolor_api/mastercolor_api.dart';


/// tests for ClienteProductosApi
void main() {
  final instance = MastercolorApi().getClienteProductosApi();

  group(ClienteProductosApi, () {
    // Catálogo de productos (para registro manual de unidad)
    //
    // Búsqueda paginada de productos para seleccionar al registrar una unidad.
    //
    //Future<ClientProductsGet200Response> clientProductsGet({ int page, int perPage, String search }) async
    test('test clientProductsGet', () async {
      // TODO
    });

  });
}
