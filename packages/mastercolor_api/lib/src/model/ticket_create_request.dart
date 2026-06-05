//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mastercolor_api/src/model/ticket_priority.dart';
import 'package:mastercolor_api/src/model/ticket_category.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticket_create_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TicketCreateRequest {
  /// Returns a new [TicketCreateRequest] instance.
  TicketCreateRequest({

     this.soldUnitId,

    required  this.category,

     this.priority,

    required  this.subject,

    required  this.description,
  });

      /// Unidad asociada (opcional para consultas generales).
  @JsonKey(
    
    name: r'sold_unit_id',
    required: false,
    includeIfNull: false,
  )


  final int? soldUnitId;



  @JsonKey(
    
    name: r'category',
    required: true,
    includeIfNull: false,
  )


  final TicketCategory category;



  @JsonKey(
    
    name: r'priority',
    required: false,
    includeIfNull: false,
  )


  final TicketPriority? priority;



  @JsonKey(
    
    name: r'subject',
    required: true,
    includeIfNull: false,
  )


  final String subject;



  @JsonKey(
    
    name: r'description',
    required: true,
    includeIfNull: false,
  )


  final String description;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TicketCreateRequest &&
      other.soldUnitId == soldUnitId &&
      other.category == category &&
      other.priority == priority &&
      other.subject == subject &&
      other.description == description;

    @override
    int get hashCode =>
        soldUnitId.hashCode +
        category.hashCode +
        priority.hashCode +
        subject.hashCode +
        description.hashCode;

  factory TicketCreateRequest.fromJson(Map<String, dynamic> json) => _$TicketCreateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TicketCreateRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

