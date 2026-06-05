//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mastercolor_api/src/model/sold_unit_detail.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'client_units_id_get200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ClientUnitsIdGet200Response {
  /// Returns a new [ClientUnitsIdGet200Response] instance.
  ClientUnitsIdGet200Response({

     this.success,

     this.message,

     this.status,

     this.data,

     this.errors,
  });

  @JsonKey(
    
    name: r'success',
    required: false,
    includeIfNull: false,
  )


  final bool? success;



  @JsonKey(
    
    name: r'message',
    required: false,
    includeIfNull: false,
  )


  final String? message;



  @JsonKey(
    
    name: r'status',
    required: false,
    includeIfNull: false,
  )


  final int? status;



  @JsonKey(
    
    name: r'data',
    required: false,
    includeIfNull: false,
  )


  final SoldUnitDetail? data;



  @JsonKey(
    
    name: r'errors',
    required: false,
    includeIfNull: false,
  )


  final Object? errors;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ClientUnitsIdGet200Response &&
      other.success == success &&
      other.message == message &&
      other.status == status &&
      other.data == data &&
      other.errors == errors;

    @override
    int get hashCode =>
        success.hashCode +
        message.hashCode +
        status.hashCode +
        data.hashCode +
        (errors == null ? 0 : errors.hashCode);

  factory ClientUnitsIdGet200Response.fromJson(Map<String, dynamic> json) => _$ClientUnitsIdGet200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ClientUnitsIdGet200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

