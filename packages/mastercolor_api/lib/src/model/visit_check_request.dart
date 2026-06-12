//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'visit_check_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VisitCheckRequest {
  /// Returns a new [VisitCheckRequest] instance.
  VisitCheckRequest({

     this.latitude,

     this.longitude,

     this.at,
  });

          // minimum: -90
          // maximum: 90
  @JsonKey(
    
    name: r'latitude',
    required: false,
    includeIfNull: false,
  )


  final double? latitude;



          // minimum: -180
          // maximum: 180
  @JsonKey(
    
    name: r'longitude',
    required: false,
    includeIfNull: false,
  )


  final double? longitude;



      /// Momento del registro. Si se omite, se usa la hora del servidor.
  @JsonKey(
    
    name: r'at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? at;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VisitCheckRequest &&
      other.latitude == latitude &&
      other.longitude == longitude &&
      other.at == at;

    @override
    int get hashCode =>
        latitude.hashCode +
        longitude.hashCode +
        at.hashCode;

  factory VisitCheckRequest.fromJson(Map<String, dynamic> json) => _$VisitCheckRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VisitCheckRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

