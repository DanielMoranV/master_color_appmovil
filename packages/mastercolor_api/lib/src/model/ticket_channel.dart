//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';


enum TicketChannel {
      @JsonValue(r'app')
      app(r'app'),
      @JsonValue(r'web')
      web(r'web'),
      @JsonValue(r'telefono')
      telefono(r'telefono');

  const TicketChannel(this.value);

  final String value;

  @override
  String toString() => value;
}
