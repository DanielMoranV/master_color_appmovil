//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mastercolor_api/src/model/ticket_status.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'support_tickets_id_status_patch_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SupportTicketsIdStatusPatchRequest {
  /// Returns a new [SupportTicketsIdStatusPatchRequest] instance.
  SupportTicketsIdStatusPatchRequest({

    required  this.status,

     this.note,
  });

  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  )


  final TicketStatus status;



  @JsonKey(
    
    name: r'note',
    required: false,
    includeIfNull: false,
  )


  final String? note;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SupportTicketsIdStatusPatchRequest &&
      other.status == status &&
      other.note == note;

    @override
    int get hashCode =>
        status.hashCode +
        note.hashCode;

  factory SupportTicketsIdStatusPatchRequest.fromJson(Map<String, dynamic> json) => _$SupportTicketsIdStatusPatchRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SupportTicketsIdStatusPatchRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

