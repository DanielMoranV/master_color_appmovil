//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mastercolor_api/src/model/device_platform.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'device_token_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DeviceTokenRequest {
  /// Returns a new [DeviceTokenRequest] instance.
  DeviceTokenRequest({

    required  this.token,

    required  this.platform,
  });

      /// Token FCM del dispositivo.
  @JsonKey(
    
    name: r'token',
    required: true,
    includeIfNull: false,
  )


  final String token;



  @JsonKey(
    
    name: r'platform',
    required: true,
    includeIfNull: false,
  )


  final DevicePlatform platform;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DeviceTokenRequest &&
      other.token == token &&
      other.platform == platform;

    @override
    int get hashCode =>
        token.hashCode +
        platform.hashCode;

  factory DeviceTokenRequest.fromJson(Map<String, dynamic> json) => _$DeviceTokenRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceTokenRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

