// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_report_request_parts_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ServiceReportRequestPartsInnerCWProxy {
  ServiceReportRequestPartsInner stockId(int stockId);

  ServiceReportRequestPartsInner qty(int qty);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ServiceReportRequestPartsInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ServiceReportRequestPartsInner(...).copyWith(id: 12, name: "My name")
  /// ````
  ServiceReportRequestPartsInner call({int stockId, int qty});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfServiceReportRequestPartsInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfServiceReportRequestPartsInner.copyWith.fieldName(...)`
class _$ServiceReportRequestPartsInnerCWProxyImpl
    implements _$ServiceReportRequestPartsInnerCWProxy {
  const _$ServiceReportRequestPartsInnerCWProxyImpl(this._value);

  final ServiceReportRequestPartsInner _value;

  @override
  ServiceReportRequestPartsInner stockId(int stockId) => this(stockId: stockId);

  @override
  ServiceReportRequestPartsInner qty(int qty) => this(qty: qty);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ServiceReportRequestPartsInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ServiceReportRequestPartsInner(...).copyWith(id: 12, name: "My name")
  /// ````
  ServiceReportRequestPartsInner call({
    Object? stockId = const $CopyWithPlaceholder(),
    Object? qty = const $CopyWithPlaceholder(),
  }) {
    return ServiceReportRequestPartsInner(
      stockId: stockId == const $CopyWithPlaceholder()
          ? _value.stockId
          // ignore: cast_nullable_to_non_nullable
          : stockId as int,
      qty: qty == const $CopyWithPlaceholder()
          ? _value.qty
          // ignore: cast_nullable_to_non_nullable
          : qty as int,
    );
  }
}

extension $ServiceReportRequestPartsInnerCopyWith
    on ServiceReportRequestPartsInner {
  /// Returns a callable class that can be used as follows: `instanceOfServiceReportRequestPartsInner.copyWith(...)` or like so:`instanceOfServiceReportRequestPartsInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ServiceReportRequestPartsInnerCWProxy get copyWith =>
      _$ServiceReportRequestPartsInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceReportRequestPartsInner _$ServiceReportRequestPartsInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ServiceReportRequestPartsInner', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['stock_id', 'qty']);
  final val = ServiceReportRequestPartsInner(
    stockId: $checkedConvert('stock_id', (v) => (v as num).toInt()),
    qty: $checkedConvert('qty', (v) => (v as num).toInt()),
  );
  return val;
}, fieldKeyMap: const {'stockId': 'stock_id'});

Map<String, dynamic> _$ServiceReportRequestPartsInnerToJson(
  ServiceReportRequestPartsInner instance,
) => <String, dynamic>{'stock_id': instance.stockId, 'qty': instance.qty};
