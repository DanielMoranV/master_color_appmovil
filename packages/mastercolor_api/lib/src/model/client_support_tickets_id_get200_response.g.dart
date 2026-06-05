// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_support_tickets_id_get200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ClientSupportTicketsIdGet200ResponseCWProxy {
  ClientSupportTicketsIdGet200Response success(bool? success);

  ClientSupportTicketsIdGet200Response message(String? message);

  ClientSupportTicketsIdGet200Response status(int? status);

  ClientSupportTicketsIdGet200Response data(SupportTicketDetail? data);

  ClientSupportTicketsIdGet200Response errors(Object? errors);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientSupportTicketsIdGet200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientSupportTicketsIdGet200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientSupportTicketsIdGet200Response call({
    bool? success,
    String? message,
    int? status,
    SupportTicketDetail? data,
    Object? errors,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfClientSupportTicketsIdGet200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfClientSupportTicketsIdGet200Response.copyWith.fieldName(...)`
class _$ClientSupportTicketsIdGet200ResponseCWProxyImpl
    implements _$ClientSupportTicketsIdGet200ResponseCWProxy {
  const _$ClientSupportTicketsIdGet200ResponseCWProxyImpl(this._value);

  final ClientSupportTicketsIdGet200Response _value;

  @override
  ClientSupportTicketsIdGet200Response success(bool? success) =>
      this(success: success);

  @override
  ClientSupportTicketsIdGet200Response message(String? message) =>
      this(message: message);

  @override
  ClientSupportTicketsIdGet200Response status(int? status) =>
      this(status: status);

  @override
  ClientSupportTicketsIdGet200Response data(SupportTicketDetail? data) =>
      this(data: data);

  @override
  ClientSupportTicketsIdGet200Response errors(Object? errors) =>
      this(errors: errors);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientSupportTicketsIdGet200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientSupportTicketsIdGet200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientSupportTicketsIdGet200Response call({
    Object? success = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? data = const $CopyWithPlaceholder(),
    Object? errors = const $CopyWithPlaceholder(),
  }) {
    return ClientSupportTicketsIdGet200Response(
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
          : data as SupportTicketDetail?,
      errors: errors == const $CopyWithPlaceholder()
          ? _value.errors
          // ignore: cast_nullable_to_non_nullable
          : errors as Object?,
    );
  }
}

extension $ClientSupportTicketsIdGet200ResponseCopyWith
    on ClientSupportTicketsIdGet200Response {
  /// Returns a callable class that can be used as follows: `instanceOfClientSupportTicketsIdGet200Response.copyWith(...)` or like so:`instanceOfClientSupportTicketsIdGet200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ClientSupportTicketsIdGet200ResponseCWProxy get copyWith =>
      _$ClientSupportTicketsIdGet200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientSupportTicketsIdGet200Response
_$ClientSupportTicketsIdGet200ResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ClientSupportTicketsIdGet200Response', json, (
      $checkedConvert,
    ) {
      final val = ClientSupportTicketsIdGet200Response(
        success: $checkedConvert('success', (v) => v as bool?),
        message: $checkedConvert('message', (v) => v as String?),
        status: $checkedConvert('status', (v) => (v as num?)?.toInt()),
        data: $checkedConvert(
          'data',
          (v) => v == null
              ? null
              : SupportTicketDetail.fromJson(v as Map<String, dynamic>),
        ),
        errors: $checkedConvert('errors', (v) => v),
      );
      return val;
    });

Map<String, dynamic> _$ClientSupportTicketsIdGet200ResponseToJson(
  ClientSupportTicketsIdGet200Response instance,
) => <String, dynamic>{
  'success': ?instance.success,
  'message': ?instance.message,
  'status': ?instance.status,
  'data': ?instance.data?.toJson(),
  'errors': ?instance.errors,
};
