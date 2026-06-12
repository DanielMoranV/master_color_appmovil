//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'technician.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Technician {
  /// Returns a new [Technician] instance.
  Technician({

     this.id,

     this.name,

     this.email,

     this.phone,

     this.active,

     this.isAvailable,

     this.specialties,

     this.coverageZones,
  });

  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final int? id;



  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



  @JsonKey(
    
    name: r'email',
    required: false,
    includeIfNull: false,
  )


  final String? email;



  @JsonKey(
    
    name: r'phone',
    required: false,
    includeIfNull: false,
  )


  final String? phone;



  @JsonKey(
    
    name: r'active',
    required: false,
    includeIfNull: false,
  )


  final bool? active;



      /// Si el técnico acepta nuevas asignaciones de visitas.
  @JsonKey(
    
    name: r'is_available',
    required: false,
    includeIfNull: false,
  )


  final bool? isAvailable;



      /// Categorías de ticket que atiende.
  @JsonKey(
    
    name: r'specialties',
    required: false,
    includeIfNull: false,
  )


  final List<TechnicianSpecialtiesEnum>? specialties;



      /// Distritos/zonas que cubre.
  @JsonKey(
    
    name: r'coverage_zones',
    required: false,
    includeIfNull: false,
  )


  final List<String>? coverageZones;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Technician &&
      other.id == id &&
      other.name == name &&
      other.email == email &&
      other.phone == phone &&
      other.active == active &&
      other.isAvailable == isAvailable &&
      other.specialties == specialties &&
      other.coverageZones == coverageZones;

    @override
    int get hashCode =>
        id.hashCode +
        name.hashCode +
        email.hashCode +
        phone.hashCode +
        active.hashCode +
        isAvailable.hashCode +
        specialties.hashCode +
        coverageZones.hashCode;

  factory Technician.fromJson(Map<String, dynamic> json) => _$TechnicianFromJson(json);

  Map<String, dynamic> toJson() => _$TechnicianToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum TechnicianSpecialtiesEnum {
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

const TechnicianSpecialtiesEnum(this.value);

final String value;

@override
String toString() => value;
}


