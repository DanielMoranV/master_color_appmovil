import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mastercolor_api/mastercolor_api.dart';

import '../../core/auth/session.dart';
import '../../core/network/api_exception.dart';
import '../../core/network/mastercolor_api_provider.dart';
import '../../core/pagination/paged_state.dart';

/// Acceso a los tickets de soporte. Es role-aware: según el [UserRole] usa la
/// API de cliente (`/client/support/tickets`) o la de staff (`/support/tickets`).
class TicketsRepository {
  TicketsRepository(this._api);

  final MastercolorApi _api;

  ClienteTicketsApi get _client => _api.getClienteTicketsApi();
  StaffTicketsApi get _staff => _api.getStaffTicketsApi();

  /// Página de tickets para el [role] activo.
  ///
  /// Cliente: sus tickets (filtro por [status]).
  /// Staff: cola general (`supportTicketsGet`, con [status]/[priority]/
  /// [category]/[search] y paginación) o, si [mine] es true, solo los asignados
  /// al técnico autenticado (`supportTicketsMineGet`, solo filtro por estado y
  /// sin paginación).
  Future<PageResult<SupportTicket>> list({
    required UserRole role,
    TicketStatus? status,
    String? search,
    TicketPriority? priority,
    TicketCategory? category,
    bool mine = false,
    int page = 1,
  }) async {
    try {
      if (role == UserRole.client) {
        final res = await _client.clientSupportTicketsGet(
          status: status,
          page: page,
        );
        return _toPage(res.data, page);
      }
      if (mine) {
        final res = await _staff.supportTicketsMineGet(status: status);
        // "mine" no admite paginación por página: una sola carga.
        return PageResult(
          items: res.data?.data ?? const [],
          currentPage: 1,
          lastPage: 1,
        );
      }
      final res = await _staff.supportTicketsGet(
        status: status,
        search: search,
        priority: priority,
        category: category,
        page: page,
      );
      return _toPage(res.data, page);
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  PageResult<SupportTicket> _toPage(
    ClientSupportTicketsGet200Response? body,
    int page,
  ) {
    return PageResult(
      items: body?.data ?? const [],
      currentPage: body?.pagination?.currentPage ?? page,
      lastPage: body?.pagination?.lastPage ?? page,
    );
  }

  /// Detalle de un ticket con su conversación.
  Future<SupportTicketDetail> detail({
    required UserRole role,
    required int id,
  }) async {
    try {
      final res = role == UserRole.client
          ? await _client.clientSupportTicketsIdGet(id: id)
          : await _staff.supportTicketsIdGet(id: id);
      final ticket = res.data?.data;
      if (ticket == null) {
        throw ApiException('No se encontró el ticket.', statusCode: 404);
      }
      return ticket;
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  /// Envía un mensaje en el ticket. [isInternal] solo aplica a staff (nota interna).
  Future<TicketMessage> sendMessage({
    required UserRole role,
    required int id,
    required String body,
    bool isInternal = false,
  }) async {
    try {
      final res = role == UserRole.client
          ? await _client.clientSupportTicketsIdMessagesPost(
              id: id,
              clientSupportTicketsIdMessagesPostRequest:
                  ClientSupportTicketsIdMessagesPostRequest(body: body),
            )
          : await _staff.supportTicketsIdMessagesPost(
              id: id,
              supportTicketsIdMessagesPostRequest:
                  SupportTicketsIdMessagesPostRequest(
                body: body,
                isInternal: isInternal,
              ),
            );
      final message = res.data?.data;
      if (message == null) {
        throw ApiException('No se pudo enviar el mensaje.');
      }
      return message;
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  /// Califica la atención de un ticket resuelto (solo cliente). [rating] 1–5.
  Future<void> rate({
    required int id,
    required int rating,
    String? comment,
  }) async {
    try {
      await _client.clientSupportTicketsIdRatePost(
        id: id,
        clientSupportTicketsIdRatePostRequest:
            ClientSupportTicketsIdRatePostRequest(
          rating: rating,
          comment: (comment == null || comment.trim().isEmpty)
              ? null
              : comment.trim(),
        ),
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  /// Reabre un ticket resuelto/cerrado (solo cliente), indicando el motivo.
  Future<void> reopen({required int id, required String reason}) async {
    try {
      await _client.clientSupportTicketsIdReopenPut(
        id: id,
        clientSupportTicketsIdReopenPutRequest:
            ClientSupportTicketsIdReopenPutRequest(reason: reason.trim()),
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  /// Crea un ticket de soporte (solo cliente).
  Future<SupportTicket> create({
    int? soldUnitId,
    required TicketCategory category,
    TicketPriority? priority,
    required String subject,
    required String description,
  }) async {
    try {
      final res = await _client.clientSupportTicketsPost(
        ticketCreateRequest: TicketCreateRequest(
          soldUnitId: soldUnitId,
          category: category,
          priority: priority,
          subject: subject,
          description: description,
        ),
      );
      final ticket = res.data?.data;
      if (ticket == null) {
        throw ApiException('No se pudo crear el ticket.');
      }
      return ticket;
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  /// Adjunta imágenes/videos al ticket (cliente o staff). Opcionalmente las
  /// asocia a un mensaje concreto. Devuelve los adjuntos creados.
  Future<List<TicketAttachment>> addAttachments({
    required UserRole role,
    required int id,
    required List<XFile> files,
    int? messageId,
  }) async {
    try {
      final multipart = [
        for (final f in files)
          await MultipartFile.fromFile(f.path, filename: f.name),
      ];
      final res = role == UserRole.client
          ? await _client.clientSupportTicketsIdAttachmentsPost(
              id: id,
              files: multipart,
              messageId: messageId,
            )
          : await _staff.supportTicketsIdAttachmentsPost(
              id: id,
              files: multipart,
              messageId: messageId,
            );
      return res.data?.data ?? const [];
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  /// Cambia el estado del ticket (solo staff).
  Future<void> changeStatus({
    required int id,
    required TicketStatus status,
    String? note,
  }) async {
    try {
      await _staff.supportTicketsIdStatusPatch(
        id: id,
        supportTicketsIdStatusPatchRequest:
            SupportTicketsIdStatusPatchRequest(status: status, note: note),
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  /// Lista los técnicos asignables (solo staff), con búsqueda opcional.
  Future<List<Technician>> listTechnicians({String? search}) async {
    try {
      final res = await _api.getStaffUsuariosApi().supportTechniciansGet(
            search: search,
            perPage: 100,
          );
      return res.data?.data ?? const [];
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  /// Asigna el ticket a un técnico (solo staff).
  Future<void> assign({required int id, required int assignedUserId}) async {
    try {
      await _staff.supportTicketsIdAssignPatch(
        id: id,
        supportTicketsIdAssignPatchRequest:
            SupportTicketsIdAssignPatchRequest(assignedUserId: assignedUserId),
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  /// Registra el diagnóstico técnico y, si [resolve] es true, marca el ticket
  /// como resuelto (cierre de servicio). Solo staff.
  Future<void> diagnose({
    required int id,
    required String diagnosis,
    String? partsUsed,
    bool resolve = false,
  }) async {
    try {
      await _staff.supportTicketsIdDiagnosisPost(
        id: id,
        diagnosisRequest: DiagnosisRequest(
          diagnosis: diagnosis,
          partsUsed: partsUsed,
          resolve: resolve,
        ),
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }
}

final ticketsRepositoryProvider = Provider<TicketsRepository>((ref) {
  return TicketsRepository(ref.watch(mastercolorApiProvider));
});
