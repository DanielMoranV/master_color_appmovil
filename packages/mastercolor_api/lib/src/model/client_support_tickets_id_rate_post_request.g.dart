// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_support_tickets_id_rate_post_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ClientSupportTicketsIdRatePostRequestCWProxy {
  ClientSupportTicketsIdRatePostRequest rating(int rating);

  ClientSupportTicketsIdRatePostRequest comment(String? comment);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientSupportTicketsIdRatePostRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientSupportTicketsIdRatePostRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientSupportTicketsIdRatePostRequest call({int rating, String? comment});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfClientSupportTicketsIdRatePostRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfClientSupportTicketsIdRatePostRequest.copyWith.fieldName(...)`
class _$ClientSupportTicketsIdRatePostRequestCWProxyImpl
    implements _$ClientSupportTicketsIdRatePostRequestCWProxy {
  const _$ClientSupportTicketsIdRatePostRequestCWProxyImpl(this._value);

  final ClientSupportTicketsIdRatePostRequest _value;

  @override
  ClientSupportTicketsIdRatePostRequest rating(int rating) =>
      this(rating: rating);

  @override
  ClientSupportTicketsIdRatePostRequest comment(String? comment) =>
      this(comment: comment);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientSupportTicketsIdRatePostRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientSupportTicketsIdRatePostRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientSupportTicketsIdRatePostRequest call({
    Object? rating = const $CopyWithPlaceholder(),
    Object? comment = const $CopyWithPlaceholder(),
  }) {
    return ClientSupportTicketsIdRatePostRequest(
      rating: rating == const $CopyWithPlaceholder()
          ? _value.rating
          // ignore: cast_nullable_to_non_nullable
          : rating as int,
      comment: comment == const $CopyWithPlaceholder()
          ? _value.comment
          // ignore: cast_nullable_to_non_nullable
          : comment as String?,
    );
  }
}

extension $ClientSupportTicketsIdRatePostRequestCopyWith
    on ClientSupportTicketsIdRatePostRequest {
  /// Returns a callable class that can be used as follows: `instanceOfClientSupportTicketsIdRatePostRequest.copyWith(...)` or like so:`instanceOfClientSupportTicketsIdRatePostRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ClientSupportTicketsIdRatePostRequestCWProxy get copyWith =>
      _$ClientSupportTicketsIdRatePostRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientSupportTicketsIdRatePostRequest
_$ClientSupportTicketsIdRatePostRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ClientSupportTicketsIdRatePostRequest', json, (
      $checkedConvert,
    ) {
      $checkKeys(json, requiredKeys: const ['rating']);
      final val = ClientSupportTicketsIdRatePostRequest(
        rating: $checkedConvert('rating', (v) => (v as num).toInt()),
        comment: $checkedConvert('comment', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$ClientSupportTicketsIdRatePostRequestToJson(
  ClientSupportTicketsIdRatePostRequest instance,
) => <String, dynamic>{'rating': instance.rating, 'comment': ?instance.comment};
