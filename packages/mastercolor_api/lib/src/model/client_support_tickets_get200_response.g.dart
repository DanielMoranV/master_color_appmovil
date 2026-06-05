// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_support_tickets_get200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ClientSupportTicketsGet200ResponseCWProxy {
  ClientSupportTicketsGet200Response success(bool? success);

  ClientSupportTicketsGet200Response message(String? message);

  ClientSupportTicketsGet200Response status(int? status);

  ClientSupportTicketsGet200Response data(List<SupportTicket>? data);

  ClientSupportTicketsGet200Response errors(Object? errors);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientSupportTicketsGet200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientSupportTicketsGet200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientSupportTicketsGet200Response call({
    bool? success,
    String? message,
    int? status,
    List<SupportTicket>? data,
    Object? errors,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfClientSupportTicketsGet200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfClientSupportTicketsGet200Response.copyWith.fieldName(...)`
class _$ClientSupportTicketsGet200ResponseCWProxyImpl
    implements _$ClientSupportTicketsGet200ResponseCWProxy {
  const _$ClientSupportTicketsGet200ResponseCWProxyImpl(this._value);

  final ClientSupportTicketsGet200Response _value;

  @override
  ClientSupportTicketsGet200Response success(bool? success) =>
      this(success: success);

  @override
  ClientSupportTicketsGet200Response message(String? message) =>
      this(message: message);

  @override
  ClientSupportTicketsGet200Response status(int? status) =>
      this(status: status);

  @override
  ClientSupportTicketsGet200Response data(List<SupportTicket>? data) =>
      this(data: data);

  @override
  ClientSupportTicketsGet200Response errors(Object? errors) =>
      this(errors: errors);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientSupportTicketsGet200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientSupportTicketsGet200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientSupportTicketsGet200Response call({
    Object? success = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? data = const $CopyWithPlaceholder(),
    Object? errors = const $CopyWithPlaceholder(),
  }) {
    return ClientSupportTicketsGet200Response(
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
          : data as List<SupportTicket>?,
      errors: errors == const $CopyWithPlaceholder()
          ? _value.errors
          // ignore: cast_nullable_to_non_nullable
          : errors as Object?,
    );
  }
}

extension $ClientSupportTicketsGet200ResponseCopyWith
    on ClientSupportTicketsGet200Response {
  /// Returns a callable class that can be used as follows: `instanceOfClientSupportTicketsGet200Response.copyWith(...)` or like so:`instanceOfClientSupportTicketsGet200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ClientSupportTicketsGet200ResponseCWProxy get copyWith =>
      _$ClientSupportTicketsGet200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientSupportTicketsGet200Response _$ClientSupportTicketsGet200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ClientSupportTicketsGet200Response', json, (
  $checkedConvert,
) {
  final val = ClientSupportTicketsGet200Response(
    success: $checkedConvert('success', (v) => v as bool?),
    message: $checkedConvert('message', (v) => v as String?),
    status: $checkedConvert('status', (v) => (v as num?)?.toInt()),
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>?)
          ?.map((e) => SupportTicket.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    errors: $checkedConvert('errors', (v) => v),
  );
  return val;
});

Map<String, dynamic> _$ClientSupportTicketsGet200ResponseToJson(
  ClientSupportTicketsGet200Response instance,
) => <String, dynamic>{
  'success': ?instance.success,
  'message': ?instance.message,
  'status': ?instance.status,
  'data': ?instance.data?.map((e) => e.toJson()).toList(),
  'errors': ?instance.errors,
};
