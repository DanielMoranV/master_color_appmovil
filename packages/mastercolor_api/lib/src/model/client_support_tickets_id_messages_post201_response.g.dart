// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_support_tickets_id_messages_post201_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ClientSupportTicketsIdMessagesPost201ResponseCWProxy {
  ClientSupportTicketsIdMessagesPost201Response success(bool? success);

  ClientSupportTicketsIdMessagesPost201Response message(String? message);

  ClientSupportTicketsIdMessagesPost201Response status(int? status);

  ClientSupportTicketsIdMessagesPost201Response data(TicketMessage? data);

  ClientSupportTicketsIdMessagesPost201Response errors(Object? errors);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientSupportTicketsIdMessagesPost201Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientSupportTicketsIdMessagesPost201Response(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientSupportTicketsIdMessagesPost201Response call({
    bool? success,
    String? message,
    int? status,
    TicketMessage? data,
    Object? errors,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfClientSupportTicketsIdMessagesPost201Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfClientSupportTicketsIdMessagesPost201Response.copyWith.fieldName(...)`
class _$ClientSupportTicketsIdMessagesPost201ResponseCWProxyImpl
    implements _$ClientSupportTicketsIdMessagesPost201ResponseCWProxy {
  const _$ClientSupportTicketsIdMessagesPost201ResponseCWProxyImpl(this._value);

  final ClientSupportTicketsIdMessagesPost201Response _value;

  @override
  ClientSupportTicketsIdMessagesPost201Response success(bool? success) =>
      this(success: success);

  @override
  ClientSupportTicketsIdMessagesPost201Response message(String? message) =>
      this(message: message);

  @override
  ClientSupportTicketsIdMessagesPost201Response status(int? status) =>
      this(status: status);

  @override
  ClientSupportTicketsIdMessagesPost201Response data(TicketMessage? data) =>
      this(data: data);

  @override
  ClientSupportTicketsIdMessagesPost201Response errors(Object? errors) =>
      this(errors: errors);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientSupportTicketsIdMessagesPost201Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientSupportTicketsIdMessagesPost201Response(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientSupportTicketsIdMessagesPost201Response call({
    Object? success = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? data = const $CopyWithPlaceholder(),
    Object? errors = const $CopyWithPlaceholder(),
  }) {
    return ClientSupportTicketsIdMessagesPost201Response(
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
          : data as TicketMessage?,
      errors: errors == const $CopyWithPlaceholder()
          ? _value.errors
          // ignore: cast_nullable_to_non_nullable
          : errors as Object?,
    );
  }
}

extension $ClientSupportTicketsIdMessagesPost201ResponseCopyWith
    on ClientSupportTicketsIdMessagesPost201Response {
  /// Returns a callable class that can be used as follows: `instanceOfClientSupportTicketsIdMessagesPost201Response.copyWith(...)` or like so:`instanceOfClientSupportTicketsIdMessagesPost201Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ClientSupportTicketsIdMessagesPost201ResponseCWProxy get copyWith =>
      _$ClientSupportTicketsIdMessagesPost201ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientSupportTicketsIdMessagesPost201Response
_$ClientSupportTicketsIdMessagesPost201ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ClientSupportTicketsIdMessagesPost201Response', json, (
  $checkedConvert,
) {
  final val = ClientSupportTicketsIdMessagesPost201Response(
    success: $checkedConvert('success', (v) => v as bool?),
    message: $checkedConvert('message', (v) => v as String?),
    status: $checkedConvert('status', (v) => (v as num?)?.toInt()),
    data: $checkedConvert(
      'data',
      (v) =>
          v == null ? null : TicketMessage.fromJson(v as Map<String, dynamic>),
    ),
    errors: $checkedConvert('errors', (v) => v),
  );
  return val;
});

Map<String, dynamic> _$ClientSupportTicketsIdMessagesPost201ResponseToJson(
  ClientSupportTicketsIdMessagesPost201Response instance,
) => <String, dynamic>{
  'success': ?instance.success,
  'message': ?instance.message,
  'status': ?instance.status,
  'data': ?instance.data?.toJson(),
  'errors': ?instance.errors,
};
