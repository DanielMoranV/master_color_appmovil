//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mastercolor_api/src/model/support_ticket.dart';
import 'package:mastercolor_api/src/model/warranty.dart';
import 'package:mastercolor_api/src/model/sold_unit_status.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sold_unit_detail.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SoldUnitDetail {
  /// Returns a new [SoldUnitDetail] instance.
  SoldUnitDetail({

     this.id,

     this.clientId,

     this.productId,

     this.productName,

     this.orderId,

     this.serialNumber,

     this.purchaseDate,

     this.warrantyMonths,

     this.warrantyExpiresAt,

     this.warrantyActive,

     this.registrationSource,

     this.status,

     this.createdAt,

     this.proofFileUrl,

     this.warranty,

     this.tickets,
  });

  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final int? id;



  @JsonKey(
    
    name: r'client_id',
    required: false,
    includeIfNull: false,
  )


  final int? clientId;



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
    
    name: r'order_id',
    required: false,
    includeIfNull: false,
  )


  final int? orderId;



      /// Opcional (productos no serializados).
  @JsonKey(
    
    name: r'serial_number',
    required: false,
    includeIfNull: false,
  )


  final String? serialNumber;



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
    
    name: r'warranty_expires_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? warrantyExpiresAt;



  @JsonKey(
    
    name: r'warranty_active',
    required: false,
    includeIfNull: false,
  )


  final bool? warrantyActive;



  @JsonKey(
    
    name: r'registration_source',
    required: false,
    includeIfNull: false,
  )


  final SoldUnitDetailRegistrationSourceEnum? registrationSource;



  @JsonKey(
    
    name: r'status',
    required: false,
    includeIfNull: false,
  )


  final SoldUnitStatus? status;



  @JsonKey(
    
    name: r'created_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? createdAt;



  @JsonKey(
    
    name: r'proof_file_url',
    required: false,
    includeIfNull: false,
  )


  final String? proofFileUrl;



  @JsonKey(
    
    name: r'warranty',
    required: false,
    includeIfNull: false,
  )


  final Warranty? warranty;



  @JsonKey(
    
    name: r'tickets',
    required: false,
    includeIfNull: false,
  )


  final List<SupportTicket>? tickets;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SoldUnitDetail &&
      other.id == id &&
      other.clientId == clientId &&
      other.productId == productId &&
      other.productName == productName &&
      other.orderId == orderId &&
      other.serialNumber == serialNumber &&
      other.purchaseDate == purchaseDate &&
      other.warrantyMonths == warrantyMonths &&
      other.warrantyExpiresAt == warrantyExpiresAt &&
      other.warrantyActive == warrantyActive &&
      other.registrationSource == registrationSource &&
      other.status == status &&
      other.createdAt == createdAt &&
      other.proofFileUrl == proofFileUrl &&
      other.warranty == warranty &&
      other.tickets == tickets;

    @override
    int get hashCode =>
        id.hashCode +
        clientId.hashCode +
        productId.hashCode +
        productName.hashCode +
        orderId.hashCode +
        serialNumber.hashCode +
        purchaseDate.hashCode +
        warrantyMonths.hashCode +
        warrantyExpiresAt.hashCode +
        warrantyActive.hashCode +
        registrationSource.hashCode +
        status.hashCode +
        createdAt.hashCode +
        proofFileUrl.hashCode +
        warranty.hashCode +
        tickets.hashCode;

  factory SoldUnitDetail.fromJson(Map<String, dynamic> json) => _$SoldUnitDetailFromJson(json);

  Map<String, dynamic> toJson() => _$SoldUnitDetailToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum SoldUnitDetailRegistrationSourceEnum {
@JsonValue(r'order')
order(r'order'),
@JsonValue(r'manual')
manual(r'manual');

const SoldUnitDetailRegistrationSourceEnum(this.value);

final String value;

@override
String toString() => value;
}


