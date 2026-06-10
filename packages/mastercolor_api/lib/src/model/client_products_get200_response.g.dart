// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_products_get200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ClientProductsGet200ResponseCWProxy {
  ClientProductsGet200Response success(bool? success);

  ClientProductsGet200Response message(String? message);

  ClientProductsGet200Response status(int? status);

  ClientProductsGet200Response data(List<ClientProduct>? data);

  ClientProductsGet200Response errors(Object? errors);

  ClientProductsGet200Response pagination(Pagination? pagination);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientProductsGet200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientProductsGet200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientProductsGet200Response call({
    bool? success,
    String? message,
    int? status,
    List<ClientProduct>? data,
    Object? errors,
    Pagination? pagination,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfClientProductsGet200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfClientProductsGet200Response.copyWith.fieldName(...)`
class _$ClientProductsGet200ResponseCWProxyImpl
    implements _$ClientProductsGet200ResponseCWProxy {
  const _$ClientProductsGet200ResponseCWProxyImpl(this._value);

  final ClientProductsGet200Response _value;

  @override
  ClientProductsGet200Response success(bool? success) => this(success: success);

  @override
  ClientProductsGet200Response message(String? message) =>
      this(message: message);

  @override
  ClientProductsGet200Response status(int? status) => this(status: status);

  @override
  ClientProductsGet200Response data(List<ClientProduct>? data) =>
      this(data: data);

  @override
  ClientProductsGet200Response errors(Object? errors) => this(errors: errors);

  @override
  ClientProductsGet200Response pagination(Pagination? pagination) =>
      this(pagination: pagination);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientProductsGet200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientProductsGet200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientProductsGet200Response call({
    Object? success = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? data = const $CopyWithPlaceholder(),
    Object? errors = const $CopyWithPlaceholder(),
    Object? pagination = const $CopyWithPlaceholder(),
  }) {
    return ClientProductsGet200Response(
      success: success == const $CopyWithPlaceholder()
          ? _value.success
          // ignore: cast_nullable_to_non_nullable
          : success as bool?,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as int?,
      data: data == const $CopyWithPlaceholder()
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as List<ClientProduct>?,
      errors: errors == const $CopyWithPlaceholder()
          ? _value.errors
          // ignore: cast_nullable_to_non_nullable
          : errors as Object?,
      pagination: pagination == const $CopyWithPlaceholder()
          ? _value.pagination
          // ignore: cast_nullable_to_non_nullable
          : pagination as Pagination?,
    );
  }
}

extension $ClientProductsGet200ResponseCopyWith
    on ClientProductsGet200Response {
  /// Returns a callable class that can be used as follows: `instanceOfClientProductsGet200Response.copyWith(...)` or like so:`instanceOfClientProductsGet200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ClientProductsGet200ResponseCWProxy get copyWith =>
      _$ClientProductsGet200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientProductsGet200Response _$ClientProductsGet200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ClientProductsGet200Response', json, ($checkedConvert) {
  final val = ClientProductsGet200Response(
    success: $checkedConvert('success', (v) => v as bool?),
    message: $checkedConvert('message', (v) => v as String?),
    status: $checkedConvert('status', (v) => (v as num?)?.toInt()),
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>?)
          ?.map((e) => ClientProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    errors: $checkedConvert('errors', (v) => v),
    pagination: $checkedConvert(
      'pagination',
      (v) => v == null ? null : Pagination.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$ClientProductsGet200ResponseToJson(
  ClientProductsGet200Response instance,
) => <String, dynamic>{
  'success': ?instance.success,
  'message': ?instance.message,
  'status': ?instance.status,
  'data': ?instance.data?.map((e) => e.toJson()).toList(),
  'errors': ?instance.errors,
  'pagination': ?instance.pagination?.toJson(),
};
