//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'warranty.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Warranty {
  /// Returns a new [Warranty] instance.
  Warranty({

     this.soldUnitId,

     this.purchaseDate,

     this.warrantyMonths,

     this.expiresAt,

     this.active,

     this.daysRemaining,

     this.status,
  });

  @JsonKey(
    
    name: r'sold_unit_id',
    required: false,
    includeIfNull: false,
  )


  final int? soldUnitId;



  @JsonKey(
    
    name: r'purchase_date',
    required: false,
    includeIfNull: false,
  )


  final DateTime? purchaseDate;



  @JsonKey(
    
    name: r'warranty_months',
    required: false,
    includeIfNull: false,
  )


  final int? warrantyMonths;



  @JsonKey(
    
    name: r'expires_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? expiresAt;



  @JsonKey(
    
    name: r'active',
    required: false,
    includeIfNull: false,
  )


  final bool? active;



  @JsonKey(
    
    name: r'days_remaining',
    required: false,
    includeIfNull: false,
  )


  final int? daysRemaining;



  @JsonKey(
    
    name: r'status',
    required: false,
    includeIfNull: false,
  )


  final WarrantyStatusEnum? status;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Warranty &&
      other.soldUnitId == soldUnitId &&
      other.purchaseDate == purchaseDate &&
      other.warrantyMonths == warrantyMonths &&
      other.expiresAt == expiresAt &&
      other.active == active &&
      other.daysRemaining == daysRemaining &&
      other.status == status;

    @override
    int get hashCode =>
        soldUnitId.hashCode +
        purchaseDate.hashCode +
        warrantyMonths.hashCode +
        expiresAt.hashCode +
        active.hashCode +
        daysRemaining.hashCode +
        status.hashCode;

  factory Warranty.fromJson(Map<String, dynamic> json) => _$WarrantyFromJson(json);

  Map<String, dynamic> toJson() => _$WarrantyToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum WarrantyStatusEnum {
@JsonValue(r'vigente')
vigente(r'vigente'),
@JsonValue(r'vencida')
vencida(r'vencida'),
@JsonValue(r'sin_garantia')
sinGarantia(r'sin_garantia');

const WarrantyStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


