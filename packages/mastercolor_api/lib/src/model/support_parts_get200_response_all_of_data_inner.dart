//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'support_parts_get200_response_all_of_data_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SupportPartsGet200ResponseAllOfDataInner {
  /// Returns a new [SupportPartsGet200ResponseAllOfDataInner] instance.
  SupportPartsGet200ResponseAllOfDataInner({

     this.stockId,

     this.productId,

     this.productName,

     this.sku,

     this.availableQty,

     this.purchasePrice,
  });

  @JsonKey(
    
    name: r'stock_id',
    required: false,
    includeIfNull: false,
  )


  final int? stockId;



  @JsonKey(
    
    name: r'product_id',
    required: false,
    includeIfNull: false,
  )


  final int? productId;



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
    
    name: r'available_qty',
    required: false,
    includeIfNull: false,
  )


  final int? availableQty;



  @JsonKey(
    
    name: r'purchase_price',
    required: false,
    includeIfNull: false,
  )


  final double? purchasePrice;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SupportPartsGet200ResponseAllOfDataInner &&
      other.stockId == stockId &&
      other.productId == productId &&
      other.productName == productName &&
      other.sku == sku &&
      other.availableQty == availableQty &&
      other.purchasePrice == purchasePrice;

    @override
    int get hashCode =>
        stockId.hashCode +
        productId.hashCode +
        productName.hashCode +
        sku.hashCode +
        availableQty.hashCode +
        purchasePrice.hashCode;

  factory SupportPartsGet200ResponseAllOfDataInner.fromJson(Map<String, dynamic> json) => _$SupportPartsGet200ResponseAllOfDataInnerFromJson(json);

  Map<String, dynamic> toJson() => _$SupportPartsGet200ResponseAllOfDataInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

