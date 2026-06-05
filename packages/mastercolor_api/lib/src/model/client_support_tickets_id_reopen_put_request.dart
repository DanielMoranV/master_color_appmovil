//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'client_support_tickets_id_reopen_put_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ClientSupportTicketsIdReopenPutRequest {
  /// Returns a new [ClientSupportTicketsIdReopenPutRequest] instance.
  ClientSupportTicketsIdReopenPutRequest({

    required  this.reason,
  });

  @JsonKey(
    
    name: r'reason',
    required: true,
    includeIfNull: false,
  )


  final String reason;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ClientSupportTicketsIdReopenPutRequest &&
      other.reason == reason;

    @override
    int get hashCode =>
        reason.hashCode;

  factory ClientSupportTicketsIdReopenPutRequest.fromJson(Map<String, dynamic> json) => _$ClientSupportTicketsIdReopenPutRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ClientSupportTicketsIdReopenPutRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

