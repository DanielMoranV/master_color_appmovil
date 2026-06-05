//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticket_attachment.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TicketAttachment {
  /// Returns a new [TicketAttachment] instance.
  TicketAttachment({

     this.id,

     this.ticketId,

     this.messageId,

     this.url,

     this.fileType,

     this.originalName,

     this.createdAt,
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
    
    name: r'message_id',
    required: false,
    includeIfNull: false,
  )


  final int? messageId;



  @JsonKey(
    
    name: r'url',
    required: false,
    includeIfNull: false,
  )


  final String? url;



  @JsonKey(
    
    name: r'file_type',
    required: false,
    includeIfNull: false,
  )


  final String? fileType;



  @JsonKey(
    
    name: r'original_name',
    required: false,
    includeIfNull: false,
  )


  final String? originalName;



  @JsonKey(
    
    name: r'created_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? createdAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TicketAttachment &&
      other.id == id &&
      other.ticketId == ticketId &&
      other.messageId == messageId &&
      other.url == url &&
      other.fileType == fileType &&
      other.originalName == originalName &&
      other.createdAt == createdAt;

    @override
    int get hashCode =>
        id.hashCode +
        ticketId.hashCode +
        messageId.hashCode +
        url.hashCode +
        fileType.hashCode +
        originalName.hashCode +
        createdAt.hashCode;

  factory TicketAttachment.fromJson(Map<String, dynamic> json) => _$TicketAttachmentFromJson(json);

  Map<String, dynamic> toJson() => _$TicketAttachmentToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

