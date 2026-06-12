// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_tickets_id_check_in_post201_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SupportTicketsIdCheckInPost201ResponseCWProxy {
  SupportTicketsIdCheckInPost201Response success(bool? success);

  SupportTicketsIdCheckInPost201Response message(String? message);

  SupportTicketsIdCheckInPost201Response status(int? status);

  SupportTicketsIdCheckInPost201Response data(TicketVisit? data);

  SupportTicketsIdCheckInPost201Response errors(Object? errors);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SupportTicketsIdCheckInPost201Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SupportTicketsIdCheckInPost201Response(...).copyWith(id: 12, name: "My name")
  /// ````
  SupportTicketsIdCheckInPost201Response call({
    bool? success,
    String? message,
    int? status,
    TicketVisit? data,
    Object? errors,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSupportTicketsIdCheckInPost201Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSupportTicketsIdCheckInPost201Response.copyWith.fieldName(...)`
class _$SupportTicketsIdCheckInPost201ResponseCWProxyImpl
    implements _$SupportTicketsIdCheckInPost201ResponseCWProxy {
  const _$SupportTicketsIdCheckInPost201ResponseCWProxyImpl(this._value);

  final SupportTicketsIdCheckInPost201Response _value;

  @override
  SupportTicketsIdCheckInPost201Response success(bool? success) =>
      this(success: success);

  @override
  SupportTicketsIdCheckInPost201Response message(String? message) =>
      this(message: message);

  @override
  SupportTicketsIdCheckInPost201Response status(int? status) =>
      this(status: status);

  @override
  SupportTicketsIdCheckInPost201Response data(TicketVisit? data) =>
      this(data: data);

  @override
  SupportTicketsIdCheckInPost201Response errors(Object? errors) =>
      this(errors: errors);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SupportTicketsIdCheckInPost201Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SupportTicketsIdCheckInPost201Response(...).copyWith(id: 12, name: "My name")
  /// ````
  SupportTicketsIdCheckInPost201Response call({
    Object? success = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? data = const $CopyWithPlaceholder(),
    Object? errors = const $CopyWithPlaceholder(),
  }) {
    return SupportTicketsIdCheckInPost201Response(
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
          : data as TicketVisit?,
      errors: errors == const $CopyWithPlaceholder()
          ? _value.errors
          // ignore: cast_nullable_to_non_nullable
          : errors as Object?,
    );
  }
}

extension $SupportTicketsIdCheckInPost201ResponseCopyWith
    on SupportTicketsIdCheckInPost201Response {
  /// Returns a callable class that can be used as follows: `instanceOfSupportTicketsIdCheckInPost201Response.copyWith(...)` or like so:`instanceOfSupportTicketsIdCheckInPost201Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SupportTicketsIdCheckInPost201ResponseCWProxy get copyWith =>
      _$SupportTicketsIdCheckInPost201ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupportTicketsIdCheckInPost201Response
_$SupportTicketsIdCheckInPost201ResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SupportTicketsIdCheckInPost201Response', json, (
      $checkedConvert,
    ) {
      final val = SupportTicketsIdCheckInPost201Response(
        success: $checkedConvert('success', (v) => v as bool?),
        message: $checkedConvert('message', (v) => v as String?),
        status: $checkedConvert('status', (v) => (v as num?)?.toInt()),
        data: $checkedConvert(
          'data',
          (v) => v == null
              ? null
              : TicketVisit.fromJson(v as Map<String, dynamic>),
        ),
        errors: $checkedConvert('errors', (v) => v),
      );
      return val;
    });

Map<String, dynamic> _$SupportTicketsIdCheckInPost201ResponseToJson(
  SupportTicketsIdCheckInPost201Response instance,
) => <String, dynamic>{
  'success': ?instance.success,
  'message': ?instance.message,
  'status': ?instance.status,
  'data': ?instance.data?.toJson(),
  'errors': ?instance.errors,
};
