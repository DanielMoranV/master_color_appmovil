// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sold_unit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SoldUnitCWProxy {
  SoldUnit id(int? id);

  SoldUnit clientId(int? clientId);

  SoldUnit productId(int? productId);

  SoldUnit productName(String? productName);

  SoldUnit imageUrl(String? imageUrl);

  SoldUnit orderId(int? orderId);

  SoldUnit serialNumber(String? serialNumber);

  SoldUnit purchaseDate(DateTime? purchaseDate);

  SoldUnit warrantyMonths(int? warrantyMonths);

  SoldUnit warrantyExpiresAt(DateTime? warrantyExpiresAt);

  SoldUnit warrantyActive(bool? warrantyActive);

  SoldUnit registrationSource(
    SoldUnitRegistrationSourceEnum? registrationSource,
  );

  SoldUnit status(SoldUnitStatus? status);

  SoldUnit createdAt(DateTime? createdAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SoldUnit(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SoldUnit(...).copyWith(id: 12, name: "My name")
  /// ````
  SoldUnit call({
    int? id,
    int? clientId,
    int? productId,
    String? productName,
    String? imageUrl,
    int? orderId,
    String? serialNumber,
    DateTime? purchaseDate,
    int? warrantyMonths,
    DateTime? warrantyExpiresAt,
    bool? warrantyActive,
    SoldUnitRegistrationSourceEnum? registrationSource,
    SoldUnitStatus? status,
    DateTime? createdAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSoldUnit.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSoldUnit.copyWith.fieldName(...)`
class _$SoldUnitCWProxyImpl implements _$SoldUnitCWProxy {
  const _$SoldUnitCWProxyImpl(this._value);

  final SoldUnit _value;

  @override
  SoldUnit id(int? id) => this(id: id);

  @override
  SoldUnit clientId(int? clientId) => this(clientId: clientId);

  @override
  SoldUnit productId(int? productId) => this(productId: productId);

  @override
  SoldUnit productName(String? productName) => this(productName: productName);

  @override
  SoldUnit imageUrl(String? imageUrl) => this(imageUrl: imageUrl);

  @override
  SoldUnit orderId(int? orderId) => this(orderId: orderId);

  @override
  SoldUnit serialNumber(String? serialNumber) =>
      this(serialNumber: serialNumber);

  @override
  SoldUnit purchaseDate(DateTime? purchaseDate) =>
      this(purchaseDate: purchaseDate);

  @override
  SoldUnit warrantyMonths(int? warrantyMonths) =>
      this(warrantyMonths: warrantyMonths);

  @override
  SoldUnit warrantyExpiresAt(DateTime? warrantyExpiresAt) =>
      this(warrantyExpiresAt: warrantyExpiresAt);

  @override
  SoldUnit warrantyActive(bool? warrantyActive) =>
      this(warrantyActive: warrantyActive);

  @override
  SoldUnit registrationSource(
    SoldUnitRegistrationSourceEnum? registrationSource,
  ) => this(registrationSource: registrationSource);

  @override
  SoldUnit status(SoldUnitStatus? status) => this(status: status);

  @override
  SoldUnit createdAt(DateTime? createdAt) => this(createdAt: createdAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SoldUnit(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SoldUnit(...).copyWith(id: 12, name: "My name")
  /// ````
  SoldUnit call({
    Object? id = const $CopyWithPlaceholder(),
    Object? clientId = const $CopyWithPlaceholder(),
    Object? productId = const $CopyWithPlaceholder(),
    Object? productName = const $CopyWithPlaceholder(),
    Object? imageUrl = const $CopyWithPlaceholder(),
    Object? orderId = const $CopyWithPlaceholder(),
    Object? serialNumber = const $CopyWithPlaceholder(),
    Object? purchaseDate = const $CopyWithPlaceholder(),
    Object? warrantyMonths = const $CopyWithPlaceholder(),
    Object? warrantyExpiresAt = const $CopyWithPlaceholder(),
    Object? warrantyActive = const $CopyWithPlaceholder(),
    Object? registrationSource = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
  }) {
    return SoldUnit(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      clientId: clientId == const $CopyWithPlaceholder()
          ? _value.clientId
          // ignore: cast_nullable_to_non_nullable
          : clientId as int?,
      productId: productId == const $CopyWithPlaceholder()
          ? _value.productId
          // ignore: cast_nullable_to_non_nullable
          : productId as int?,
      productName: productName == const $CopyWithPlaceholder()
          ? _value.productName
          // ignore: cast_nullable_to_non_nullable
          : productName as String?,
      imageUrl: imageUrl == const $CopyWithPlaceholder()
          ? _value.imageUrl
          // ignore: cast_nullable_to_non_nullable
          : imageUrl as String?,
      orderId: orderId == const $CopyWithPlaceholder()
          ? _value.orderId
          // ignore: cast_nullable_to_non_nullable
          : orderId as int?,
      serialNumber: serialNumber == const $CopyWithPlaceholder()
          ? _value.serialNumber
          // ignore: cast_nullable_to_non_nullable
          : serialNumber as String?,
      purchaseDate: purchaseDate == const $CopyWithPlaceholder()
          ? _value.purchaseDate
          // ignore: cast_nullable_to_non_nullable
          : purchaseDate as DateTime?,
      warrantyMonths: warrantyMonths == const $CopyWithPlaceholder()
          ? _value.warrantyMonths
          // ignore: cast_nullable_to_non_nullable
          : warrantyMonths as int?,
      warrantyExpiresAt: warrantyExpiresAt == const $CopyWithPlaceholder()
          ? _value.warrantyExpiresAt
          // ignore: cast_nullable_to_non_nullable
          : warrantyExpiresAt as DateTime?,
      warrantyActive: warrantyActive == const $CopyWithPlaceholder()
          ? _value.warrantyActive
          // ignore: cast_nullable_to_non_nullable
          : warrantyActive as bool?,
      registrationSource: registrationSource == const $CopyWithPlaceholder()
          ? _value.registrationSource
          // ignore: cast_nullable_to_non_nullable
          : registrationSource as SoldUnitRegistrationSourceEnum?,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as SoldUnitStatus?,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime?,
    );
  }
}

extension $SoldUnitCopyWith on SoldUnit {
  /// Returns a callable class that can be used as follows: `instanceOfSoldUnit.copyWith(...)` or like so:`instanceOfSoldUnit.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SoldUnitCWProxy get copyWith => _$SoldUnitCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SoldUnit _$SoldUnitFromJson(Map<String, dynamic> json) => $checkedCreate(
  'SoldUnit',
  json,
  ($checkedConvert) {
    final val = SoldUnit(
      id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
      clientId: $checkedConvert('client_id', (v) => (v as num?)?.toInt()),
      productId: $checkedConvert('product_id', (v) => (v as num?)?.toInt()),
      productName: $checkedConvert('product_name', (v) => v as String?),
      imageUrl: $checkedConvert('image_url', (v) => v as String?),
      orderId: $checkedConvert('order_id', (v) => (v as num?)?.toInt()),
      serialNumber: $checkedConvert('serial_number', (v) => v as String?),
      purchaseDate: $checkedConvert(
        'purchase_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      warrantyMonths: $checkedConvert(
        'warranty_months',
        (v) => (v as num?)?.toInt(),
      ),
      warrantyExpiresAt: $checkedConvert(
        'warranty_expires_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      warrantyActive: $checkedConvert('warranty_active', (v) => v as bool?),
      registrationSource: $checkedConvert(
        'registration_source',
        (v) => $enumDecodeNullable(_$SoldUnitRegistrationSourceEnumEnumMap, v),
      ),
      status: $checkedConvert(
        'status',
        (v) => $enumDecodeNullable(_$SoldUnitStatusEnumMap, v),
      ),
      createdAt: $checkedConvert(
        'created_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'clientId': 'client_id',
    'productId': 'product_id',
    'productName': 'product_name',
    'imageUrl': 'image_url',
    'orderId': 'order_id',
    'serialNumber': 'serial_number',
    'purchaseDate': 'purchase_date',
    'warrantyMonths': 'warranty_months',
    'warrantyExpiresAt': 'warranty_expires_at',
    'warrantyActive': 'warranty_active',
    'registrationSource': 'registration_source',
    'createdAt': 'created_at',
  },
);

Map<String, dynamic> _$SoldUnitToJson(SoldUnit instance) => <String, dynamic>{
  'id': ?instance.id,
  'client_id': ?instance.clientId,
  'product_id': ?instance.productId,
  'product_name': ?instance.productName,
  'image_url': ?instance.imageUrl,
  'order_id': ?instance.orderId,
  'serial_number': ?instance.serialNumber,
  'purchase_date': ?instance.purchaseDate?.toIso8601String(),
  'warranty_months': ?instance.warrantyMonths,
  'warranty_expires_at': ?instance.warrantyExpiresAt?.toIso8601String(),
  'warranty_active': ?instance.warrantyActive,
  'registration_source':
      ?_$SoldUnitRegistrationSourceEnumEnumMap[instance.registrationSource],
  'status': ?_$SoldUnitStatusEnumMap[instance.status],
  'created_at': ?instance.createdAt?.toIso8601String(),
};

const _$SoldUnitRegistrationSourceEnumEnumMap = {
  SoldUnitRegistrationSourceEnum.order: 'order',
  SoldUnitRegistrationSourceEnum.manual: 'manual',
};

const _$SoldUnitStatusEnumMap = {
  SoldUnitStatus.activa: 'activa',
  SoldUnitStatus.enServicio: 'en_servicio',
  SoldUnitStatus.baja: 'baja',
};
