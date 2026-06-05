//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'support_tickets_id_assign_patch_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SupportTicketsIdAssignPatchRequest {
  /// Returns a new [SupportTicketsIdAssignPatchRequest] instance.
  SupportTicketsIdAssignPatchRequest({

    required  this.assignedUserId,
  });

  @JsonKey(
    
    name: r'assigned_user_id',
    required: true,
    includeIfNull: false,
  )


  final int assignedUserId;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SupportTicketsIdAssignPatchRequest &&
      other.assignedUserId == assignedUserId;

    @override
    int get hashCode =>
        assignedUserId.hashCode;

  factory SupportTicketsIdAssignPatchRequest.fromJson(Map<String, dynamic> json) => _$SupportTicketsIdAssignPatchRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SupportTicketsIdAssignPatchRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

