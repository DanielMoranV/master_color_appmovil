//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';


enum TicketPriority {
      @JsonValue(r'baja')
      baja(r'baja'),
      @JsonValue(r'media')
      media(r'media'),
      @JsonValue(r'alta')
      alta(r'alta'),
      @JsonValue(r'urgente')
      urgente(r'urgente');

  const TicketPriority(this.value);

  final String value;

  @override
  String toString() => value;
}
