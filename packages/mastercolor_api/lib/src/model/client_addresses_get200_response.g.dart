// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_addresses_get200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ClientAddressesGet200ResponseCWProxy {
  ClientAddressesGet200Response success(bool? success);

  ClientAddressesGet200Response message(String? message);

  ClientAddressesGet200Response status(int? status);

  ClientAddressesGet200Response data(List<Address>? data);

  ClientAddressesGet200Response errors(Object? errors);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientAddressesGet200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientAddressesGet200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientAddressesGet200Response call({
    bool? success,
    String? message,
    int? status,
    List<Address>? data,
    Object? errors,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfClientAddressesGet200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfClientAddressesGet200Response.copyWith.fieldName(...)`
class _$ClientAddressesGet200ResponseCWProxyImpl
    implements _$ClientAddressesGet200ResponseCWProxy {
  const _$ClientAddressesGet200ResponseCWProxyImpl(this._value);

  final ClientAddressesGet200Response _value;

  @override
  ClientAddressesGet200Response success(bool? success) =>
      this(success: success);

  @override
  ClientAddressesGet200Response message(String? message) =>
      this(message: message);

  @override
  ClientAddressesGet200Response status(int? status) => this(status: status);

  @override
  ClientAddressesGet200Response data(List<Address>? data) => this(data: data);

  @override
  ClientAddressesGet200Response errors(Object? errors) => this(errors: errors);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientAddressesGet200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientAddressesGet200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientAddressesGet200Response call({
    Object? success = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? data = const $CopyWithPlaceholder(),
    Object? errors = const $CopyWithPlaceholder(),
  }) {
    return ClientAddressesGet200Response(
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
          : data as List<Address>?,
      errors: errors == const $CopyWithPlaceholder()
          ? _value.errors
          // ignore: cast_nullable_to_non_nullable
          : errors as Object?,
    );
  }
}

extension $ClientAddressesGet200ResponseCopyWith
    on ClientAddressesGet200Response {
  /// Returns a callable class that can be used as follows: `instanceOfClientAddressesGet200Response.copyWith(...)` or like so:`instanceOfClientAddressesGet200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ClientAddressesGet200ResponseCWProxy get copyWith =>
      _$ClientAddressesGet200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientAddressesGet200Response _$ClientAddressesGet200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ClientAddressesGet200Response', json, ($checkedConvert) {
  final val = ClientAddressesGet200Response(
    success: $checkedConvert('success', (v) => v as bool?),
    message: $checkedConvert('message', (v) => v as String?),
    status: $checkedConvert('status', (v) => (v as num?)?.toInt()),
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>?)
          ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    errors: $checkedConvert('errors', (v) => v),
  );
  return val;
});

Map<String, dynamic> _$ClientAddressesGet200ResponseToJson(
  ClientAddressesGet200Response instance,
) => <String, dynamic>{
  'success': ?instance.success,
  'message': ?instance.message,
  'status': ?instance.status,
  'data': ?instance.data?.map((e) => e.toJson()).toList(),
  'errors': ?instance.errors,
};
