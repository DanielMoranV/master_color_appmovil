// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_me_get200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AuthMeGet200ResponseCWProxy {
  AuthMeGet200Response success(bool? success);

  AuthMeGet200Response message(String? message);

  AuthMeGet200Response status(int? status);

  AuthMeGet200Response data(AuthMeGet200ResponseAllOfData? data);

  AuthMeGet200Response errors(Object? errors);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthMeGet200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthMeGet200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthMeGet200Response call({
    bool? success,
    String? message,
    int? status,
    AuthMeGet200ResponseAllOfData? data,
    Object? errors,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAuthMeGet200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAuthMeGet200Response.copyWith.fieldName(...)`
class _$AuthMeGet200ResponseCWProxyImpl
    implements _$AuthMeGet200ResponseCWProxy {
  const _$AuthMeGet200ResponseCWProxyImpl(this._value);

  final AuthMeGet200Response _value;

  @override
  AuthMeGet200Response success(bool? success) => this(success: success);

  @override
  AuthMeGet200Response message(String? message) => this(message: message);

  @override
  AuthMeGet200Response status(int? status) => this(status: status);

  @override
  AuthMeGet200Response data(AuthMeGet200ResponseAllOfData? data) =>
      this(data: data);

  @override
  AuthMeGet200Response errors(Object? errors) => this(errors: errors);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthMeGet200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthMeGet200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthMeGet200Response call({
    Object? success = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? data = const $CopyWithPlaceholder(),
    Object? errors = const $CopyWithPlaceholder(),
  }) {
    return AuthMeGet200Response(
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
          : data as AuthMeGet200ResponseAllOfData?,
      errors: errors == const $CopyWithPlaceholder()
          ? _value.errors
          // ignore: cast_nullable_to_non_nullable
          : errors as Object?,
    );
  }
}

extension $AuthMeGet200ResponseCopyWith on AuthMeGet200Response {
  /// Returns a callable class that can be used as follows: `instanceOfAuthMeGet200Response.copyWith(...)` or like so:`instanceOfAuthMeGet200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AuthMeGet200ResponseCWProxy get copyWith =>
      _$AuthMeGet200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthMeGet200Response _$AuthMeGet200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AuthMeGet200Response', json, ($checkedConvert) {
  final val = AuthMeGet200Response(
    success: $checkedConvert('success', (v) => v as bool?),
    message: $checkedConvert('message', (v) => v as String?),
    status: $checkedConvert('status', (v) => (v as num?)?.toInt()),
    data: $checkedConvert(
      'data',
      (v) => v == null
          ? null
          : AuthMeGet200ResponseAllOfData.fromJson(v as Map<String, dynamic>),
    ),
    errors: $checkedConvert('errors', (v) => v),
  );
  return val;
});

Map<String, dynamic> _$AuthMeGet200ResponseToJson(
  AuthMeGet200Response instance,
) => <String, dynamic>{
  'success': ?instance.success,
  'message': ?instance.message,
  'status': ?instance.status,
  'data': ?instance.data?.toJson(),
  'errors': ?instance.errors,
};
