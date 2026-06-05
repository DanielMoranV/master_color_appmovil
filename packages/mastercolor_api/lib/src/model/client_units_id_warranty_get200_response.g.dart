// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_units_id_warranty_get200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ClientUnitsIdWarrantyGet200ResponseCWProxy {
  ClientUnitsIdWarrantyGet200Response success(bool? success);

  ClientUnitsIdWarrantyGet200Response message(String? message);

  ClientUnitsIdWarrantyGet200Response status(int? status);

  ClientUnitsIdWarrantyGet200Response data(Warranty? data);

  ClientUnitsIdWarrantyGet200Response errors(Object? errors);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientUnitsIdWarrantyGet200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientUnitsIdWarrantyGet200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientUnitsIdWarrantyGet200Response call({
    bool? success,
    String? message,
    int? status,
    Warranty? data,
    Object? errors,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfClientUnitsIdWarrantyGet200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfClientUnitsIdWarrantyGet200Response.copyWith.fieldName(...)`
class _$ClientUnitsIdWarrantyGet200ResponseCWProxyImpl
    implements _$ClientUnitsIdWarrantyGet200ResponseCWProxy {
  const _$ClientUnitsIdWarrantyGet200ResponseCWProxyImpl(this._value);

  final ClientUnitsIdWarrantyGet200Response _value;

  @override
  ClientUnitsIdWarrantyGet200Response success(bool? success) =>
      this(success: success);

  @override
  ClientUnitsIdWarrantyGet200Response message(String? message) =>
      this(message: message);

  @override
  ClientUnitsIdWarrantyGet200Response status(int? status) =>
      this(status: status);

  @override
  ClientUnitsIdWarrantyGet200Response data(Warranty? data) => this(data: data);

  @override
  ClientUnitsIdWarrantyGet200Response errors(Object? errors) =>
      this(errors: errors);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientUnitsIdWarrantyGet200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientUnitsIdWarrantyGet200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientUnitsIdWarrantyGet200Response call({
    Object? success = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? data = const $CopyWithPlaceholder(),
    Object? errors = const $CopyWithPlaceholder(),
  }) {
    return ClientUnitsIdWarrantyGet200Response(
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
          : data as Warranty?,
      errors: errors == const $CopyWithPlaceholder()
          ? _value.errors
          // ignore: cast_nullable_to_non_nullable
          : errors as Object?,
    );
  }
}

extension $ClientUnitsIdWarrantyGet200ResponseCopyWith
    on ClientUnitsIdWarrantyGet200Response {
  /// Returns a callable class that can be used as follows: `instanceOfClientUnitsIdWarrantyGet200Response.copyWith(...)` or like so:`instanceOfClientUnitsIdWarrantyGet200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ClientUnitsIdWarrantyGet200ResponseCWProxy get copyWith =>
      _$ClientUnitsIdWarrantyGet200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientUnitsIdWarrantyGet200Response
_$ClientUnitsIdWarrantyGet200ResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ClientUnitsIdWarrantyGet200Response', json, (
      $checkedConvert,
    ) {
      final val = ClientUnitsIdWarrantyGet200Response(
        success: $checkedConvert('success', (v) => v as bool?),
        message: $checkedConvert('message', (v) => v as String?),
        status: $checkedConvert('status', (v) => (v as num?)?.toInt()),
        data: $checkedConvert(
          'data',
          (v) =>
              v == null ? null : Warranty.fromJson(v as Map<String, dynamic>),
        ),
        errors: $checkedConvert('errors', (v) => v),
      );
      return val;
    });

Map<String, dynamic> _$ClientUnitsIdWarrantyGet200ResponseToJson(
  ClientUnitsIdWarrantyGet200Response instance,
) => <String, dynamic>{
  'success': ?instance.success,
  'message': ?instance.message,
  'status': ?instance.status,
  'data': ?instance.data?.toJson(),
  'errors': ?instance.errors,
};
