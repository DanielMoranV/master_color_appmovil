//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mastercolor_api/src/model/author_type.dart';
import 'package:mastercolor_api/src/model/ticket_attachment.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticket_message.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TicketMessage {
  /// Returns a new [TicketMessage] instance.
  TicketMessage({

     this.id,

     this.ticketId,

     this.authorType,

     this.authorId,

     this.authorName,

     this.body,

     this.isInternal,

     this.readAt,

     this.createdAt,

     this.attachments,
  });

  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final int? id;



  @JsonKey(
    
    name: r'ticket_id',
    required: false,
    includeIfNull: false,
  )


  final int? ticketId;



  @JsonKey(
    
    name: r'author_type',
    required: false,
    includeIfNull: false,
  )


  final AuthorType? authorType;



  @JsonKey(
    
    name: r'author_id',
    required: false,
    includeIfNull: false,
  )


  final int? authorId;



  @JsonKey(
    
    name: r'author_name',
    required: false,
    includeIfNull: false,
  )


  final String? authorName;



  @JsonKey(
    
    name: r'body',
    required: false,
    includeIfNull: false,
  )


  final String? body;



  @JsonKey(
    
    name: r'is_internal',
    required: false,
    includeIfNull: false,
  )


  final bool? isInternal;



  @JsonKey(
    
    name: r'read_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? readAt;



  @JsonKey(
    
    name: r'created_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? createdAt;



  @JsonKey(
    
    name: r'attachments',
    required: false,
    includeIfNull: false,
  )


  final List<TicketAttachment>? attachments;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TicketMessage &&
      other.id == id &&
      other.ticketId == ticketId &&
      other.authorType == authorType &&
      other.authorId == authorId &&
      other.authorName == authorName &&
      other.body == body &&
      other.isInternal == isInternal &&
      other.readAt == readAt &&
      other.createdAt == createdAt &&
      other.attachments == attachments;

    @override
    int get hashCode =>
        id.hashCode +
        ticketId.hashCode +
        authorType.hashCode +
        authorId.hashCode +
        authorName.hashCode +
        body.hashCode +
        isInternal.hashCode +
        readAt.hashCode +
        createdAt.hashCode +
        attachments.hashCode;

  factory TicketMessage.fromJson(Map<String, dynamic> json) => _$TicketMessageFromJson(json);

  Map<String, dynamic> toJson() => _$TicketMessageToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

