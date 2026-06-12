//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Address {
  /// Returns a new [Address] instance.
  Address({

     this.id,

     this.clientId,

     this.addressFull,

     this.district,

     this.province,

     this.department,

     this.postalCode,

     this.reference,

     this.isMain,

     this.latitude,

     this.longitude,

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
    
    name: r'client_id',
    required: false,
    includeIfNull: false,
  )


  final int? clientId;



  @JsonKey(
    
    name: r'address_full',
    required: false,
    includeIfNull: false,
  )


  final String? addressFull;



  @JsonKey(
    
    name: r'district',
    required: false,
    includeIfNull: false,
  )


  final String? district;



  @JsonKey(
    
    name: r'province',
    required: false,
    includeIfNull: false,
  )


  final String? province;



  @JsonKey(
    
    name: r'department',
    required: false,
    includeIfNull: false,
  )


  final String? department;



  @JsonKey(
    
    name: r'postal_code',
    required: false,
    includeIfNull: false,
  )


  final String? postalCode;



  @JsonKey(
    
    name: r'reference',
    required: false,
    includeIfNull: false,
  )


  final String? reference;



  @JsonKey(
    
    name: r'is_main',
    required: false,
    includeIfNull: false,
  )


  final bool? isMain;



  @JsonKey(
    
    name: r'latitude',
    required: false,
    includeIfNull: false,
  )


  final double? latitude;



  @JsonKey(
    
    name: r'longitude',
    required: false,
    includeIfNull: false,
  )


  final double? longitude;



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
    bool operator ==(Object other) => identical(this, other) || other is Address &&
      other.id == id &&
      other.clientId == clientId &&
      other.addressFull == addressFull &&
      other.district == district &&
      other.province == province &&
      other.department == department &&
      other.postalCode == postalCode &&
      other.reference == reference &&
      other.isMain == isMain &&
      other.latitude == latitude &&
      other.longitude == longitude &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;

    @override
    int get hashCode =>
        id.hashCode +
        clientId.hashCode +
        addressFull.hashCode +
        district.hashCode +
        province.hashCode +
        department.hashCode +
        postalCode.hashCode +
        reference.hashCode +
        isMain.hashCode +
        latitude.hashCode +
        longitude.hashCode +
        createdAt.hashCode +
        updatedAt.hashCode;

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

