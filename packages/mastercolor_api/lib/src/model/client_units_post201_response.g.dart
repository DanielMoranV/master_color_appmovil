// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_units_post201_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ClientUnitsPost201ResponseCWProxy {
  ClientUnitsPost201Response success(bool? success);

  ClientUnitsPost201Response message(String? message);

  ClientUnitsPost201Response status(int? status);

  ClientUnitsPost201Response data(SoldUnit? data);

  ClientUnitsPost201Response errors(Object? errors);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientUnitsPost201Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientUnitsPost201Response(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientUnitsPost201Response call({
    bool? success,
    String? message,
    int? status,
    SoldUnit? data,
    Object? errors,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfClientUnitsPost201Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfClientUnitsPost201Response.copyWith.fieldName(...)`
class _$ClientUnitsPost201ResponseCWProxyImpl
    implements _$ClientUnitsPost201ResponseCWProxy {
  const _$ClientUnitsPost201ResponseCWProxyImpl(this._value);

  final ClientUnitsPost201Response _value;

  @override
  ClientUnitsPost201Response success(bool? success) => this(success: success);

  @override
  ClientUnitsPost201Response message(String? message) => this(message: message);

  @override
  ClientUnitsPost201Response status(int? status) => this(status: status);

  @override
  ClientUnitsPost201Response data(SoldUnit? data) => this(data: data);

  @override
  ClientUnitsPost201Response errors(Object? errors) => this(errors: errors);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientUnitsPost201Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientUnitsPost201Response(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientUnitsPost201Response call({
    Object? success = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? data = const $CopyWithPlaceholder(),
    Object? errors = const $CopyWithPlaceholder(),
  }) {
    return ClientUnitsPost201Response(
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
          : data as SoldUnit?,
      errors: errors == const $CopyWithPlaceholder()
          ? _value.errors
          // ignore: cast_nullable_to_non_nullable
          : errors as Object?,
    );
  }
}

extension $ClientUnitsPost201ResponseCopyWith on ClientUnitsPost201Response {
  /// Returns a callable class that can be used as follows: `instanceOfClientUnitsPost201Response.copyWith(...)` or like so:`instanceOfClientUnitsPost201Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ClientUnitsPost201ResponseCWProxy get copyWith =>
      _$ClientUnitsPost201ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientUnitsPost201Response _$ClientUnitsPost201ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ClientUnitsPost201Response', json, ($checkedConvert) {
  final val = ClientUnitsPost201Response(
    success: $checkedConvert('success', (v) => v as bool?),
    message: $checkedConvert('message', (v) => v as String?),
    status: $checkedConvert('status', (v) => (v as num?)?.toInt()),
    data: $checkedConvert(
      'data',
      (v) => v == null ? null : SoldUnit.fromJson(v as Map<String, dynamic>),
    ),
    errors: $checkedConvert('errors', (v) => v),
  );
  return val;
});

Map<String, dynamic> _$ClientUnitsPost201ResponseToJson(
  ClientUnitsPost201Response instance,
) => <String, dynamic>{
  'success': ?instance.success,
  'message': ?instance.message,
  'status': ?instance.status,
  'data': ?instance.data?.toJson(),
  'errors': ?instance.errors,
};
