//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'client_user.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ClientUser {
  /// Returns a new [ClientUser] instance.
  ClientUser({

     this.id,

     this.name,

     this.email,
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





    @override
    bool operator ==(Object other) => identical(this, other) || other is ClientUser &&
      other.id == id &&
      other.name == name &&
      other.email == email;

    @override
    int get hashCode =>
        id.hashCode +
        name.hashCode +
        email.hashCode;

  factory ClientUser.fromJson(Map<String, dynamic> json) => _$ClientUserFromJson(json);

  Map<String, dynamic> toJson() => _$ClientUserToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

