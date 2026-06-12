// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_parts_get200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SupportPartsGet200ResponseCWProxy {
  SupportPartsGet200Response success(bool? success);

  SupportPartsGet200Response message(String? message);

  SupportPartsGet200Response status(int? status);

  SupportPartsGet200Response data(
    List<SupportPartsGet200ResponseAllOfDataInner>? data,
  );

  SupportPartsGet200Response errors(Object? errors);

  SupportPartsGet200Response pagination(Pagination? pagination);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SupportPartsGet200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SupportPartsGet200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  SupportPartsGet200Response call({
    bool? success,
    String? message,
    int? status,
    List<SupportPartsGet200ResponseAllOfDataInner>? data,
    Object? errors,
    Pagination? pagination,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSupportPartsGet200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSupportPartsGet200Response.copyWith.fieldName(...)`
class _$SupportPartsGet200ResponseCWProxyImpl
    implements _$SupportPartsGet200ResponseCWProxy {
  const _$SupportPartsGet200ResponseCWProxyImpl(this._value);

  final SupportPartsGet200Response _value;

  @override
  SupportPartsGet200Response success(bool? success) => this(success: success);

  @override
  SupportPartsGet200Response message(String? message) => this(message: message);

  @override
  SupportPartsGet200Response status(int? status) => this(status: status);

  @override
  SupportPartsGet200Response data(
    List<SupportPartsGet200ResponseAllOfDataInner>? data,
  ) => this(data: data);

  @override
  SupportPartsGet200Response errors(Object? errors) => this(errors: errors);

  @override
  SupportPartsGet200Response pagination(Pagination? pagination) =>
      this(pagination: pagination);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SupportPartsGet200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SupportPartsGet200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  SupportPartsGet200Response call({
    Object? success = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? data = const $CopyWithPlaceholder(),
    Object? errors = const $CopyWithPlaceholder(),
    Object? pagination = const $CopyWithPlaceholder(),
  }) {
    return SupportPartsGet200Response(
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
          : data as List<SupportPartsGet200ResponseAllOfDataInner>?,
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

extension $SupportPartsGet200ResponseCopyWith on SupportPartsGet200Response {
  /// Returns a callable class that can be used as follows: `instanceOfSupportPartsGet200Response.copyWith(...)` or like so:`instanceOfSupportPartsGet200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SupportPartsGet200ResponseCWProxy get copyWith =>
      _$SupportPartsGet200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupportPartsGet200Response _$SupportPartsGet200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SupportPartsGet200Response', json, ($checkedConvert) {
  final val = SupportPartsGet200Response(
    success: $checkedConvert('success', (v) => v as bool?),
    message: $checkedConvert('message', (v) => v as String?),
    status: $checkedConvert('status', (v) => (v as num?)?.toInt()),
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>?)
          ?.map(
            (e) => SupportPartsGet200ResponseAllOfDataInner.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    ),
    errors: $checkedConvert('errors', (v) => v),
    pagination: $checkedConvert(
      'pagination',
      (v) => v == null ? null : Pagination.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$SupportPartsGet200ResponseToJson(
  SupportPartsGet200Response instance,
) => <String, dynamic>{
  'success': ?instance.success,
  'message': ?instance.message,
  'status': ?instance.status,
  'data': ?instance.data?.map((e) => e.toJson()).toList(),
  'errors': ?instance.errors,
  'pagination': ?instance.pagination?.toJson(),
};
