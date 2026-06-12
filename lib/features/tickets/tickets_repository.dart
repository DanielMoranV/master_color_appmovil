import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mastercolor_api/mastercolor_api.dart';

import '../../core/auth/auth_controller.dart';
import '../../core/auth/session.dart';
import '../../core/network/api_exception.dart';
import '../../core/network/mastercolor_api_provider.dart';
import '../../core/pagination/paged_state.dart';

/// Acceso a los tickets de soporte. Es role-aware: según el [UserRole] usa la
/// API de cliente (`/client/support/tickets`) o la de staff (`/support/tickets`).
class TicketsRepository {
  TicketsRepository(this._api, this._dio);

  final MastercolorApi _api;
  final Dio _dio;

  ClienteTicketsApi get _client => _api.getClienteTicketsApi();
  StaffTicketsApi get _staff => _api.getStaffTicketsApi();
  StaffVisitasApi get _visits => _api.getStaffVisitasApi();

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
  ///
  /// Si [serviceType] es `domicilio`, [serviceAddressId] es obligatorio (el
  /// backend devuelve 422 si falta).
  Future<SupportTicket> create({
    int? soldUnitId,
    required TicketCategory category,
    TicketPriority? priority,
    required String subject,
    required String description,
    TicketCreateRequestServiceTypeEnum? serviceType,
    int? serviceAddressId,
  }) async {
    try {
      final res = await _client.clientSupportTicketsPost(
        ticketCreateRequest: TicketCreateRequest(
          soldUnitId: soldUnitId,
          category: category,
          priority: priority,
          subject: subject,
          description: description,
          serviceType: serviceType,
          serviceAddressId: serviceAddressId,
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
  Future<List<Technician>> listTechnicians({
    String? search,
    String? specialty,
    String? zone,
    bool availableOnly = false,
  }) async {
    try {
      final res = await _api.getStaffUsuariosApi().supportTechniciansGet(
            search: search,
            specialty: specialty,
            zone: zone,
            availableOnly: availableOnly ? true : null,
            perPage: 100,
          );
      return res.data?.data ?? const [];
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  /// El técnico autenticado actualiza su perfil (especialidades, zonas de
  /// cobertura y disponibilidad). Devuelve el técnico actualizado.
  Future<Technician> updateMyProfile({
    List<TechnicianProfileRequestSpecialtiesEnum>? specialties,
    List<String>? coverageZones,
    bool? isAvailable,
  }) async {
    try {
      final res = await _api.getStaffUsuariosApi().supportTechniciansMePatch(
            technicianProfileRequest: TechnicianProfileRequest(
              specialties: specialties,
              coverageZones: coverageZones,
              isAvailable: isAvailable,
            ),
          );
      final tech = res.data?.data;
      if (tech == null) {
        throw ApiException('No se pudo actualizar el perfil.');
      }
      return tech;
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

  /// Programa o reprograma la visita de un ticket (solo staff).
  Future<void> schedule({
    required int id,
    required DateTime scheduledAt,
    int? windowMinutes,
    String? note,
  }) async {
    try {
      await _staff.supportTicketsIdSchedulePatch(
        id: id,
        ticketScheduleRequest: TicketScheduleRequest(
          scheduledAt: scheduledAt,
          scheduledWindowMinutes: windowMinutes,
          note: (note != null && note.trim().isNotEmpty) ? note.trim() : null,
        ),
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  /// Agenda del técnico autenticado: tickets con visita programada en [date]
  /// (por defecto hoy), ordenados por hora. Solo staff.
  ///
  /// Usa el [Dio] crudo para enviar `date` como `yyyy-MM-dd` (el método generado
  /// serializaría el [DateTime] con hora y rompería el filtro del backend).
  Future<List<SupportTicket>> agenda({DateTime? date}) async {
    try {
      final res = await _dio.get<Map<String, dynamic>>(
        '/support/tickets/agenda',
        queryParameters: {
          if (date != null) 'date': DateFormat('yyyy-MM-dd').format(date),
        },
      );
      final body = SupportTicketsAgendaGet200Response.fromJson(res.data ?? {});
      return body.data ?? const [];
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  /// Check-in de la visita (registra la llegada). Solo staff. La geolocalización
  /// es opcional; `at` por defecto = ahora en el backend. Devuelve la visita
  /// abierta. → 409 si ya hay una visita en curso sin check-out.
  Future<TicketVisit> checkIn({
    required int id,
    double? latitude,
    double? longitude,
  }) async {
    try {
      final res = await _visits.supportTicketsIdCheckInPost(
        id: id,
        visitCheckRequest: (latitude != null || longitude != null)
            ? VisitCheckRequest(latitude: latitude, longitude: longitude)
            : null,
      );
      return _requireVisit(res.data?.data);
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  /// Check-out de la visita (registra la salida). Solo staff. → 409 si no hay
  /// visita abierta. El backend calcula `duration_minutes`.
  Future<TicketVisit> checkOut({
    required int id,
    double? latitude,
    double? longitude,
  }) async {
    try {
      final res = await _visits.supportTicketsIdCheckOutPost(
        id: id,
        visitCheckRequest: (latitude != null || longitude != null)
            ? VisitCheckRequest(latitude: latitude, longitude: longitude)
            : null,
      );
      return _requireVisit(res.data?.data);
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  /// Acta de conformidad / reporte de servicio. Solo staff. Envía la firma como
  /// imagen PNG y, opcionalmente, fotos del servicio (multipart). Si [resolve]
  /// es true, marca el ticket como resuelto. Devuelve la visita con el acta PDF.
  Future<TicketVisit> serviceReport({
    required int id,
    required String workDone,
    String? clientSignedName,
    List<int>? signaturePng,
    List<XFile> photos = const [],
    bool resolve = false,
  }) async {
    try {
      final form = FormData();
      form.fields.add(MapEntry('work_done', workDone));
      if (clientSignedName != null && clientSignedName.trim().isNotEmpty) {
        form.fields.add(MapEntry('client_signed_name', clientSignedName.trim()));
      }
      form.fields.add(MapEntry('resolve', resolve ? '1' : '0'));
      if (signaturePng != null && signaturePng.isNotEmpty) {
        form.files.add(MapEntry(
          'client_signature_file',
          MultipartFile.fromBytes(signaturePng, filename: 'firma.png'),
        ));
      }
      for (final photo in photos) {
        form.files.add(MapEntry(
          'photos[]',
          await MultipartFile.fromFile(photo.path, filename: photo.name),
        ));
      }
      final res = await _dio.post<Map<String, dynamic>>(
        '/support/tickets/$id/service-report',
        data: form,
      );
      final body =
          SupportTicketsIdCheckInPost201Response.fromJson(res.data ?? {});
      return _requireVisit(body.data);
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  TicketVisit _requireVisit(TicketVisit? visit) {
    if (visit == null) {
      throw ApiException('No se recibió la información de la visita.');
    }
    return visit;
  }

  StaffRepuestosApi get _parts => _api.getStaffRepuestosApi();

  /// Busca repuestos en el inventario (solo staff).
  Future<List<StockPart>> searchParts({String? search}) async {
    try {
      final res = await _parts.supportPartsGet(search: search, perPage: 30);
      return res.data?.data ?? const [];
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  /// Registra el consumo de un repuesto en el ticket (descuenta stock). Solo
  /// staff. → 409 si no hay stock suficiente o el ticket es terminal.
  Future<TicketPart> addPart({
    required int id,
    required int stockId,
    required int quantity,
    double? unitCost,
  }) async {
    try {
      final res = await _parts.supportTicketsIdPartsPost(
        id: id,
        ticketPartAddRequest: TicketPartAddRequest(
          stockId: stockId,
          quantity: quantity,
          unitCost: unitCost,
        ),
      );
      final part = res.data?.data;
      if (part == null) {
        throw ApiException('No se pudo registrar el repuesto.');
      }
      return part;
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  /// Quita un repuesto del ticket (revierte el descuento de stock). Solo staff.
  Future<void> removePart({required int id, required int partId}) async {
    try {
      await _parts.supportTicketsIdPartsPartIdDelete(id: id, partId: partId);
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  /// Crea la cotización del ticket (solo staff). Si se omite [partsCost] el
  /// backend lo calcula de los repuestos registrados. Mueve el ticket a
  /// `en_espera_aprobacion`.
  Future<void> createQuote({
    required int id,
    required double laborCost,
    double? partsCost,
    String currency = 'PEN',
    String? note,
  }) async {
    try {
      await _staff.supportTicketsIdQuotePost(
        id: id,
        ticketQuoteCreateRequest: TicketQuoteCreateRequest(
          laborCost: laborCost,
          partsCost: partsCost,
          currency: currency,
          note: (note != null && note.trim().isNotEmpty) ? note.trim() : null,
        ),
      );
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  /// El cliente aprueba la cotización vigente. → 409 si ya fue resuelta.
  Future<void> approveQuote(int id) async {
    try {
      await _client.clientSupportTicketsIdQuoteApprovePost(id: id);
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  /// El cliente rechaza la cotización vigente. → 409 si ya fue resuelta.
  Future<void> rejectQuote(int id) async {
    try {
      await _client.clientSupportTicketsIdQuoteRejectPost(id: id);
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  /// Lista de escalamiento por SLA (solo staff). [filter] ∈ {all, due_soon,
  /// breached}. Ordenada por vencimiento.
  Future<List<SupportTicket>> slaList({String filter = 'all'}) async {
    try {
      final res = await _staff.supportTicketsSlaGet(filter: filter);
      return res.data?.data ?? const [];
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }
}

/// Alias legible para el tipo (largo) de un repuesto del inventario.
typedef StockPart = SupportPartsGet200ResponseAllOfDataInner;

final ticketsRepositoryProvider = Provider<TicketsRepository>((ref) {
  return TicketsRepository(
    ref.watch(mastercolorApiProvider),
    ref.watch(apiClientProvider).dio,
  );
});
