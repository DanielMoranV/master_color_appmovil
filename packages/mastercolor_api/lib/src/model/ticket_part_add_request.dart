//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticket_part_add_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TicketPartAddRequest {
  /// Returns a new [TicketPartAddRequest] instance.
  TicketPartAddRequest({

    required  this.stockId,

    required  this.quantity,

     this.unitCost,
  });

  @JsonKey(
    
    name: r'stock_id',
    required: true,
    includeIfNull: false,
  )


  final int stockId;



          // minimum: 1
  @JsonKey(
    
    name: r'quantity',
    required: true,
    includeIfNull: false,
  )


  final int quantity;



      /// Si se omite, se toma el precio de compra del stock.
  @JsonKey(
    
    name: r'unit_cost',
    required: false,
    includeIfNull: false,
  )


  final double? unitCost;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TicketPartAddRequest &&
      other.stockId == stockId &&
      other.quantity == quantity &&
      other.unitCost == unitCost;

    @override
    int get hashCode =>
        stockId.hashCode +
        quantity.hashCode +
        unitCost.hashCode;

  factory TicketPartAddRequest.fromJson(Map<String, dynamic> json) => _$TicketPartAddRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TicketPartAddRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

