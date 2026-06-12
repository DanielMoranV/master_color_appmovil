//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'technician_profile_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TechnicianProfileRequest {
  /// Returns a new [TechnicianProfileRequest] instance.
  TechnicianProfileRequest({

     this.specialties,

     this.coverageZones,

     this.isAvailable,
  });

  @JsonKey(
    
    name: r'specialties',
    required: false,
    includeIfNull: false,
  )


  final List<TechnicianProfileRequestSpecialtiesEnum>? specialties;



  @JsonKey(
    
    name: r'coverage_zones',
    required: false,
    includeIfNull: false,
  )


  final List<String>? coverageZones;



  @JsonKey(
    
    name: r'is_available',
    required: false,
    includeIfNull: false,
  )


  final bool? isAvailable;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TechnicianProfileRequest &&
      other.specialties == specialties &&
      other.coverageZones == coverageZones &&
      other.isAvailable == isAvailable;

    @override
    int get hashCode =>
        specialties.hashCode +
        coverageZones.hashCode +
        isAvailable.hashCode;

  factory TechnicianProfileRequest.fromJson(Map<String, dynamic> json) => _$TechnicianProfileRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TechnicianProfileRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum TechnicianProfileRequestSpecialtiesEnum {
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

const TechnicianProfileRequestSpecialtiesEnum(this.value);

final String value;

@override
String toString() => value;
}


