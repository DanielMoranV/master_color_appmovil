// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_units_id_history_get200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SupportUnitsIdHistoryGet200ResponseCWProxy {
  SupportUnitsIdHistoryGet200Response success(bool? success);

  SupportUnitsIdHistoryGet200Response message(String? message);

  SupportUnitsIdHistoryGet200Response status(int? status);

  SupportUnitsIdHistoryGet200Response data(
    SupportUnitsIdHistoryGet200ResponseAllOfData? data,
  );

  SupportUnitsIdHistoryGet200Response errors(Object? errors);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SupportUnitsIdHistoryGet200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SupportUnitsIdHistoryGet200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  SupportUnitsIdHistoryGet200Response call({
    bool? success,
    String? message,
    int? status,
    SupportUnitsIdHistoryGet200ResponseAllOfData? data,
    Object? errors,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSupportUnitsIdHistoryGet200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSupportUnitsIdHistoryGet200Response.copyWith.fieldName(...)`
class _$SupportUnitsIdHistoryGet200ResponseCWProxyImpl
    implements _$SupportUnitsIdHistoryGet200ResponseCWProxy {
  const _$SupportUnitsIdHistoryGet200ResponseCWProxyImpl(this._value);

  final SupportUnitsIdHistoryGet200Response _value;

  @override
  SupportUnitsIdHistoryGet200Response success(bool? success) =>
      this(success: success);

  @override
  SupportUnitsIdHistoryGet200Response message(String? message) =>
      this(message: message);

  @override
  SupportUnitsIdHistoryGet200Response status(int? status) =>
      this(status: status);

  @override
  SupportUnitsIdHistoryGet200Response data(
    SupportUnitsIdHistoryGet200ResponseAllOfData? data,
  ) => this(data: data);

  @override
  SupportUnitsIdHistoryGet200Response errors(Object? errors) =>
      this(errors: errors);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SupportUnitsIdHistoryGet200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SupportUnitsIdHistoryGet200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  SupportUnitsIdHistoryGet200Response call({
    Object? success = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? data = const $CopyWithPlaceholder(),
    Object? errors = const $CopyWithPlaceholder(),
  }) {
    return SupportUnitsIdHistoryGet200Response(
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
          : data as SupportUnitsIdHistoryGet200ResponseAllOfData?,
      errors: errors == const $CopyWithPlaceholder()
          ? _value.errors
          // ignore: cast_nullable_to_non_nullable
          : errors as Object?,
    );
  }
}

extension $SupportUnitsIdHistoryGet200ResponseCopyWith
    on SupportUnitsIdHistoryGet200Response {
  /// Returns a callable class that can be used as follows: `instanceOfSupportUnitsIdHistoryGet200Response.copyWith(...)` or like so:`instanceOfSupportUnitsIdHistoryGet200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SupportUnitsIdHistoryGet200ResponseCWProxy get copyWith =>
      _$SupportUnitsIdHistoryGet200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupportUnitsIdHistoryGet200Response
_$SupportUnitsIdHistoryGet200ResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SupportUnitsIdHistoryGet200Response', json, (
      $checkedConvert,
    ) {
      final val = SupportUnitsIdHistoryGet200Response(
        success: $checkedConvert('success', (v) => v as bool?),
        message: $checkedConvert('message', (v) => v as String?),
        status: $checkedConvert('status', (v) => (v as num?)?.toInt()),
        data: $checkedConvert(
          'data',
          (v) => v == null
              ? null
              : SupportUnitsIdHistoryGet200ResponseAllOfData.fromJson(
                  v as Map<String, dynamic>,
                ),
        ),
        errors: $checkedConvert('errors', (v) => v),
      );
      return val;
    });

Map<String, dynamic> _$SupportUnitsIdHistoryGet200ResponseToJson(
  SupportUnitsIdHistoryGet200Response instance,
) => <String, dynamic>{
  'success': ?instance.success,
  'message': ?instance.message,
  'status': ?instance.status,
  'data': ?instance.data?.toJson(),
  'errors': ?instance.errors,
};
