// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_units_id_get200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ClientUnitsIdGet200ResponseCWProxy {
  ClientUnitsIdGet200Response success(bool? success);

  ClientUnitsIdGet200Response message(String? message);

  ClientUnitsIdGet200Response status(int? status);

  ClientUnitsIdGet200Response data(SoldUnitDetail? data);

  ClientUnitsIdGet200Response errors(Object? errors);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientUnitsIdGet200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientUnitsIdGet200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientUnitsIdGet200Response call({
    bool? success,
    String? message,
    int? status,
    SoldUnitDetail? data,
    Object? errors,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfClientUnitsIdGet200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfClientUnitsIdGet200Response.copyWith.fieldName(...)`
class _$ClientUnitsIdGet200ResponseCWProxyImpl
    implements _$ClientUnitsIdGet200ResponseCWProxy {
  const _$ClientUnitsIdGet200ResponseCWProxyImpl(this._value);

  final ClientUnitsIdGet200Response _value;

  @override
  ClientUnitsIdGet200Response success(bool? success) => this(success: success);

  @override
  ClientUnitsIdGet200Response message(String? message) =>
      this(message: message);

  @override
  ClientUnitsIdGet200Response status(int? status) => this(status: status);

  @override
  ClientUnitsIdGet200Response data(SoldUnitDetail? data) => this(data: data);

  @override
  ClientUnitsIdGet200Response errors(Object? errors) => this(errors: errors);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientUnitsIdGet200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientUnitsIdGet200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientUnitsIdGet200Response call({
    Object? success = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? data = const $CopyWithPlaceholder(),
    Object? errors = const $CopyWithPlaceholder(),
  }) {
    return ClientUnitsIdGet200Response(
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
          : data as SoldUnitDetail?,
      errors: errors == const $CopyWithPlaceholder()
          ? _value.errors
          // ignore: cast_nullable_to_non_nullable
          : errors as Object?,
    );
  }
}

extension $ClientUnitsIdGet200ResponseCopyWith on ClientUnitsIdGet200Response {
  /// Returns a callable class that can be used as follows: `instanceOfClientUnitsIdGet200Response.copyWith(...)` or like so:`instanceOfClientUnitsIdGet200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ClientUnitsIdGet200ResponseCWProxy get copyWith =>
      _$ClientUnitsIdGet200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientUnitsIdGet200Response _$ClientUnitsIdGet200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ClientUnitsIdGet200Response', json, ($checkedConvert) {
  final val = ClientUnitsIdGet200Response(
    success: $checkedConvert('success', (v) => v as bool?),
    message: $checkedConvert('message', (v) => v as String?),
    status: $checkedConvert('status', (v) => (v as num?)?.toInt()),
    data: $checkedConvert(
      'data',
      (v) =>
          v == null ? null : SoldUnitDetail.fromJson(v as Map<String, dynamic>),
    ),
    errors: $checkedConvert('errors', (v) => v),
  );
  return val;
});

Map<String, dynamic> _$ClientUnitsIdGet200ResponseToJson(
  ClientUnitsIdGet200Response instance,
) => <String, dynamic>{
  'success': ?instance.success,
  'message': ?instance.message,
  'status': ?instance.status,
  'data': ?instance.data?.toJson(),
  'errors': ?instance.errors,
};
