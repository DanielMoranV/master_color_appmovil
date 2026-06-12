import 'package:flutter/material.dart';
import 'package:mastercolor_api/mastercolor_api.dart';

/// Helpers de presentación para los enums de tickets: etiquetas legibles en
/// español y colores para estados, prioridades y categorías.

extension TicketStatusUi on TicketStatus {
  String get label => switch (this) {
        TicketStatus.abierto => 'Abierto',
        TicketStatus.asignado => 'Asignado',
        TicketStatus.enProceso => 'En proceso',
        TicketStatus.enEsperaCliente => 'Espera cliente',
        TicketStatus.enEsperaAprobacion => 'Espera aprobación',
        TicketStatus.resuelto => 'Resuelto',
        TicketStatus.cerrado => 'Cerrado',
        TicketStatus.cancelado => 'Cancelado',
      };

  Color get color => switch (this) {
        TicketStatus.abierto => Colors.blue,
        TicketStatus.asignado => Colors.indigo,
        TicketStatus.enProceso => Colors.orange,
        TicketStatus.enEsperaCliente => Colors.amber,
        TicketStatus.enEsperaAprobacion => Colors.deepOrange,
        TicketStatus.resuelto => Colors.green,
        TicketStatus.cerrado => Colors.grey,
        TicketStatus.cancelado => Colors.red,
      };

  /// Estados terminales en los que no se permite seguir conversando/operando.
  bool get isClosed =>
      this == TicketStatus.cerrado || this == TicketStatus.cancelado;

  /// Transiciones de estado válidas desde el estado actual, según la máquina de
  /// estados del backend:
  ///   abierto→asignado, asignado→en_proceso, en_proceso⇄en_espera_cliente,
  ///   en_proceso→resuelto, resuelto→cerrado, (activo)→cancelado.
  ///
  /// Los estados terminales (cerrado/cancelado) no admiten cambios desde la app.
  List<TicketStatus> get nextStatuses => switch (this) {
        TicketStatus.abierto => const [
            TicketStatus.asignado,
            TicketStatus.cancelado,
          ],
        TicketStatus.asignado => const [
            TicketStatus.enProceso,
            TicketStatus.cancelado,
          ],
        TicketStatus.enProceso => const [
            TicketStatus.enEsperaCliente,
            TicketStatus.resuelto,
            TicketStatus.cancelado,
          ],
        TicketStatus.enEsperaCliente => const [
            TicketStatus.enProceso,
            TicketStatus.cancelado,
          ],
        // La decisión de la cotización la toma el cliente (approve/reject), que
        // devuelve el ticket a en_proceso. Solo exponemos cancelar manualmente.
        TicketStatus.enEsperaAprobacion => const [
            TicketStatus.cancelado,
          ],
        TicketStatus.resuelto => const [
            TicketStatus.cerrado,
            TicketStatus.cancelado,
          ],
        TicketStatus.cerrado => const [],
        TicketStatus.cancelado => const [],
      };
}

extension TicketPriorityUi on TicketPriority {
  String get label => switch (this) {
        TicketPriority.baja => 'Baja',
        TicketPriority.media => 'Media',
        TicketPriority.alta => 'Alta',
        TicketPriority.urgente => 'Urgente',
      };

  Color get color => switch (this) {
        TicketPriority.baja => Colors.green,
        TicketPriority.media => Colors.blueGrey,
        TicketPriority.alta => Colors.orange,
        TicketPriority.urgente => Colors.red,
      };
}

/// Presentación del estado de SLA a partir de su valor crudo (`on_track`,
/// `due_soon`, `breached`). Devuelve `null` si no hay SLA (resuelto/cerrado/
/// cancelado o sin SLA). Funciona para los dos enums generados (ticket y
/// detalle) vía su `.value`.
({String label, Color color, IconData icon})? slaPresentation(String? value) =>
    switch (value) {
      'on_track' =>
        (label: 'En tiempo', color: Colors.green, icon: Icons.check_circle_outline),
      'due_soon' =>
        (label: 'Por vencer', color: Colors.orange, icon: Icons.timelapse),
      'breached' =>
        (label: 'Vencido', color: Colors.red, icon: Icons.warning_amber),
      _ => null,
    };

extension TicketServiceTypeUi on SupportTicketDetailServiceTypeEnum {
  String get label => switch (this) {
        SupportTicketDetailServiceTypeEnum.remoto => 'Remoto',
        SupportTicketDetailServiceTypeEnum.domicilio => 'A domicilio',
        SupportTicketDetailServiceTypeEnum.taller => 'En taller',
      };

  IconData get icon => switch (this) {
        SupportTicketDetailServiceTypeEnum.remoto => Icons.support_agent,
        SupportTicketDetailServiceTypeEnum.domicilio => Icons.home_outlined,
        SupportTicketDetailServiceTypeEnum.taller => Icons.store_outlined,
      };
}

extension TicketQuoteStatusUi on TicketQuoteStatusEnum {
  String get label => switch (this) {
        TicketQuoteStatusEnum.pendiente => 'Pendiente',
        TicketQuoteStatusEnum.aprobado => 'Aprobada',
        TicketQuoteStatusEnum.rechazado => 'Rechazada',
      };

  Color get color => switch (this) {
        TicketQuoteStatusEnum.pendiente => Colors.orange,
        TicketQuoteStatusEnum.aprobado => Colors.green,
        TicketQuoteStatusEnum.rechazado => Colors.red,
      };
}

extension TicketCreateServiceTypeUi on TicketCreateRequestServiceTypeEnum {
  String get label => switch (this) {
        TicketCreateRequestServiceTypeEnum.remoto => 'Remoto',
        TicketCreateRequestServiceTypeEnum.domicilio => 'A domicilio',
        TicketCreateRequestServiceTypeEnum.taller => 'En taller',
      };
}

extension TicketCategoryUi on TicketCategory {
  String get label => switch (this) {
        TicketCategory.garantia => 'Garantía',
        TicketCategory.instalacion => 'Instalación',
        TicketCategory.falla => 'Falla',
        TicketCategory.consulta => 'Consulta',
        TicketCategory.otro => 'Otro',
      };
}
