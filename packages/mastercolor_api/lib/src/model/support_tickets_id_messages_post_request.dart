//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'support_tickets_id_messages_post_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SupportTicketsIdMessagesPostRequest {
  /// Returns a new [SupportTicketsIdMessagesPostRequest] instance.
  SupportTicketsIdMessagesPostRequest({

    required  this.body,

     this.isInternal = false,
  });

  @JsonKey(
    
    name: r'body',
    required: true,
    includeIfNull: false,
  )


  final String body;



      /// Si es `true`, la nota no es visible para el cliente.
  @JsonKey(
    defaultValue: false,
    name: r'is_internal',
    required: false,
    includeIfNull: false,
  )


  final bool? isInternal;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SupportTicketsIdMessagesPostRequest &&
      other.body == body &&
      other.isInternal == isInternal;

    @override
    int get hashCode =>
        body.hashCode +
        isInternal.hashCode;

  factory SupportTicketsIdMessagesPostRequest.fromJson(Map<String, dynamic> json) => _$SupportTicketsIdMessagesPostRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SupportTicketsIdMessagesPostRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

