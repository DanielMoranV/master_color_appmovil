//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mastercolor_api/src/model/ticket_priority.dart';
import 'package:mastercolor_api/src/model/ticket_channel.dart';
import 'package:mastercolor_api/src/model/ticket_status.dart';
import 'package:mastercolor_api/src/model/ticket_category.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'support_ticket.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SupportTicket {
  /// Returns a new [SupportTicket] instance.
  SupportTicket({

     this.id,

     this.code,

     this.clientId,

     this.soldUnitId,

     this.productId,

     this.category,

     this.priority,

     this.subject,

     this.description,

     this.status,

     this.channel,

     this.assignedUserId,

     this.assignedUserName,

     this.isWarrantyCovered,

     this.slaDueAt,

     this.firstResponseAt,

     this.resolvedAt,

     this.closedAt,

     this.rating,

     this.createdAt,

     this.updatedAt,
  });

  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final int? id;



  @JsonKey(
    
    name: r'code',
    required: false,
    includeIfNull: false,
  )


  final String? code;



  @JsonKey(
    
    name: r'client_id',
    required: false,
    includeIfNull: false,
  )


  final int? clientId;



  @JsonKey(
    
    name: r'sold_unit_id',
    required: false,
    includeIfNull: false,
  )


  final int? soldUnitId;



  @JsonKey(
    
    name: r'product_id',
    required: false,
    includeIfNull: false,
  )


  final int? productId;



  @JsonKey(
    
    name: r'category',
    required: false,
    includeIfNull: false,
  )


  final TicketCategory? category;



  @JsonKey(
    
    name: r'priority',
    required: false,
    includeIfNull: false,
  )


  final TicketPriority? priority;



  @JsonKey(
    
    name: r'subject',
    required: false,
    includeIfNull: false,
  )


  final String? subject;



  @JsonKey(
    
    name: r'description',
    required: false,
    includeIfNull: false,
  )


  final String? description;



  @JsonKey(
    
    name: r'status',
    required: false,
    includeIfNull: false,
  )


  final TicketStatus? status;



  @JsonKey(
    
    name: r'channel',
    required: false,
    includeIfNull: false,
  )


  final TicketChannel? channel;



  @JsonKey(
    
    name: r'assigned_user_id',
    required: false,
    includeIfNull: false,
  )


  final int? assignedUserId;



  @JsonKey(
    
    name: r'assigned_user_name',
    required: false,
    includeIfNull: false,
  )


  final String? assignedUserName;



  @JsonKey(
    
    name: r'is_warranty_covered',
    required: false,
    includeIfNull: false,
  )


  final bool? isWarrantyCovered;



  @JsonKey(
    
    name: r'sla_due_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? slaDueAt;



  @JsonKey(
    
    name: r'first_response_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? firstResponseAt;



  @JsonKey(
    
    name: r'resolved_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? resolvedAt;



  @JsonKey(
    
    name: r'closed_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? closedAt;



          // minimum: 1
          // maximum: 5
  @JsonKey(
    
    name: r'rating',
    required: false,
    includeIfNull: false,
  )


  final int? rating;



  @JsonKey(
    
    name: r'created_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? createdAt;



  @JsonKey(
    
    name: r'updated_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? updatedAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SupportTicket &&
      other.id == id &&
      other.code == code &&
      other.clientId == clientId &&
      other.soldUnitId == soldUnitId &&
      other.productId == productId &&
      other.category == category &&
      other.priority == priority &&
      other.subject == subject &&
      other.description == description &&
      other.status == status &&
      other.channel == channel &&
      other.assignedUserId == assignedUserId &&
      other.assignedUserName == assignedUserName &&
      other.isWarrantyCovered == isWarrantyCovered &&
      other.slaDueAt == slaDueAt &&
      other.firstResponseAt == firstResponseAt &&
      other.resolvedAt == resolvedAt &&
      other.closedAt == closedAt &&
      other.rating == rating &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;

    @override
    int get hashCode =>
        id.hashCode +
        code.hashCode +
        clientId.hashCode +
        soldUnitId.hashCode +
        productId.hashCode +
        category.hashCode +
        priority.hashCode +
        subject.hashCode +
        description.hashCode +
        status.hashCode +
        channel.hashCode +
        assignedUserId.hashCode +
        assignedUserName.hashCode +
        isWarrantyCovered.hashCode +
        slaDueAt.hashCode +
        firstResponseAt.hashCode +
        resolvedAt.hashCode +
        closedAt.hashCode +
        rating.hashCode +
        createdAt.hashCode +
        updatedAt.hashCode;

  factory SupportTicket.fromJson(Map<String, dynamic> json) => _$SupportTicketFromJson(json);

  Map<String, dynamic> toJson() => _$SupportTicketToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

