//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'client_product.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ClientProduct {
  /// Returns a new [ClientProduct] instance.
  ClientProduct({

     this.id,

     this.name,

     this.sku,

     this.warrantyMonths,

     this.imageUrl,
  });

  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final int? id;



  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



  @JsonKey(
    
    name: r'sku',
    required: false,
    includeIfNull: false,
  )


  final String? sku;



  @JsonKey(
    
    name: r'warranty_months',
    required: false,
    includeIfNull: false,
  )


  final int? warrantyMonths;



      /// URL absoluta de la imagen del producto. null si no tiene.
  @JsonKey(
    
    name: r'image_url',
    required: false,
    includeIfNull: false,
  )


  final String? imageUrl;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ClientProduct &&
      other.id == id &&
      other.name == name &&
      other.sku == sku &&
      other.warrantyMonths == warrantyMonths &&
      other.imageUrl == imageUrl;

    @override
    int get hashCode =>
        id.hashCode +
        name.hashCode +
        sku.hashCode +
        warrantyMonths.hashCode +
        imageUrl.hashCode;

  factory ClientProduct.fromJson(Map<String, dynamic> json) => _$ClientProductFromJson(json);

  Map<String, dynamic> toJson() => _$ClientProductToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

