//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mastercolor_api/src/model/sold_unit_status.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'support_units_id_patch_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SupportUnitsIdPatchRequest {
  /// Returns a new [SupportUnitsIdPatchRequest] instance.
  SupportUnitsIdPatchRequest({

     this.serialNumber,

     this.status,
  });

  @JsonKey(
    
    name: r'serial_number',
    required: false,
    includeIfNull: false,
  )


  final String? serialNumber;



  @JsonKey(
    
    name: r'status',
    required: false,
    includeIfNull: false,
  )


  final SoldUnitStatus? status;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SupportUnitsIdPatchRequest &&
      other.serialNumber == serialNumber &&
      other.status == status;

    @override
    int get hashCode =>
        serialNumber.hashCode +
        status.hashCode;

  factory SupportUnitsIdPatchRequest.fromJson(Map<String, dynamic> json) => _$SupportUnitsIdPatchRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SupportUnitsIdPatchRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

