//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'support_metrics_by_technician_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SupportMetricsByTechnicianInner {
  /// Returns a new [SupportMetricsByTechnicianInner] instance.
  SupportMetricsByTechnicianInner({

     this.userId,

     this.name,

     this.assigned,

     this.resolved,
  });

  @JsonKey(
    
    name: r'user_id',
    required: false,
    includeIfNull: false,
  )


  final int? userId;



  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



  @JsonKey(
    
    name: r'assigned',
    required: false,
    includeIfNull: false,
  )


  final int? assigned;



  @JsonKey(
    
    name: r'resolved',
    required: false,
    includeIfNull: false,
  )


  final int? resolved;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SupportMetricsByTechnicianInner &&
      other.userId == userId &&
      other.name == name &&
      other.assigned == assigned &&
      other.resolved == resolved;

    @override
    int get hashCode =>
        userId.hashCode +
        name.hashCode +
        assigned.hashCode +
        resolved.hashCode;

  factory SupportMetricsByTechnicianInner.fromJson(Map<String, dynamic> json) => _$SupportMetricsByTechnicianInnerFromJson(json);

  Map<String, dynamic> toJson() => _$SupportMetricsByTechnicianInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

