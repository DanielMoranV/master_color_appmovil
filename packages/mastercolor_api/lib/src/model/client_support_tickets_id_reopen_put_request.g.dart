// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_support_tickets_id_reopen_put_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ClientSupportTicketsIdReopenPutRequestCWProxy {
  ClientSupportTicketsIdReopenPutRequest reason(String reason);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientSupportTicketsIdReopenPutRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientSupportTicketsIdReopenPutRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientSupportTicketsIdReopenPutRequest call({String reason});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfClientSupportTicketsIdReopenPutRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfClientSupportTicketsIdReopenPutRequest.copyWith.fieldName(...)`
class _$ClientSupportTicketsIdReopenPutRequestCWProxyImpl
    implements _$ClientSupportTicketsIdReopenPutRequestCWProxy {
  const _$ClientSupportTicketsIdReopenPutRequestCWProxyImpl(this._value);

  final ClientSupportTicketsIdReopenPutRequest _value;

  @override
  ClientSupportTicketsIdReopenPutRequest reason(String reason) =>
      this(reason: reason);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientSupportTicketsIdReopenPutRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientSupportTicketsIdReopenPutRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientSupportTicketsIdReopenPutRequest call({
    Object? reason = const $CopyWithPlaceholder(),
  }) {
    return ClientSupportTicketsIdReopenPutRequest(
      reason: reason == const $CopyWithPlaceholder()
          ? _value.reason
          // ignore: cast_nullable_to_non_nullable
          : reason as String,
    );
  }
}

extension $ClientSupportTicketsIdReopenPutRequestCopyWith
    on ClientSupportTicketsIdReopenPutRequest {
  /// Returns a callable class that can be used as follows: `instanceOfClientSupportTicketsIdReopenPutRequest.copyWith(...)` or like so:`instanceOfClientSupportTicketsIdReopenPutRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ClientSupportTicketsIdReopenPutRequestCWProxy get copyWith =>
      _$ClientSupportTicketsIdReopenPutRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientSupportTicketsIdReopenPutRequest
_$ClientSupportTicketsIdReopenPutRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ClientSupportTicketsIdReopenPutRequest', json, (
      $checkedConvert,
    ) {
      $checkKeys(json, requiredKeys: const ['reason']);
      final val = ClientSupportTicketsIdReopenPutRequest(
        reason: $checkedConvert('reason', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$ClientSupportTicketsIdReopenPutRequestToJson(
  ClientSupportTicketsIdReopenPutRequest instance,
) => <String, dynamic>{'reason': instance.reason};
