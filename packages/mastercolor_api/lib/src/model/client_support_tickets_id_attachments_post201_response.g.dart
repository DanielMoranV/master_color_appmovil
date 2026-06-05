// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_support_tickets_id_attachments_post201_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ClientSupportTicketsIdAttachmentsPost201ResponseCWProxy {
  ClientSupportTicketsIdAttachmentsPost201Response success(bool? success);

  ClientSupportTicketsIdAttachmentsPost201Response message(String? message);

  ClientSupportTicketsIdAttachmentsPost201Response status(int? status);

  ClientSupportTicketsIdAttachmentsPost201Response data(
    List<TicketAttachment>? data,
  );

  ClientSupportTicketsIdAttachmentsPost201Response errors(Object? errors);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientSupportTicketsIdAttachmentsPost201Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientSupportTicketsIdAttachmentsPost201Response(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientSupportTicketsIdAttachmentsPost201Response call({
    bool? success,
    String? message,
    int? status,
    List<TicketAttachment>? data,
    Object? errors,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfClientSupportTicketsIdAttachmentsPost201Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfClientSupportTicketsIdAttachmentsPost201Response.copyWith.fieldName(...)`
class _$ClientSupportTicketsIdAttachmentsPost201ResponseCWProxyImpl
    implements _$ClientSupportTicketsIdAttachmentsPost201ResponseCWProxy {
  const _$ClientSupportTicketsIdAttachmentsPost201ResponseCWProxyImpl(
    this._value,
  );

  final ClientSupportTicketsIdAttachmentsPost201Response _value;

  @override
  ClientSupportTicketsIdAttachmentsPost201Response success(bool? success) =>
      this(success: success);

  @override
  ClientSupportTicketsIdAttachmentsPost201Response message(String? message) =>
      this(message: message);

  @override
  ClientSupportTicketsIdAttachmentsPost201Response status(int? status) =>
      this(status: status);

  @override
  ClientSupportTicketsIdAttachmentsPost201Response data(
    List<TicketAttachment>? data,
  ) => this(data: data);

  @override
  ClientSupportTicketsIdAttachmentsPost201Response errors(Object? errors) =>
      this(errors: errors);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientSupportTicketsIdAttachmentsPost201Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientSupportTicketsIdAttachmentsPost201Response(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientSupportTicketsIdAttachmentsPost201Response call({
    Object? success = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? data = const $CopyWithPlaceholder(),
    Object? errors = const $CopyWithPlaceholder(),
  }) {
    return ClientSupportTicketsIdAttachmentsPost201Response(
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
          : data as List<TicketAttachment>?,
      errors: errors == const $CopyWithPlaceholder()
          ? _value.errors
          // ignore: cast_nullable_to_non_nullable
          : errors as Object?,
    );
  }
}

extension $ClientSupportTicketsIdAttachmentsPost201ResponseCopyWith
    on ClientSupportTicketsIdAttachmentsPost201Response {
  /// Returns a callable class that can be used as follows: `instanceOfClientSupportTicketsIdAttachmentsPost201Response.copyWith(...)` or like so:`instanceOfClientSupportTicketsIdAttachmentsPost201Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ClientSupportTicketsIdAttachmentsPost201ResponseCWProxy get copyWith =>
      _$ClientSupportTicketsIdAttachmentsPost201ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientSupportTicketsIdAttachmentsPost201Response
_$ClientSupportTicketsIdAttachmentsPost201ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ClientSupportTicketsIdAttachmentsPost201Response', json, (
  $checkedConvert,
) {
  final val = ClientSupportTicketsIdAttachmentsPost201Response(
    success: $checkedConvert('success', (v) => v as bool?),
    message: $checkedConvert('message', (v) => v as String?),
    status: $checkedConvert('status', (v) => (v as num?)?.toInt()),
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>?)
          ?.map((e) => TicketAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    errors: $checkedConvert('errors', (v) => v),
  );
  return val;
});

Map<String, dynamic> _$ClientSupportTicketsIdAttachmentsPost201ResponseToJson(
  ClientSupportTicketsIdAttachmentsPost201Response instance,
) => <String, dynamic>{
  'success': ?instance.success,
  'message': ?instance.message,
  'status': ?instance.status,
  'data': ?instance.data?.map((e) => e.toJson()).toList(),
  'errors': ?instance.errors,
};
