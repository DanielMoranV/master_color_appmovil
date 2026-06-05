// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validation_error.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ValidationErrorCWProxy {
  ValidationError success(bool? success);

  ValidationError message(String? message);

  ValidationError data(Object? data);

  ValidationError errors(Map<String, List<String>>? errors);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ValidationError(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ValidationError(...).copyWith(id: 12, name: "My name")
  /// ````
  ValidationError call({
    bool? success,
    String? message,
    Object? data,
    Map<String, List<String>>? errors,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfValidationError.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfValidationError.copyWith.fieldName(...)`
class _$ValidationErrorCWProxyImpl implements _$ValidationErrorCWProxy {
  const _$ValidationErrorCWProxyImpl(this._value);

  final ValidationError _value;

  @override
  ValidationError success(bool? success) => this(success: success);

  @override
  ValidationError message(String? message) => this(message: message);

  @override
  ValidationError data(Object? data) => this(data: data);

  @override
  ValidationError errors(Map<String, List<String>>? errors) =>
      this(errors: errors);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ValidationError(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ValidationError(...).copyWith(id: 12, name: "My name")
  /// ````
  ValidationError call({
    Object? success = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? data = const $CopyWithPlaceholder(),
    Object? errors = const $CopyWithPlaceholder(),
  }) {
    return ValidationError(
      success: success == const $CopyWithPlaceholder()
          ? _value.success
          // ignore: cast_nullable_to_non_nullable
          : success as bool?,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      data: data == const $CopyWithPlaceholder()
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as Object?,
      errors: errors == const $CopyWithPlaceholder()
          ? _value.errors
          // ignore: cast_nullable_to_non_nullable
          : errors as Map<String, List<String>>?,
    );
  }
}

extension $ValidationErrorCopyWith on ValidationError {
  /// Returns a callable class that can be used as follows: `instanceOfValidationError.copyWith(...)` or like so:`instanceOfValidationError.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ValidationErrorCWProxy get copyWith => _$ValidationErrorCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValidationError _$ValidationErrorFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ValidationError', json, ($checkedConvert) {
      final val = ValidationError(
        success: $checkedConvert('success', (v) => v as bool?),
        message: $checkedConvert('message', (v) => v as String?),
        data: $checkedConvert('data', (v) => v),
        errors: $checkedConvert(
          'errors',
          (v) => (v as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
              k,
              (e as List<dynamic>).map((e) => e as String).toList(),
            ),
          ),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ValidationErrorToJson(ValidationError instance) =>
    <String, dynamic>{
      'success': ?instance.success,
      'message': ?instance.message,
      'data': ?instance.data,
      'errors': ?instance.errors,
    };
