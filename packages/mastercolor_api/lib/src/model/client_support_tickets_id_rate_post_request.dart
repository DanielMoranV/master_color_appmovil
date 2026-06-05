//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'client_support_tickets_id_rate_post_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ClientSupportTicketsIdRatePostRequest {
  /// Returns a new [ClientSupportTicketsIdRatePostRequest] instance.
  ClientSupportTicketsIdRatePostRequest({

    required  this.rating,

     this.comment,
  });

          // minimum: 1
          // maximum: 5
  @JsonKey(
    
    name: r'rating',
    required: true,
    includeIfNull: false,
  )


  final int rating;



  @JsonKey(
    
    name: r'comment',
    required: false,
    includeIfNull: false,
  )


  final String? comment;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ClientSupportTicketsIdRatePostRequest &&
      other.rating == rating &&
      other.comment == comment;

    @override
    int get hashCode =>
        rating.hashCode +
        comment.hashCode;

  factory ClientSupportTicketsIdRatePostRequest.fromJson(Map<String, dynamic> json) => _$ClientSupportTicketsIdRatePostRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ClientSupportTicketsIdRatePostRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

