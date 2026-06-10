// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_technicians_get200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SupportTechniciansGet200ResponseCWProxy {
  SupportTechniciansGet200Response success(bool? success);

  SupportTechniciansGet200Response message(String? message);

  SupportTechniciansGet200Response status(int? status);

  SupportTechniciansGet200Response data(List<Technician>? data);

  SupportTechniciansGet200Response errors(Object? errors);

  SupportTechniciansGet200Response pagination(Pagination? pagination);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SupportTechniciansGet200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SupportTechniciansGet200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  SupportTechniciansGet200Response call({
    bool? success,
    String? message,
    int? status,
    List<Technician>? data,
    Object? errors,
    Pagination? pagination,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSupportTechniciansGet200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSupportTechniciansGet200Response.copyWith.fieldName(...)`
class _$SupportTechniciansGet200ResponseCWProxyImpl
    implements _$SupportTechniciansGet200ResponseCWProxy {
  const _$SupportTechniciansGet200ResponseCWProxyImpl(this._value);

  final SupportTechniciansGet200Response _value;

  @override
  SupportTechniciansGet200Response success(bool? success) =>
      this(success: success);

  @override
  SupportTechniciansGet200Response message(String? message) =>
      this(message: message);

  @override
  SupportTechniciansGet200Response status(int? status) => this(status: status);

  @override
  SupportTechniciansGet200Response data(List<Technician>? data) =>
      this(data: data);

  @override
  SupportTechniciansGet200Response errors(Object? errors) =>
      this(errors: errors);

  @override
  SupportTechniciansGet200Response pagination(Pagination? pagination) =>
      this(pagination: pagination);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SupportTechniciansGet200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SupportTechniciansGet200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  SupportTechniciansGet200Response call({
    Object? success = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? data = const $CopyWithPlaceholder(),
    Object? errors = const $CopyWithPlaceholder(),
    Object? pagination = const $CopyWithPlaceholder(),
  }) {
    return SupportTechniciansGet200Response(
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
          : data as List<Technician>?,
      errors: errors == const $CopyWithPlaceholder()
          ? _value.errors
          // ignore: cast_nullable_to_non_nullable
          : errors as Object?,
      pagination: pagination == const $CopyWithPlaceholder()
          ? _value.pagination
          // ignore: cast_nullable_to_non_nullable
          : pagination as Pagination?,
    );
  }
}

extension $SupportTechniciansGet200ResponseCopyWith
    on SupportTechniciansGet200Response {
  /// Returns a callable class that can be used as follows: `instanceOfSupportTechniciansGet200Response.copyWith(...)` or like so:`instanceOfSupportTechniciansGet200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SupportTechniciansGet200ResponseCWProxy get copyWith =>
      _$SupportTechniciansGet200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupportTechniciansGet200Response _$SupportTechniciansGet200ResponseFromJson(
  Map<String, dynamic> json,
) =>
    $checkedCreate('SupportTechniciansGet200Response', json, ($checkedConvert) {
      final val = SupportTechniciansGet200Response(
        success: $checkedConvert('success', (v) => v as bool?),
        message: $checkedConvert('message', (v) => v as String?),
        status: $checkedConvert('status', (v) => (v as num?)?.toInt()),
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>?)
              ?.map((e) => Technician.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        errors: $checkedConvert('errors', (v) => v),
        pagination: $checkedConvert(
          'pagination',
          (v) =>
              v == null ? null : Pagination.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$SupportTechniciansGet200ResponseToJson(
  SupportTechniciansGet200Response instance,
) => <String, dynamic>{
  'success': ?instance.success,
  'message': ?instance.message,
  'status': ?instance.status,
  'data': ?instance.data?.map((e) => e.toJson()).toList(),
  'errors': ?instance.errors,
  'pagination': ?instance.pagination?.toJson(),
};
