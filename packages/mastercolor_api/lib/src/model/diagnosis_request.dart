//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'diagnosis_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DiagnosisRequest {
  /// Returns a new [DiagnosisRequest] instance.
  DiagnosisRequest({

    required  this.diagnosis,

     this.partsUsed,

     this.resolve = false,
  });

  @JsonKey(
    
    name: r'diagnosis',
    required: true,
    includeIfNull: false,
  )


  final String diagnosis;



  @JsonKey(
    
    name: r'parts_used',
    required: false,
    includeIfNull: false,
  )


  final String? partsUsed;



      /// Si es `true`, marca el ticket como `resuelto`.
  @JsonKey(
    defaultValue: false,
    name: r'resolve',
    required: false,
    includeIfNull: false,
  )


  final bool? resolve;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DiagnosisRequest &&
      other.diagnosis == diagnosis &&
      other.partsUsed == partsUsed &&
      other.resolve == resolve;

    @override
    int get hashCode =>
        diagnosis.hashCode +
        partsUsed.hashCode +
        resolve.hashCode;

  factory DiagnosisRequest.fromJson(Map<String, dynamic> json) => _$DiagnosisRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DiagnosisRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

