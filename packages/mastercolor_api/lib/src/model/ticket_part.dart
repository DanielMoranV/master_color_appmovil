//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticket_part.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TicketPart {
  /// Returns a new [TicketPart] instance.
  TicketPart({

     this.id,

     this.stockId,

     this.productName,

     this.sku,

     this.quantity,

     this.unitCost,

     this.createdAt,
  });

  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final int? id;



  @JsonKey(
    
    name: r'stock_id',
    required: false,
    includeIfNull: false,
  )


  final int? stockId;



  @JsonKey(
    
    name: r'product_name',
    required: false,
    includeIfNull: false,
  )


  final String? productName;



  @JsonKey(
    
    name: r'sku',
    required: false,
    includeIfNull: false,
  )


  final String? sku;



  @JsonKey(
    
    name: r'quantity',
    required: false,
    includeIfNull: false,
  )


  final int? quantity;



  @JsonKey(
    
    name: r'unit_cost',
    required: false,
    includeIfNull: false,
  )


  final double? unitCost;



  @JsonKey(
    
    name: r'created_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? createdAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TicketPart &&
      other.id == id &&
      other.stockId == stockId &&
      other.productName == productName &&
      other.sku == sku &&
      other.quantity == quantity &&
      other.unitCost == unitCost &&
      other.createdAt == createdAt;

    @override
    int get hashCode =>
        id.hashCode +
        stockId.hashCode +
        productName.hashCode +
        sku.hashCode +
        quantity.hashCode +
        unitCost.hashCode +
        createdAt.hashCode;

  factory TicketPart.fromJson(Map<String, dynamic> json) => _$TicketPartFromJson(json);

  Map<String, dynamic> toJson() => _$TicketPartToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

