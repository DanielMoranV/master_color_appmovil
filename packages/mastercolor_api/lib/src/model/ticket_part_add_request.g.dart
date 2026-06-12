// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_part_add_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TicketPartAddRequestCWProxy {
  TicketPartAddRequest stockId(int stockId);

  TicketPartAddRequest quantity(int quantity);

  TicketPartAddRequest unitCost(double? unitCost);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketPartAddRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketPartAddRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketPartAddRequest call({int stockId, int quantity, double? unitCost});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTicketPartAddRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTicketPartAddRequest.copyWith.fieldName(...)`
class _$TicketPartAddRequestCWProxyImpl
    implements _$TicketPartAddRequestCWProxy {
  const _$TicketPartAddRequestCWProxyImpl(this._value);

  final TicketPartAddRequest _value;

  @override
  TicketPartAddRequest stockId(int stockId) => this(stockId: stockId);

  @override
  TicketPartAddRequest quantity(int quantity) => this(quantity: quantity);

  @override
  TicketPartAddRequest unitCost(double? unitCost) => this(unitCost: unitCost);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketPartAddRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketPartAddRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketPartAddRequest call({
    Object? stockId = const $CopyWithPlaceholder(),
    Object? quantity = const $CopyWithPlaceholder(),
    Object? unitCost = const $CopyWithPlaceholder(),
  }) {
    return TicketPartAddRequest(
      stockId: stockId == const $CopyWithPlaceholder()
          ? _value.stockId
          // ignore: cast_nullable_to_non_nullable
          : stockId as int,
      quantity: quantity == const $CopyWithPlaceholder()
          ? _value.quantity
          // ignore: cast_nullable_to_non_nullable
          : quantity as int,
      unitCost: unitCost == const $CopyWithPlaceholder()
          ? _value.unitCost
          // ignore: cast_nullable_to_non_nullable
          : unitCost as double?,
    );
  }
}

extension $TicketPartAddRequestCopyWith on TicketPartAddRequest {
  /// Returns a callable class that can be used as follows: `instanceOfTicketPartAddRequest.copyWith(...)` or like so:`instanceOfTicketPartAddRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TicketPartAddRequestCWProxy get copyWith =>
      _$TicketPartAddRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketPartAddRequest _$TicketPartAddRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'TicketPartAddRequest',
  json,
  ($checkedConvert) {
    $checkKeys(json, requiredKeys: const ['stock_id', 'quantity']);
    final val = TicketPartAddRequest(
      stockId: $checkedConvert('stock_id', (v) => (v as num).toInt()),
      quantity: $checkedConvert('quantity', (v) => (v as num).toInt()),
      unitCost: $checkedConvert('unit_cost', (v) => (v as num?)?.toDouble()),
    );
    return val;
  },
  fieldKeyMap: const {'stockId': 'stock_id', 'unitCost': 'unit_cost'},
);

Map<String, dynamic> _$TicketPartAddRequestToJson(
  TicketPartAddRequest instance,
) => <String, dynamic>{
  'stock_id': instance.stockId,
  'quantity': instance.quantity,
  'unit_cost': ?instance.unitCost,
};
