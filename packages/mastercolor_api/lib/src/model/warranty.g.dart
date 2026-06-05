// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warranty.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WarrantyCWProxy {
  Warranty soldUnitId(int? soldUnitId);

  Warranty purchaseDate(DateTime? purchaseDate);

  Warranty warrantyMonths(int? warrantyMonths);

  Warranty expiresAt(DateTime? expiresAt);

  Warranty active(bool? active);

  Warranty daysRemaining(int? daysRemaining);

  Warranty status(WarrantyStatusEnum? status);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Warranty(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Warranty(...).copyWith(id: 12, name: "My name")
  /// ````
  Warranty call({
    int? soldUnitId,
    DateTime? purchaseDate,
    int? warrantyMonths,
    DateTime? expiresAt,
    bool? active,
    int? daysRemaining,
    WarrantyStatusEnum? status,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWarranty.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWarranty.copyWith.fieldName(...)`
class _$WarrantyCWProxyImpl implements _$WarrantyCWProxy {
  const _$WarrantyCWProxyImpl(this._value);

  final Warranty _value;

  @override
  Warranty soldUnitId(int? soldUnitId) => this(soldUnitId: soldUnitId);

  @override
  Warranty purchaseDate(DateTime? purchaseDate) =>
      this(purchaseDate: purchaseDate);

  @override
  Warranty warrantyMonths(int? warrantyMonths) =>
      this(warrantyMonths: warrantyMonths);

  @override
  Warranty expiresAt(DateTime? expiresAt) => this(expiresAt: expiresAt);

  @override
  Warranty active(bool? active) => this(active: active);

  @override
  Warranty daysRemaining(int? daysRemaining) =>
      this(daysRemaining: daysRemaining);

  @override
  Warranty status(WarrantyStatusEnum? status) => this(status: status);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Warranty(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Warranty(...).copyWith(id: 12, name: "My name")
  /// ````
  Warranty call({
    Object? soldUnitId = const $CopyWithPlaceholder(),
    Object? purchaseDate = const $CopyWithPlaceholder(),
    Object? warrantyMonths = const $CopyWithPlaceholder(),
    Object? expiresAt = const $CopyWithPlaceholder(),
    Object? active = const $CopyWithPlaceholder(),
    Object? daysRemaining = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
  }) {
    return Warranty(
      soldUnitId: soldUnitId == const $CopyWithPlaceholder()
          ? _value.soldUnitId
          // ignore: cast_nullable_to_non_nullable
          : soldUnitId as int?,
      purchaseDate: purchaseDate == const $CopyWithPlaceholder()
          ? _value.purchaseDate
          // ignore: cast_nullable_to_non_nullable
          : purchaseDate as DateTime?,
      warrantyMonths: warrantyMonths == const $CopyWithPlaceholder()
          ? _value.warrantyMonths
          // ignore: cast_nullable_to_non_nullable
          : warrantyMonths as int?,
      expiresAt: expiresAt == const $CopyWithPlaceholder()
          ? _value.expiresAt
          // ignore: cast_nullable_to_non_nullable
          : expiresAt as DateTime?,
      active: active == const $CopyWithPlaceholder()
          ? _value.active
          // ignore: cast_nullable_to_non_nullable
          : active as bool?,
      daysRemaining: daysRemaining == const $CopyWithPlaceholder()
          ? _value.daysRemaining
          // ignore: cast_nullable_to_non_nullable
          : daysRemaining as int?,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as WarrantyStatusEnum?,
    );
  }
}

extension $WarrantyCopyWith on Warranty {
  /// Returns a callable class that can be used as follows: `instanceOfWarranty.copyWith(...)` or like so:`instanceOfWarranty.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WarrantyCWProxy get copyWith => _$WarrantyCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Warranty _$WarrantyFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Warranty',
  json,
  ($checkedConvert) {
    final val = Warranty(
      soldUnitId: $checkedConvert('sold_unit_id', (v) => (v as num?)?.toInt()),
      purchaseDate: $checkedConvert(
        'purchase_date',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      warrantyMonths: $checkedConvert(
        'warranty_months',
        (v) => (v as num?)?.toInt(),
      ),
      expiresAt: $checkedConvert(
        'expires_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      active: $checkedConvert('active', (v) => v as bool?),
      daysRemaining: $checkedConvert(
        'days_remaining',
        (v) => (v as num?)?.toInt(),
      ),
      status: $checkedConvert(
        'status',
        (v) => $enumDecodeNullable(_$WarrantyStatusEnumEnumMap, v),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'soldUnitId': 'sold_unit_id',
    'purchaseDate': 'purchase_date',
    'warrantyMonths': 'warranty_months',
    'expiresAt': 'expires_at',
    'daysRemaining': 'days_remaining',
  },
);

Map<String, dynamic> _$WarrantyToJson(Warranty instance) => <String, dynamic>{
  'sold_unit_id': ?instance.soldUnitId,
  'purchase_date': ?instance.purchaseDate?.toIso8601String(),
  'warranty_months': ?instance.warrantyMonths,
  'expires_at': ?instance.expiresAt?.toIso8601String(),
  'active': ?instance.active,
  'days_remaining': ?instance.daysRemaining,
  'status': ?_$WarrantyStatusEnumEnumMap[instance.status],
};

const _$WarrantyStatusEnumEnumMap = {
  WarrantyStatusEnum.vigente: 'vigente',
  WarrantyStatusEnum.vencida: 'vencida',
  WarrantyStatusEnum.sinGarantia: 'sin_garantia',
};
