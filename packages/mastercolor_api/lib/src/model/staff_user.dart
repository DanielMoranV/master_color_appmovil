//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mastercolor_api/src/model/staff_user_role.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'staff_user.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class StaffUser {
  /// Returns a new [StaffUser] instance.
  StaffUser({

     this.id,

     this.name,

     this.email,

     this.role,

     this.roleName,

     this.isActive,

     this.phone,

     this.dni,
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
    
    name: r'role',
    required: false,
    includeIfNull: false,
  )


  final StaffUserRole? role;



  @JsonKey(
    
    name: r'role_name',
    required: false,
    includeIfNull: false,
  )


  final String? roleName;



  @JsonKey(
    
    name: r'is_active',
    required: false,
    includeIfNull: false,
  )


  final bool? isActive;



  @JsonKey(
    
    name: r'phone',
    required: false,
    includeIfNull: false,
  )


  final String? phone;



  @JsonKey(
    
    name: r'dni',
    required: false,
    includeIfNull: false,
  )


  final String? dni;





    @override
    bool operator ==(Object other) => identical(this, other) || other is StaffUser &&
      other.id == id &&
      other.name == name &&
      other.email == email &&
      other.role == role &&
      other.roleName == roleName &&
      other.isActive == isActive &&
      other.phone == phone &&
      other.dni == dni;

    @override
    int get hashCode =>
        id.hashCode +
        name.hashCode +
        email.hashCode +
        role.hashCode +
        roleName.hashCode +
        isActive.hashCode +
        phone.hashCode +
        dni.hashCode;

  factory StaffUser.fromJson(Map<String, dynamic> json) => _$StaffUserFromJson(json);

  Map<String, dynamic> toJson() => _$StaffUserToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

