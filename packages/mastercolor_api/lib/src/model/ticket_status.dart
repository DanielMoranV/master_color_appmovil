//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';


enum TicketStatus {
      @JsonValue(r'abierto')
      abierto(r'abierto'),
      @JsonValue(r'asignado')
      asignado(r'asignado'),
      @JsonValue(r'en_proceso')
      enProceso(r'en_proceso'),
      @JsonValue(r'en_espera_cliente')
      enEsperaCliente(r'en_espera_cliente'),
      @JsonValue(r'en_espera_aprobacion')
      enEsperaAprobacion(r'en_espera_aprobacion'),
      @JsonValue(r'resuelto')
      resuelto(r'resuelto'),
      @JsonValue(r'cerrado')
      cerrado(r'cerrado'),
      @JsonValue(r'cancelado')
      cancelado(r'cancelado');

  const TicketStatus(this.value);

  final String value;

  @override
  String toString() => value;
}
