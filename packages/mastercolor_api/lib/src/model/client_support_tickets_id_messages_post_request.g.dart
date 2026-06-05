// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_support_tickets_id_messages_post_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ClientSupportTicketsIdMessagesPostRequestCWProxy {
  ClientSupportTicketsIdMessagesPostRequest body(String body);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientSupportTicketsIdMessagesPostRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientSupportTicketsIdMessagesPostRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientSupportTicketsIdMessagesPostRequest call({String body});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfClientSupportTicketsIdMessagesPostRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfClientSupportTicketsIdMessagesPostRequest.copyWith.fieldName(...)`
class _$ClientSupportTicketsIdMessagesPostRequestCWProxyImpl
    implements _$ClientSupportTicketsIdMessagesPostRequestCWProxy {
  const _$ClientSupportTicketsIdMessagesPostRequestCWProxyImpl(this._value);

  final ClientSupportTicketsIdMessagesPostRequest _value;

  @override
  ClientSupportTicketsIdMessagesPostRequest body(String body) =>
      this(body: body);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientSupportTicketsIdMessagesPostRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientSupportTicketsIdMessagesPostRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientSupportTicketsIdMessagesPostRequest call({
    Object? body = const $CopyWithPlaceholder(),
  }) {
    return ClientSupportTicketsIdMessagesPostRequest(
      body: body == const $CopyWithPlaceholder()
          ? _value.body
          // ignore: cast_nullable_to_non_nullable
          : body as String,
    );
  }
}

extension $ClientSupportTicketsIdMessagesPostRequestCopyWith
    on ClientSupportTicketsIdMessagesPostRequest {
  /// Returns a callable class that can be used as follows: `instanceOfClientSupportTicketsIdMessagesPostRequest.copyWith(...)` or like so:`instanceOfClientSupportTicketsIdMessagesPostRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ClientSupportTicketsIdMessagesPostRequestCWProxy get copyWith =>
      _$ClientSupportTicketsIdMessagesPostRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientSupportTicketsIdMessagesPostRequest
_$ClientSupportTicketsIdMessagesPostRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ClientSupportTicketsIdMessagesPostRequest', json, (
  $checkedConvert,
) {
  $checkKeys(json, requiredKeys: const ['body']);
  final val = ClientSupportTicketsIdMessagesPostRequest(
    body: $checkedConvert('body', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$ClientSupportTicketsIdMessagesPostRequestToJson(
  ClientSupportTicketsIdMessagesPostRequest instance,
) => <String, dynamic>{'body': instance.body};
