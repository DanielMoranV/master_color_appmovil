// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AddressCWProxy {
  Address id(int? id);

  Address clientId(int? clientId);

  Address addressFull(String? addressFull);

  Address district(String? district);

  Address province(String? province);

  Address department(String? department);

  Address postalCode(String? postalCode);

  Address reference(String? reference);

  Address isMain(bool? isMain);

  Address latitude(double? latitude);

  Address longitude(double? longitude);

  Address createdAt(DateTime? createdAt);

  Address updatedAt(DateTime? updatedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Address(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Address(...).copyWith(id: 12, name: "My name")
  /// ````
  Address call({
    int? id,
    int? clientId,
    String? addressFull,
    String? district,
    String? province,
    String? department,
    String? postalCode,
    String? reference,
    bool? isMain,
    double? latitude,
    double? longitude,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAddress.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAddress.copyWith.fieldName(...)`
class _$AddressCWProxyImpl implements _$AddressCWProxy {
  const _$AddressCWProxyImpl(this._value);

  final Address _value;

  @override
  Address id(int? id) => this(id: id);

  @override
  Address clientId(int? clientId) => this(clientId: clientId);

  @override
  Address addressFull(String? addressFull) => this(addressFull: addressFull);

  @override
  Address district(String? district) => this(district: district);

  @override
  Address province(String? province) => this(province: province);

  @override
  Address department(String? department) => this(department: department);

  @override
  Address postalCode(String? postalCode) => this(postalCode: postalCode);

  @override
  Address reference(String? reference) => this(reference: reference);

  @override
  Address isMain(bool? isMain) => this(isMain: isMain);

  @override
  Address latitude(double? latitude) => this(latitude: latitude);

  @override
  Address longitude(double? longitude) => this(longitude: longitude);

  @override
  Address createdAt(DateTime? createdAt) => this(createdAt: createdAt);

  @override
  Address updatedAt(DateTime? updatedAt) => this(updatedAt: updatedAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Address(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Address(...).copyWith(id: 12, name: "My name")
  /// ````
  Address call({
    Object? id = const $CopyWithPlaceholder(),
    Object? clientId = const $CopyWithPlaceholder(),
    Object? addressFull = const $CopyWithPlaceholder(),
    Object? district = const $CopyWithPlaceholder(),
    Object? province = const $CopyWithPlaceholder(),
    Object? department = const $CopyWithPlaceholder(),
    Object? postalCode = const $CopyWithPlaceholder(),
    Object? reference = const $CopyWithPlaceholder(),
    Object? isMain = const $CopyWithPlaceholder(),
    Object? latitude = const $CopyWithPlaceholder(),
    Object? longitude = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
  }) {
    return Address(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      clientId: clientId == const $CopyWithPlaceholder()
          ? _value.clientId
          // ignore: cast_nullable_to_non_nullable
          : clientId as int?,
      addressFull: addressFull == const $CopyWithPlaceholder()
          ? _value.addressFull
          // ignore: cast_nullable_to_non_nullable
          : addressFull as String?,
      district: district == const $CopyWithPlaceholder()
          ? _value.district
          // ignore: cast_nullable_to_non_nullable
          : district as String?,
      province: province == const $CopyWithPlaceholder()
          ? _value.province
          // ignore: cast_nullable_to_non_nullable
          : province as String?,
      department: department == const $CopyWithPlaceholder()
          ? _value.department
          // ignore: cast_nullable_to_non_nullable
          : department as String?,
      postalCode: postalCode == const $CopyWithPlaceholder()
          ? _value.postalCode
          // ignore: cast_nullable_to_non_nullable
          : postalCode as String?,
      reference: reference == const $CopyWithPlaceholder()
          ? _value.reference
          // ignore: cast_nullable_to_non_nullable
          : reference as String?,
      isMain: isMain == const $CopyWithPlaceholder()
          ? _value.isMain
          // ignore: cast_nullable_to_non_nullable
          : isMain as bool?,
      latitude: latitude == const $CopyWithPlaceholder()
          ? _value.latitude
          // ignore: cast_nullable_to_non_nullable
          : latitude as double?,
      longitude: longitude == const $CopyWithPlaceholder()
          ? _value.longitude
          // ignore: cast_nullable_to_non_nullable
          : longitude as double?,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime?,
      updatedAt: updatedAt == const $CopyWithPlaceholder()
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime?,
    );
  }
}

extension $AddressCopyWith on Address {
  /// Returns a callable class that can be used as follows: `instanceOfAddress.copyWith(...)` or like so:`instanceOfAddress.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AddressCWProxy get copyWith => _$AddressCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Address',
  json,
  ($checkedConvert) {
    final val = Address(
      id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
      clientId: $checkedConvert('client_id', (v) => (v as num?)?.toInt()),
      addressFull: $checkedConvert('address_full', (v) => v as String?),
      district: $checkedConvert('district', (v) => v as String?),
      province: $checkedConvert('province', (v) => v as String?),
      department: $checkedConvert('department', (v) => v as String?),
      postalCode: $checkedConvert('postal_code', (v) => v as String?),
      reference: $checkedConvert('reference', (v) => v as String?),
      isMain: $checkedConvert('is_main', (v) => v as bool?),
      latitude: $checkedConvert('latitude', (v) => (v as num?)?.toDouble()),
      longitude: $checkedConvert('longitude', (v) => (v as num?)?.toDouble()),
      createdAt: $checkedConvert(
        'created_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'clientId': 'client_id',
    'addressFull': 'address_full',
    'postalCode': 'postal_code',
    'isMain': 'is_main',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
  },
);

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
  'id': ?instance.id,
  'client_id': ?instance.clientId,
  'address_full': ?instance.addressFull,
  'district': ?instance.district,
  'province': ?instance.province,
  'department': ?instance.department,
  'postal_code': ?instance.postalCode,
  'reference': ?instance.reference,
  'is_main': ?instance.isMain,
  'latitude': ?instance.latitude,
  'longitude': ?instance.longitude,
  'created_at': ?instance.createdAt?.toIso8601String(),
  'updated_at': ?instance.updatedAt?.toIso8601String(),
};
