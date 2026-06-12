//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticket_quote.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TicketQuote {
  /// Returns a new [TicketQuote] instance.
  TicketQuote({

     this.id,

     this.ticketId,

     this.laborCost,

     this.partsCost,

     this.total,

     this.currency,

     this.status,

     this.note,

     this.createdByUserId,

     this.decidedAt,

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
    
    name: r'labor_cost',
    required: false,
    includeIfNull: false,
  )


  final double? laborCost;



  @JsonKey(
    
    name: r'parts_cost',
    required: false,
    includeIfNull: false,
  )


  final double? partsCost;



  @JsonKey(
    
    name: r'total',
    required: false,
    includeIfNull: false,
  )


  final double? total;



  @JsonKey(
    
    name: r'currency',
    required: false,
    includeIfNull: false,
  )


  final String? currency;



  @JsonKey(
    
    name: r'status',
    required: false,
    includeIfNull: false,
  )


  final TicketQuoteStatusEnum? status;



  @JsonKey(
    
    name: r'note',
    required: false,
    includeIfNull: false,
  )


  final String? note;



  @JsonKey(
    
    name: r'created_by_user_id',
    required: false,
    includeIfNull: false,
  )


  final int? createdByUserId;



  @JsonKey(
    
    name: r'decided_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? decidedAt;



  @JsonKey(
    
    name: r'created_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? createdAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TicketQuote &&
      other.id == id &&
      other.ticketId == ticketId &&
      other.laborCost == laborCost &&
      other.partsCost == partsCost &&
      other.total == total &&
      other.currency == currency &&
      other.status == status &&
      other.note == note &&
      other.createdByUserId == createdByUserId &&
      other.decidedAt == decidedAt &&
      other.createdAt == createdAt;

    @override
    int get hashCode =>
        id.hashCode +
        ticketId.hashCode +
        laborCost.hashCode +
        partsCost.hashCode +
        total.hashCode +
        currency.hashCode +
        status.hashCode +
        note.hashCode +
        createdByUserId.hashCode +
        decidedAt.hashCode +
        createdAt.hashCode;

  factory TicketQuote.fromJson(Map<String, dynamic> json) => _$TicketQuoteFromJson(json);

  Map<String, dynamic> toJson() => _$TicketQuoteToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum TicketQuoteStatusEnum {
@JsonValue(r'pendiente')
pendiente(r'pendiente'),
@JsonValue(r'aprobado')
aprobado(r'aprobado'),
@JsonValue(r'rechazado')
rechazado(r'rechazado');

const TicketQuoteStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


