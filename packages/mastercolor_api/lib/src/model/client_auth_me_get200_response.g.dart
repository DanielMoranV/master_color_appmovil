// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_auth_me_get200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ClientAuthMeGet200ResponseCWProxy {
  ClientAuthMeGet200Response success(bool? success);

  ClientAuthMeGet200Response message(String? message);

  ClientAuthMeGet200Response status(int? status);

  ClientAuthMeGet200Response data(ClientAuthMeGet200ResponseAllOfData? data);

  ClientAuthMeGet200Response errors(Object? errors);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientAuthMeGet200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientAuthMeGet200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientAuthMeGet200Response call({
    bool? success,
    String? message,
    int? status,
    ClientAuthMeGet200ResponseAllOfData? data,
    Object? errors,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfClientAuthMeGet200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfClientAuthMeGet200Response.copyWith.fieldName(...)`
class _$ClientAuthMeGet200ResponseCWProxyImpl
    implements _$ClientAuthMeGet200ResponseCWProxy {
  const _$ClientAuthMeGet200ResponseCWProxyImpl(this._value);

  final ClientAuthMeGet200Response _value;

  @override
  ClientAuthMeGet200Response success(bool? success) => this(success: success);

  @override
  ClientAuthMeGet200Response message(String? message) => this(message: message);

  @override
  ClientAuthMeGet200Response status(int? status) => this(status: status);

  @override
  ClientAuthMeGet200Response data(ClientAuthMeGet200ResponseAllOfData? data) =>
      this(data: data);

  @override
  ClientAuthMeGet200Response errors(Object? errors) => this(errors: errors);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientAuthMeGet200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientAuthMeGet200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientAuthMeGet200Response call({
    Object? success = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? data = const $CopyWithPlaceholder(),
    Object? errors = const $CopyWithPlaceholder(),
  }) {
    return ClientAuthMeGet200Response(
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
          : data as ClientAuthMeGet200ResponseAllOfData?,
      errors: errors == const $CopyWithPlaceholder()
          ? _value.errors
          // ignore: cast_nullable_to_non_nullable
          : errors as Object?,
    );
  }
}

extension $ClientAuthMeGet200ResponseCopyWith on ClientAuthMeGet200Response {
  /// Returns a callable class that can be used as follows: `instanceOfClientAuthMeGet200Response.copyWith(...)` or like so:`instanceOfClientAuthMeGet200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ClientAuthMeGet200ResponseCWProxy get copyWith =>
      _$ClientAuthMeGet200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientAuthMeGet200Response _$ClientAuthMeGet200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ClientAuthMeGet200Response', json, ($checkedConvert) {
  final val = ClientAuthMeGet200Response(
    success: $checkedConvert('success', (v) => v as bool?),
    message: $checkedConvert('message', (v) => v as String?),
    status: $checkedConvert('status', (v) => (v as num?)?.toInt()),
    data: $checkedConvert(
      'data',
      (v) => v == null
          ? null
          : ClientAuthMeGet200ResponseAllOfData.fromJson(
              v as Map<String, dynamic>,
            ),
    ),
    errors: $checkedConvert('errors', (v) => v),
  );
  return val;
});

Map<String, dynamic> _$ClientAuthMeGet200ResponseToJson(
  ClientAuthMeGet200Response instance,
) => <String, dynamic>{
  'success': ?instance.success,
  'message': ?instance.message,
  'status': ?instance.status,
  'data': ?instance.data?.toJson(),
  'errors': ?instance.errors,
};
