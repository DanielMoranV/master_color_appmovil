// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_parts_get200_response_all_of_data_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SupportPartsGet200ResponseAllOfDataInnerCWProxy {
  SupportPartsGet200ResponseAllOfDataInner stockId(int? stockId);

  SupportPartsGet200ResponseAllOfDataInner productId(int? productId);

  SupportPartsGet200ResponseAllOfDataInner productName(String? productName);

  SupportPartsGet200ResponseAllOfDataInner sku(String? sku);

  SupportPartsGet200ResponseAllOfDataInner availableQty(int? availableQty);

  SupportPartsGet200ResponseAllOfDataInner purchasePrice(double? purchasePrice);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SupportPartsGet200ResponseAllOfDataInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SupportPartsGet200ResponseAllOfDataInner(...).copyWith(id: 12, name: "My name")
  /// ````
  SupportPartsGet200ResponseAllOfDataInner call({
    int? stockId,
    int? productId,
    String? productName,
    String? sku,
    int? availableQty,
    double? purchasePrice,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSupportPartsGet200ResponseAllOfDataInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSupportPartsGet200ResponseAllOfDataInner.copyWith.fieldName(...)`
class _$SupportPartsGet200ResponseAllOfDataInnerCWProxyImpl
    implements _$SupportPartsGet200ResponseAllOfDataInnerCWProxy {
  const _$SupportPartsGet200ResponseAllOfDataInnerCWProxyImpl(this._value);

  final SupportPartsGet200ResponseAllOfDataInner _value;

  @override
  SupportPartsGet200ResponseAllOfDataInner stockId(int? stockId) =>
      this(stockId: stockId);

  @override
  SupportPartsGet200ResponseAllOfDataInner productId(int? productId) =>
      this(productId: productId);

  @override
  SupportPartsGet200ResponseAllOfDataInner productName(String? productName) =>
      this(productName: productName);

  @override
  SupportPartsGet200ResponseAllOfDataInner sku(String? sku) => this(sku: sku);

  @override
  SupportPartsGet200ResponseAllOfDataInner availableQty(int? availableQty) =>
      this(availableQty: availableQty);

  @override
  SupportPartsGet200ResponseAllOfDataInner purchasePrice(
    double? purchasePrice,
  ) => this(purchasePrice: purchasePrice);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SupportPartsGet200ResponseAllOfDataInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SupportPartsGet200ResponseAllOfDataInner(...).copyWith(id: 12, name: "My name")
  /// ````
  SupportPartsGet200ResponseAllOfDataInner call({
    Object? stockId = const $CopyWithPlaceholder(),
    Object? productId = const $CopyWithPlaceholder(),
    Object? productName = const $CopyWithPlaceholder(),
    Object? sku = const $CopyWithPlaceholder(),
    Object? availableQty = const $CopyWithPlaceholder(),
    Object? purchasePrice = const $CopyWithPlaceholder(),
  }) {
    return SupportPartsGet200ResponseAllOfDataInner(
      stockId: stockId == const $CopyWithPlaceholder()
          ? _value.stockId
          // ignore: cast_nullable_to_non_nullable
          : stockId as int?,
      productId: productId == const $CopyWithPlaceholder()
          ? _value.productId
          // ignore: cast_nullable_to_non_nullable
          : productId as int?,
      productName: productName == const $CopyWithPlaceholder()
          ? _value.productName
          // ignore: cast_nullable_to_non_nullable
          : productName as String?,
      sku: sku == const $CopyWithPlaceholder()
          ? _value.sku
          // ignore: cast_nullable_to_non_nullable
          : sku as String?,
      availableQty: availableQty == const $CopyWithPlaceholder()
          ? _value.availableQty
          // ignore: cast_nullable_to_non_nullable
          : availableQty as int?,
      purchasePrice: purchasePrice == const $CopyWithPlaceholder()
          ? _value.purchasePrice
          // ignore: cast_nullable_to_non_nullable
          : purchasePrice as double?,
    );
  }
}

extension $SupportPartsGet200ResponseAllOfDataInnerCopyWith
    on SupportPartsGet200ResponseAllOfDataInner {
  /// Returns a callable class that can be used as follows: `instanceOfSupportPartsGet200ResponseAllOfDataInner.copyWith(...)` or like so:`instanceOfSupportPartsGet200ResponseAllOfDataInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SupportPartsGet200ResponseAllOfDataInnerCWProxy get copyWith =>
      _$SupportPartsGet200ResponseAllOfDataInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupportPartsGet200ResponseAllOfDataInner
_$SupportPartsGet200ResponseAllOfDataInnerFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SupportPartsGet200ResponseAllOfDataInner',
      json,
      ($checkedConvert) {
        final val = SupportPartsGet200ResponseAllOfDataInner(
          stockId: $checkedConvert('stock_id', (v) => (v as num?)?.toInt()),
          productId: $checkedConvert('product_id', (v) => (v as num?)?.toInt()),
          productName: $checkedConvert('product_name', (v) => v as String?),
          sku: $checkedConvert('sku', (v) => v as String?),
          availableQty: $checkedConvert(
            'available_qty',
            (v) => (v as num?)?.toInt(),
          ),
          purchasePrice: $checkedConvert(
            'purchase_price',
            (v) => (v as num?)?.toDouble(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'stockId': 'stock_id',
        'productId': 'product_id',
        'productName': 'product_name',
        'availableQty': 'available_qty',
        'purchasePrice': 'purchase_price',
      },
    );

Map<String, dynamic> _$SupportPartsGet200ResponseAllOfDataInnerToJson(
  SupportPartsGet200ResponseAllOfDataInner instance,
) => <String, dynamic>{
  'stock_id': ?instance.stockId,
  'product_id': ?instance.productId,
  'product_name': ?instance.productName,
  'sku': ?instance.sku,
  'available_qty': ?instance.availableQty,
  'purchase_price': ?instance.purchasePrice,
};
