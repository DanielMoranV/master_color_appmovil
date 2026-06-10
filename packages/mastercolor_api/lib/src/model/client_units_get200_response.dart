//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mastercolor_api/src/model/sold_unit.dart';
import 'package:mastercolor_api/src/model/pagination.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'client_units_get200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ClientUnitsGet200Response {
  /// Returns a new [ClientUnitsGet200Response] instance.
  ClientUnitsGet200Response({

     this.success,

     this.message,

     this.status,

     this.data,

     this.errors,

     this.pagination,
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


  final List<SoldUnit>? data;



  @JsonKey(
    
    name: r'errors',
    required: false,
    includeIfNull: false,
  )


  final Object? errors;



  @JsonKey(
    
    name: r'pagination',
    required: false,
    includeIfNull: false,
  )


  final Pagination? pagination;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ClientUnitsGet200Response &&
      other.success == success &&
      other.message == message &&
      other.status == status &&
      other.data == data &&
      other.errors == errors &&
      other.pagination == pagination;

    @override
    int get hashCode =>
        success.hashCode +
        message.hashCode +
        status.hashCode +
        data.hashCode +
        (errors == null ? 0 : errors.hashCode) +
        pagination.hashCode;

  factory ClientUnitsGet200Response.fromJson(Map<String, dynamic> json) => _$ClientUnitsGet200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ClientUnitsGet200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

