//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'client_support_tickets_id_messages_post_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ClientSupportTicketsIdMessagesPostRequest {
  /// Returns a new [ClientSupportTicketsIdMessagesPostRequest] instance.
  ClientSupportTicketsIdMessagesPostRequest({

    required  this.body,
  });

  @JsonKey(
    
    name: r'body',
    required: true,
    includeIfNull: false,
  )


  final String body;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ClientSupportTicketsIdMessagesPostRequest &&
      other.body == body;

    @override
    int get hashCode =>
        body.hashCode;

  factory ClientSupportTicketsIdMessagesPostRequest.fromJson(Map<String, dynamic> json) => _$ClientSupportTicketsIdMessagesPostRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ClientSupportTicketsIdMessagesPostRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

