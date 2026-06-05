// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_success.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ApiSuccessCWProxy {
  ApiSuccess success(bool? success);

  ApiSuccess message(String? message);

  ApiSuccess status(int? status);

  ApiSuccess data(Object? data);

  ApiSuccess errors(Object? errors);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ApiSuccess(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ApiSuccess(...).copyWith(id: 12, name: "My name")
  /// ````
  ApiSuccess call({
    bool? success,
    String? message,
    int? status,
    Object? data,
    Object? errors,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfApiSuccess.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfApiSuccess.copyWith.fieldName(...)`
class _$ApiSuccessCWProxyImpl implements _$ApiSuccessCWProxy {
  const _$ApiSuccessCWProxyImpl(this._value);

  final ApiSuccess _value;

  @override
  ApiSuccess success(bool? success) => this(success: success);

  @override
  ApiSuccess message(String? message) => this(message: message);

  @override
  ApiSuccess status(int? status) => this(status: status);

  @override
  ApiSuccess data(Object? data) => this(data: data);

  @override
  ApiSuccess errors(Object? errors) => this(errors: errors);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ApiSuccess(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ApiSuccess(...).copyWith(id: 12, name: "My name")
  /// ````
  ApiSuccess call({
    Object? success = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? data = const $CopyWithPlaceholder(),
    Object? errors = const $CopyWithPlaceholder(),
  }) {
    return ApiSuccess(
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
          : data as Object?,
      errors: errors == const $CopyWithPlaceholder()
          ? _value.errors
          // ignore: cast_nullable_to_non_nullable
          : errors as Object?,
    );
  }
}

extension $ApiSuccessCopyWith on ApiSuccess {
  /// Returns a callable class that can be used as follows: `instanceOfApiSuccess.copyWith(...)` or like so:`instanceOfApiSuccess.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ApiSuccessCWProxy get copyWith => _$ApiSuccessCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiSuccess _$ApiSuccessFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ApiSuccess', json, ($checkedConvert) {
      final val = ApiSuccess(
        success: $checkedConvert('success', (v) => v as bool?),
        message: $checkedConvert('message', (v) => v as String?),
        status: $checkedConvert('status', (v) => (v as num?)?.toInt()),
        data: $checkedConvert('data', (v) => v),
        errors: $checkedConvert('errors', (v) => v),
      );
      return val;
    });

Map<String, dynamic> _$ApiSuccessToJson(ApiSuccess instance) =>
    <String, dynamic>{
      'success': ?instance.success,
      'message': ?instance.message,
      'status': ?instance.status,
      'data': ?instance.data,
      'errors': ?instance.errors,
    };
