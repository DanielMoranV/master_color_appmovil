import 'package:test/test.dart';
import 'package:mastercolor_api/mastercolor_api.dart';


/// tests for ClienteTicketsApi
void main() {
  final instance = MastercolorApi().getClienteTicketsApi();

  group(ClienteTicketsApi, () {
    // Listar mis tickets de soporte
    //
    //Future<ClientSupportTicketsGet200Response> clientSupportTicketsGet({ int page, int perPage, TicketStatus status }) async
    test('test clientSupportTicketsGet', () async {
      // TODO
    });

    // Adjuntar archivos al ticket
    //
    //Future<ClientSupportTicketsIdAttachmentsPost201Response> clientSupportTicketsIdAttachmentsPost(int id, List<MultipartFile> files, { int messageId }) async
    test('test clientSupportTicketsIdAttachmentsPost', () async {
      // TODO
    });

    // Detalle de un ticket (con conversación)
    //
    //Future<ClientSupportTicketsIdGet200Response> clientSupportTicketsIdGet(int id) async
    test('test clientSupportTicketsIdGet', () async {
      // TODO
    });

    // Enviar un mensaje en el ticket
    //
    //Future<ClientSupportTicketsIdMessagesPost201Response> clientSupportTicketsIdMessagesPost(int id, ClientSupportTicketsIdMessagesPostRequest clientSupportTicketsIdMessagesPostRequest) async
    test('test clientSupportTicketsIdMessagesPost', () async {
      // TODO
    });

    // Calificar la atención de un ticket resuelto
    //
    //Future<ClientSupportTicketsPost201Response> clientSupportTicketsIdRatePost(int id, ClientSupportTicketsIdRatePostRequest clientSupportTicketsIdRatePostRequest) async
    test('test clientSupportTicketsIdRatePost', () async {
      // TODO
    });

    // Reabrir un ticket resuelto/cerrado
    //
    //Future<ClientSupportTicketsPost201Response> clientSupportTicketsIdReopenPut(int id, ClientSupportTicketsIdReopenPutRequest clientSupportTicketsIdReopenPutRequest) async
    test('test clientSupportTicketsIdReopenPut', () async {
      // TODO
    });

    // Crear un ticket de soporte
    //
    //Future<ClientSupportTicketsPost201Response> clientSupportTicketsPost(TicketCreateRequest ticketCreateRequest) async
    test('test clientSupportTicketsPost', () async {
      // TODO
    });

  });
}
