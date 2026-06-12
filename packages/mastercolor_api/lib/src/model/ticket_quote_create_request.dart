//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticket_quote_create_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TicketQuoteCreateRequest {
  /// Returns a new [TicketQuoteCreateRequest] instance.
  TicketQuoteCreateRequest({

    required  this.laborCost,

     this.partsCost,

     this.currency = 'PEN',

     this.note,
  });

  @JsonKey(
    
    name: r'labor_cost',
    required: true,
    includeIfNull: false,
  )


  final double laborCost;



      /// Si se omite, se calcula de los repuestos registrados.
  @JsonKey(
    
    name: r'parts_cost',
    required: false,
    includeIfNull: false,
  )


  final double? partsCost;



  @JsonKey(
    defaultValue: 'PEN',
    name: r'currency',
    required: false,
    includeIfNull: false,
  )


  final String? currency;



  @JsonKey(
    
    name: r'note',
    required: false,
    includeIfNull: false,
  )


  final String? note;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TicketQuoteCreateRequest &&
      other.laborCost == laborCost &&
      other.partsCost == partsCost &&
      other.currency == currency &&
      other.note == note;

    @override
    int get hashCode =>
        laborCost.hashCode +
        partsCost.hashCode +
        currency.hashCode +
        note.hashCode;

  factory TicketQuoteCreateRequest.fromJson(Map<String, dynamic> json) => _$TicketQuoteCreateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TicketQuoteCreateRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

