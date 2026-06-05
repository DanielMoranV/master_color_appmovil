//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';


enum SoldUnitStatus {
      @JsonValue(r'activa')
      activa(r'activa'),
      @JsonValue(r'en_servicio')
      enServicio(r'en_servicio'),
      @JsonValue(r'baja')
      baja(r'baja');

  const SoldUnitStatus(this.value);

  final String value;

  @override
  String toString() => value;
}
