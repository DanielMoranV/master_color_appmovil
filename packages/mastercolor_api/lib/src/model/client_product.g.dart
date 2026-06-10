// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_product.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ClientProductCWProxy {
  ClientProduct id(int? id);

  ClientProduct name(String? name);

  ClientProduct sku(String? sku);

  ClientProduct warrantyMonths(int? warrantyMonths);

  ClientProduct imageUrl(String? imageUrl);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientProduct(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientProduct(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientProduct call({
    int? id,
    String? name,
    String? sku,
    int? warrantyMonths,
    String? imageUrl,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfClientProduct.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfClientProduct.copyWith.fieldName(...)`
class _$ClientProductCWProxyImpl implements _$ClientProductCWProxy {
  const _$ClientProductCWProxyImpl(this._value);

  final ClientProduct _value;

  @override
  ClientProduct id(int? id) => this(id: id);

  @override
  ClientProduct name(String? name) => this(name: name);

  @override
  ClientProduct sku(String? sku) => this(sku: sku);

  @override
  ClientProduct warrantyMonths(int? warrantyMonths) =>
      this(warrantyMonths: warrantyMonths);

  @override
  ClientProduct imageUrl(String? imageUrl) => this(imageUrl: imageUrl);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientProduct(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientProduct(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientProduct call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? sku = const $CopyWithPlaceholder(),
    Object? warrantyMonths = const $CopyWithPlaceholder(),
    Object? imageUrl = const $CopyWithPlaceholder(),
  }) {
    return ClientProduct(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      sku: sku == const $CopyWithPlaceholder()
          ? _value.sku
          // ignore: cast_nullable_to_non_nullable
          : sku as String?,
      warrantyMonths: warrantyMonths == const $CopyWithPlaceholder()
          ? _value.warrantyMonths
          // ignore: cast_nullable_to_non_nullable
          : warrantyMonths as int?,
      imageUrl: imageUrl == const $CopyWithPlaceholder()
          ? _value.imageUrl
          // ignore: cast_nullable_to_non_nullable
          : imageUrl as String?,
    );
  }
}

extension $ClientProductCopyWith on ClientProduct {
  /// Returns a callable class that can be used as follows: `instanceOfClientProduct.copyWith(...)` or like so:`instanceOfClientProduct.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ClientProductCWProxy get copyWith => _$ClientProductCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientProduct _$ClientProductFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ClientProduct',
      json,
      ($checkedConvert) {
        final val = ClientProduct(
          id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
          name: $checkedConvert('name', (v) => v as String?),
          sku: $checkedConvert('sku', (v) => v as String?),
          warrantyMonths: $checkedConvert(
            'warranty_months',
            (v) => (v as num?)?.toInt(),
          ),
          imageUrl: $checkedConvert('image_url', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'warrantyMonths': 'warranty_months',
        'imageUrl': 'image_url',
      },
    );

Map<String, dynamic> _$ClientProductToJson(ClientProduct instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'name': ?instance.name,
      'sku': ?instance.sku,
      'warranty_months': ?instance.warrantyMonths,
      'image_url': ?instance.imageUrl,
    };
