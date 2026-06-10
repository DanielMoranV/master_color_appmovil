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

     this.active,
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
    
    name: r'active',
    required: false,
    includeIfNull: false,
  )


  final bool? active;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Technician &&
      other.id == id &&
      other.name == name &&
      other.email == email &&
      other.active == active;

    @override
    int get hashCode =>
        id.hashCode +
        name.hashCode +
        email.hashCode +
        active.hashCode;

  factory Technician.fromJson(Map<String, dynamic> json) => _$TechnicianFromJson(json);

  Map<String, dynamic> toJson() => _$TechnicianToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

