// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_technicians_me_patch200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SupportTechniciansMePatch200ResponseCWProxy {
  SupportTechniciansMePatch200Response success(bool? success);

  SupportTechniciansMePatch200Response message(String? message);

  SupportTechniciansMePatch200Response status(int? status);

  SupportTechniciansMePatch200Response data(Technician? data);

  SupportTechniciansMePatch200Response errors(Object? errors);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SupportTechniciansMePatch200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SupportTechniciansMePatch200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  SupportTechniciansMePatch200Response call({
    bool? success,
    String? message,
    int? status,
    Technician? data,
    Object? errors,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSupportTechniciansMePatch200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSupportTechniciansMePatch200Response.copyWith.fieldName(...)`
class _$SupportTechniciansMePatch200ResponseCWProxyImpl
    implements _$SupportTechniciansMePatch200ResponseCWProxy {
  const _$SupportTechniciansMePatch200ResponseCWProxyImpl(this._value);

  final SupportTechniciansMePatch200Response _value;

  @override
  SupportTechniciansMePatch200Response success(bool? success) =>
      this(success: success);

  @override
  SupportTechniciansMePatch200Response message(String? message) =>
      this(message: message);

  @override
  SupportTechniciansMePatch200Response status(int? status) =>
      this(status: status);

  @override
  SupportTechniciansMePatch200Response data(Technician? data) =>
      this(data: data);

  @override
  SupportTechniciansMePatch200Response errors(Object? errors) =>
      this(errors: errors);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SupportTechniciansMePatch200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SupportTechniciansMePatch200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  SupportTechniciansMePatch200Response call({
    Object? success = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? data = const $CopyWithPlaceholder(),
    Object? errors = const $CopyWithPlaceholder(),
  }) {
    return SupportTechniciansMePatch200Response(
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
          : data as Technician?,
      errors: errors == const $CopyWithPlaceholder()
          ? _value.errors
          // ignore: cast_nullable_to_non_nullable
          : errors as Object?,
    );
  }
}

extension $SupportTechniciansMePatch200ResponseCopyWith
    on SupportTechniciansMePatch200Response {
  /// Returns a callable class that can be used as follows: `instanceOfSupportTechniciansMePatch200Response.copyWith(...)` or like so:`instanceOfSupportTechniciansMePatch200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SupportTechniciansMePatch200ResponseCWProxy get copyWith =>
      _$SupportTechniciansMePatch200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupportTechniciansMePatch200Response
_$SupportTechniciansMePatch200ResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SupportTechniciansMePatch200Response', json, (
      $checkedConvert,
    ) {
      final val = SupportTechniciansMePatch200Response(
        success: $checkedConvert('success', (v) => v as bool?),
        message: $checkedConvert('message', (v) => v as String?),
        status: $checkedConvert('status', (v) => (v as num?)?.toInt()),
        data: $checkedConvert(
          'data',
          (v) =>
              v == null ? null : Technician.fromJson(v as Map<String, dynamic>),
        ),
        errors: $checkedConvert('errors', (v) => v),
      );
      return val;
    });

Map<String, dynamic> _$SupportTechniciansMePatch200ResponseToJson(
  SupportTechniciansMePatch200Response instance,
) => <String, dynamic>{
  'success': ?instance.success,
  'message': ?instance.message,
  'status': ?instance.status,
  'data': ?instance.data?.toJson(),
  'errors': ?instance.errors,
};
