// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_part.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TicketPartCWProxy {
  TicketPart id(int? id);

  TicketPart stockId(int? stockId);

  TicketPart productName(String? productName);

  TicketPart sku(String? sku);

  TicketPart quantity(int? quantity);

  TicketPart unitCost(double? unitCost);

  TicketPart createdAt(DateTime? createdAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketPart(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketPart(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketPart call({
    int? id,
    int? stockId,
    String? productName,
    String? sku,
    int? quantity,
    double? unitCost,
    DateTime? createdAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTicketPart.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTicketPart.copyWith.fieldName(...)`
class _$TicketPartCWProxyImpl implements _$TicketPartCWProxy {
  const _$TicketPartCWProxyImpl(this._value);

  final TicketPart _value;

  @override
  TicketPart id(int? id) => this(id: id);

  @override
  TicketPart stockId(int? stockId) => this(stockId: stockId);

  @override
  TicketPart productName(String? productName) => this(productName: productName);

  @override
  TicketPart sku(String? sku) => this(sku: sku);

  @override
  TicketPart quantity(int? quantity) => this(quantity: quantity);

  @override
  TicketPart unitCost(double? unitCost) => this(unitCost: unitCost);

  @override
  TicketPart createdAt(DateTime? createdAt) => this(createdAt: createdAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketPart(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketPart(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketPart call({
    Object? id = const $CopyWithPlaceholder(),
    Object? stockId = const $CopyWithPlaceholder(),
    Object? productName = const $CopyWithPlaceholder(),
    Object? sku = const $CopyWithPlaceholder(),
    Object? quantity = const $CopyWithPlaceholder(),
    Object? unitCost = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
  }) {
    return TicketPart(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      stockId: stockId == const $CopyWithPlaceholder()
          ? _value.stockId
          // ignore: cast_nullable_to_non_nullable
          : stockId as int?,
      productName: productName == const $CopyWithPlaceholder()
          ? _value.productName
          // ignore: cast_nullable_to_non_nullable
          : productName as String?,
      sku: sku == const $CopyWithPlaceholder()
          ? _value.sku
          // ignore: cast_nullable_to_non_nullable
          : sku as String?,
      quantity: quantity == const $CopyWithPlaceholder()
          ? _value.quantity
          // ignore: cast_nullable_to_non_nullable
          : quantity as int?,
      unitCost: unitCost == const $CopyWithPlaceholder()
          ? _value.unitCost
          // ignore: cast_nullable_to_non_nullable
          : unitCost as double?,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime?,
    );
  }
}

extension $TicketPartCopyWith on TicketPart {
  /// Returns a callable class that can be used as follows: `instanceOfTicketPart.copyWith(...)` or like so:`instanceOfTicketPart.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TicketPartCWProxy get copyWith => _$TicketPartCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketPart _$TicketPartFromJson(Map<String, dynamic> json) => $checkedCreate(
  'TicketPart',
  json,
  ($checkedConvert) {
    final val = TicketPart(
      id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
      stockId: $checkedConvert('stock_id', (v) => (v as num?)?.toInt()),
      productName: $checkedConvert('product_name', (v) => v as String?),
      sku: $checkedConvert('sku', (v) => v as String?),
      quantity: $checkedConvert('quantity', (v) => (v as num?)?.toInt()),
      unitCost: $checkedConvert('unit_cost', (v) => (v as num?)?.toDouble()),
      createdAt: $checkedConvert(
        'created_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'stockId': 'stock_id',
    'productName': 'product_name',
    'unitCost': 'unit_cost',
    'createdAt': 'created_at',
  },
);

Map<String, dynamic> _$TicketPartToJson(TicketPart instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'stock_id': ?instance.stockId,
      'product_name': ?instance.productName,
      'sku': ?instance.sku,
      'quantity': ?instance.quantity,
      'unit_cost': ?instance.unitCost,
      'created_at': ?instance.createdAt?.toIso8601String(),
    };
