// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_units_get200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ClientUnitsGet200ResponseCWProxy {
  ClientUnitsGet200Response success(bool? success);

  ClientUnitsGet200Response message(String? message);

  ClientUnitsGet200Response status(int? status);

  ClientUnitsGet200Response data(List<SoldUnit>? data);

  ClientUnitsGet200Response errors(Object? errors);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientUnitsGet200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientUnitsGet200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientUnitsGet200Response call({
    bool? success,
    String? message,
    int? status,
    List<SoldUnit>? data,
    Object? errors,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfClientUnitsGet200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfClientUnitsGet200Response.copyWith.fieldName(...)`
class _$ClientUnitsGet200ResponseCWProxyImpl
    implements _$ClientUnitsGet200ResponseCWProxy {
  const _$ClientUnitsGet200ResponseCWProxyImpl(this._value);

  final ClientUnitsGet200Response _value;

  @override
  ClientUnitsGet200Response success(bool? success) => this(success: success);

  @override
  ClientUnitsGet200Response message(String? message) => this(message: message);

  @override
  ClientUnitsGet200Response status(int? status) => this(status: status);

  @override
  ClientUnitsGet200Response data(List<SoldUnit>? data) => this(data: data);

  @override
  ClientUnitsGet200Response errors(Object? errors) => this(errors: errors);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientUnitsGet200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientUnitsGet200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientUnitsGet200Response call({
    Object? success = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? data = const $CopyWithPlaceholder(),
    Object? errors = const $CopyWithPlaceholder(),
  }) {
    return ClientUnitsGet200Response(
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
          : data as List<SoldUnit>?,
      errors: errors == const $CopyWithPlaceholder()
          ? _value.errors
          // ignore: cast_nullable_to_non_nullable
          : errors as Object?,
    );
  }
}

extension $ClientUnitsGet200ResponseCopyWith on ClientUnitsGet200Response {
  /// Returns a callable class that can be used as follows: `instanceOfClientUnitsGet200Response.copyWith(...)` or like so:`instanceOfClientUnitsGet200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ClientUnitsGet200ResponseCWProxy get copyWith =>
      _$ClientUnitsGet200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientUnitsGet200Response _$ClientUnitsGet200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ClientUnitsGet200Response', json, ($checkedConvert) {
  final val = ClientUnitsGet200Response(
    success: $checkedConvert('success', (v) => v as bool?),
    message: $checkedConvert('message', (v) => v as String?),
    status: $checkedConvert('status', (v) => (v as num?)?.toInt()),
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>?)
          ?.map((e) => SoldUnit.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    errors: $checkedConvert('errors', (v) => v),
  );
  return val;
});

Map<String, dynamic> _$ClientUnitsGet200ResponseToJson(
  ClientUnitsGet200Response instance,
) => <String, dynamic>{
  'success': ?instance.success,
  'message': ?instance.message,
  'status': ?instance.status,
  'data': ?instance.data?.map((e) => e.toJson()).toList(),
  'errors': ?instance.errors,
};
