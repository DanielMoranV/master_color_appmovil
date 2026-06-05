// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ApiErrorCWProxy {
  ApiError success(bool? success);

  ApiError message(String? message);

  ApiError status(int? status);

  ApiError data(List<Object>? data);

  ApiError errors(Object? errors);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ApiError(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ApiError(...).copyWith(id: 12, name: "My name")
  /// ````
  ApiError call({
    bool? success,
    String? message,
    int? status,
    List<Object>? data,
    Object? errors,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfApiError.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfApiError.copyWith.fieldName(...)`
class _$ApiErrorCWProxyImpl implements _$ApiErrorCWProxy {
  const _$ApiErrorCWProxyImpl(this._value);

  final ApiError _value;

  @override
  ApiError success(bool? success) => this(success: success);

  @override
  ApiError message(String? message) => this(message: message);

  @override
  ApiError status(int? status) => this(status: status);

  @override
  ApiError data(List<Object>? data) => this(data: data);

  @override
  ApiError errors(Object? errors) => this(errors: errors);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ApiError(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ApiError(...).copyWith(id: 12, name: "My name")
  /// ````
  ApiError call({
    Object? success = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? data = const $CopyWithPlaceholder(),
    Object? errors = const $CopyWithPlaceholder(),
  }) {
    return ApiError(
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
          : data as List<Object>?,
      errors: errors == const $CopyWithPlaceholder()
          ? _value.errors
          // ignore: cast_nullable_to_non_nullable
          : errors as Object?,
    );
  }
}

extension $ApiErrorCopyWith on ApiError {
  /// Returns a callable class that can be used as follows: `instanceOfApiError.copyWith(...)` or like so:`instanceOfApiError.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ApiErrorCWProxy get copyWith => _$ApiErrorCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiError _$ApiErrorFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ApiError', json, ($checkedConvert) {
      final val = ApiError(
        success: $checkedConvert('success', (v) => v as bool?),
        message: $checkedConvert('message', (v) => v as String?),
        status: $checkedConvert('status', (v) => (v as num?)?.toInt()),
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>?)?.map((e) => e as Object).toList(),
        ),
        errors: $checkedConvert('errors', (v) => v),
      );
      return val;
    });

Map<String, dynamic> _$ApiErrorToJson(ApiError instance) => <String, dynamic>{
  'success': ?instance.success,
  'message': ?instance.message,
  'status': ?instance.status,
  'data': ?instance.data,
  'errors': ?instance.errors,
};
