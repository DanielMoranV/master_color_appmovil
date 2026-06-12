// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_tickets_id_parts_post201_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SupportTicketsIdPartsPost201ResponseCWProxy {
  SupportTicketsIdPartsPost201Response success(bool? success);

  SupportTicketsIdPartsPost201Response message(String? message);

  SupportTicketsIdPartsPost201Response status(int? status);

  SupportTicketsIdPartsPost201Response data(TicketPart? data);

  SupportTicketsIdPartsPost201Response errors(Object? errors);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SupportTicketsIdPartsPost201Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SupportTicketsIdPartsPost201Response(...).copyWith(id: 12, name: "My name")
  /// ````
  SupportTicketsIdPartsPost201Response call({
    bool? success,
    String? message,
    int? status,
    TicketPart? data,
    Object? errors,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSupportTicketsIdPartsPost201Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSupportTicketsIdPartsPost201Response.copyWith.fieldName(...)`
class _$SupportTicketsIdPartsPost201ResponseCWProxyImpl
    implements _$SupportTicketsIdPartsPost201ResponseCWProxy {
  const _$SupportTicketsIdPartsPost201ResponseCWProxyImpl(this._value);

  final SupportTicketsIdPartsPost201Response _value;

  @override
  SupportTicketsIdPartsPost201Response success(bool? success) =>
      this(success: success);

  @override
  SupportTicketsIdPartsPost201Response message(String? message) =>
      this(message: message);

  @override
  SupportTicketsIdPartsPost201Response status(int? status) =>
      this(status: status);

  @override
  SupportTicketsIdPartsPost201Response data(TicketPart? data) =>
      this(data: data);

  @override
  SupportTicketsIdPartsPost201Response errors(Object? errors) =>
      this(errors: errors);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SupportTicketsIdPartsPost201Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SupportTicketsIdPartsPost201Response(...).copyWith(id: 12, name: "My name")
  /// ````
  SupportTicketsIdPartsPost201Response call({
    Object? success = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? data = const $CopyWithPlaceholder(),
    Object? errors = const $CopyWithPlaceholder(),
  }) {
    return SupportTicketsIdPartsPost201Response(
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
          : data as TicketPart?,
      errors: errors == const $CopyWithPlaceholder()
          ? _value.errors
          // ignore: cast_nullable_to_non_nullable
          : errors as Object?,
    );
  }
}

extension $SupportTicketsIdPartsPost201ResponseCopyWith
    on SupportTicketsIdPartsPost201Response {
  /// Returns a callable class that can be used as follows: `instanceOfSupportTicketsIdPartsPost201Response.copyWith(...)` or like so:`instanceOfSupportTicketsIdPartsPost201Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SupportTicketsIdPartsPost201ResponseCWProxy get copyWith =>
      _$SupportTicketsIdPartsPost201ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupportTicketsIdPartsPost201Response
_$SupportTicketsIdPartsPost201ResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SupportTicketsIdPartsPost201Response', json, (
      $checkedConvert,
    ) {
      final val = SupportTicketsIdPartsPost201Response(
        success: $checkedConvert('success', (v) => v as bool?),
        message: $checkedConvert('message', (v) => v as String?),
        status: $checkedConvert('status', (v) => (v as num?)?.toInt()),
        data: $checkedConvert(
          'data',
          (v) =>
              v == null ? null : TicketPart.fromJson(v as Map<String, dynamic>),
        ),
        errors: $checkedConvert('errors', (v) => v),
      );
      return val;
    });

Map<String, dynamic> _$SupportTicketsIdPartsPost201ResponseToJson(
  SupportTicketsIdPartsPost201Response instance,
) => <String, dynamic>{
  'success': ?instance.success,
  'message': ?instance.message,
  'status': ?instance.status,
  'data': ?instance.data?.toJson(),
  'errors': ?instance.errors,
};
