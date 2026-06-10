//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mastercolor_api/src/model/staff_user.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_me_get200_response_all_of_data.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AuthMeGet200ResponseAllOfData {
  /// Returns a new [AuthMeGet200ResponseAllOfData] instance.
  AuthMeGet200ResponseAllOfData({

     this.user,
  });

  @JsonKey(
    
    name: r'user',
    required: false,
    includeIfNull: false,
  )


  final StaffUser? user;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AuthMeGet200ResponseAllOfData &&
      other.user == user;

    @override
    int get hashCode =>
        user.hashCode;

  factory AuthMeGet200ResponseAllOfData.fromJson(Map<String, dynamic> json) => _$AuthMeGet200ResponseAllOfDataFromJson(json);

  Map<String, dynamic> toJson() => _$AuthMeGet200ResponseAllOfDataToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

