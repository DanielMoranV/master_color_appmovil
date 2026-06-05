// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_metrics_get200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SupportMetricsGet200ResponseCWProxy {
  SupportMetricsGet200Response success(bool? success);

  SupportMetricsGet200Response message(String? message);

  SupportMetricsGet200Response status(int? status);

  SupportMetricsGet200Response data(SupportMetrics? data);

  SupportMetricsGet200Response errors(Object? errors);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SupportMetricsGet200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SupportMetricsGet200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  SupportMetricsGet200Response call({
    bool? success,
    String? message,
    int? status,
    SupportMetrics? data,
    Object? errors,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSupportMetricsGet200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSupportMetricsGet200Response.copyWith.fieldName(...)`
class _$SupportMetricsGet200ResponseCWProxyImpl
    implements _$SupportMetricsGet200ResponseCWProxy {
  const _$SupportMetricsGet200ResponseCWProxyImpl(this._value);

  final SupportMetricsGet200Response _value;

  @override
  SupportMetricsGet200Response success(bool? success) => this(success: success);

  @override
  SupportMetricsGet200Response message(String? message) =>
      this(message: message);

  @override
  SupportMetricsGet200Response status(int? status) => this(status: status);

  @override
  SupportMetricsGet200Response data(SupportMetrics? data) => this(data: data);

  @override
  SupportMetricsGet200Response errors(Object? errors) => this(errors: errors);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SupportMetricsGet200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SupportMetricsGet200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  SupportMetricsGet200Response call({
    Object? success = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? data = const $CopyWithPlaceholder(),
    Object? errors = const $CopyWithPlaceholder(),
  }) {
    return SupportMetricsGet200Response(
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
          : data as SupportMetrics?,
      errors: errors == const $CopyWithPlaceholder()
          ? _value.errors
          // ignore: cast_nullable_to_non_nullable
          : errors as Object?,
    );
  }
}

extension $SupportMetricsGet200ResponseCopyWith
    on SupportMetricsGet200Response {
  /// Returns a callable class that can be used as follows: `instanceOfSupportMetricsGet200Response.copyWith(...)` or like so:`instanceOfSupportMetricsGet200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SupportMetricsGet200ResponseCWProxy get copyWith =>
      _$SupportMetricsGet200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupportMetricsGet200Response _$SupportMetricsGet200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SupportMetricsGet200Response', json, ($checkedConvert) {
  final val = SupportMetricsGet200Response(
    success: $checkedConvert('success', (v) => v as bool?),
    message: $checkedConvert('message', (v) => v as String?),
    status: $checkedConvert('status', (v) => (v as num?)?.toInt()),
    data: $checkedConvert(
      'data',
      (v) =>
          v == null ? null : SupportMetrics.fromJson(v as Map<String, dynamic>),
    ),
    errors: $checkedConvert('errors', (v) => v),
  );
  return val;
});

Map<String, dynamic> _$SupportMetricsGet200ResponseToJson(
  SupportMetricsGet200Response instance,
) => <String, dynamic>{
  'success': ?instance.success,
  'message': ?instance.message,
  'status': ?instance.status,
  'data': ?instance.data?.toJson(),
  'errors': ?instance.errors,
};
