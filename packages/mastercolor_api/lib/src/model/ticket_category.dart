//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';


enum TicketCategory {
      @JsonValue(r'garantia')
      garantia(r'garantia'),
      @JsonValue(r'instalacion')
      instalacion(r'instalacion'),
      @JsonValue(r'falla')
      falla(r'falla'),
      @JsonValue(r'consulta')
      consulta(r'consulta'),
      @JsonValue(r'otro')
      otro(r'otro');

  const TicketCategory(this.value);

  final String value;

  @override
  String toString() => value;
}
