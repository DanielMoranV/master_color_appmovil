// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_tickets_id_messages_post_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SupportTicketsIdMessagesPostRequestCWProxy {
  SupportTicketsIdMessagesPostRequest body(String body);

  SupportTicketsIdMessagesPostRequest isInternal(bool? isInternal);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SupportTicketsIdMessagesPostRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SupportTicketsIdMessagesPostRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  SupportTicketsIdMessagesPostRequest call({String body, bool? isInternal});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSupportTicketsIdMessagesPostRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSupportTicketsIdMessagesPostRequest.copyWith.fieldName(...)`
class _$SupportTicketsIdMessagesPostRequestCWProxyImpl
    implements _$SupportTicketsIdMessagesPostRequestCWProxy {
  const _$SupportTicketsIdMessagesPostRequestCWProxyImpl(this._value);

  final SupportTicketsIdMessagesPostRequest _value;

  @override
  SupportTicketsIdMessagesPostRequest body(String body) => this(body: body);

  @override
  SupportTicketsIdMessagesPostRequest isInternal(bool? isInternal) =>
      this(isInternal: isInternal);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SupportTicketsIdMessagesPostRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SupportTicketsIdMessagesPostRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  SupportTicketsIdMessagesPostRequest call({
    Object? body = const $CopyWithPlaceholder(),
    Object? isInternal = const $CopyWithPlaceholder(),
  }) {
    return SupportTicketsIdMessagesPostRequest(
      body: body == const $CopyWithPlaceholder()
          ? _value.body
          // ignore: cast_nullable_to_non_nullable
          : body as String,
      isInternal: isInternal == const $CopyWithPlaceholder()
          ? _value.isInternal
          // ignore: cast_nullable_to_non_nullable
          : isInternal as bool?,
    );
  }
}

extension $SupportTicketsIdMessagesPostRequestCopyWith
    on SupportTicketsIdMessagesPostRequest {
  /// Returns a callable class that can be used as follows: `instanceOfSupportTicketsIdMessagesPostRequest.copyWith(...)` or like so:`instanceOfSupportTicketsIdMessagesPostRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SupportTicketsIdMessagesPostRequestCWProxy get copyWith =>
      _$SupportTicketsIdMessagesPostRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupportTicketsIdMessagesPostRequest
_$SupportTicketsIdMessagesPostRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SupportTicketsIdMessagesPostRequest',
      json,
      ($checkedConvert) {
        $checkKeys(json, requiredKeys: const ['body']);
        final val = SupportTicketsIdMessagesPostRequest(
          body: $checkedConvert('body', (v) => v as String),
          isInternal: $checkedConvert(
            'is_internal',
            (v) => v as bool? ?? false,
          ),
        );
        return val;
      },
      fieldKeyMap: const {'isInternal': 'is_internal'},
    );

Map<String, dynamic> _$SupportTicketsIdMessagesPostRequestToJson(
  SupportTicketsIdMessagesPostRequest instance,
) => <String, dynamic>{
  'body': instance.body,
  'is_internal': ?instance.isInternal,
};
