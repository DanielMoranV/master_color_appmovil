// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_support_tickets_post201_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ClientSupportTicketsPost201ResponseCWProxy {
  ClientSupportTicketsPost201Response success(bool? success);

  ClientSupportTicketsPost201Response message(String? message);

  ClientSupportTicketsPost201Response status(int? status);

  ClientSupportTicketsPost201Response data(SupportTicket? data);

  ClientSupportTicketsPost201Response errors(Object? errors);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientSupportTicketsPost201Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientSupportTicketsPost201Response(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientSupportTicketsPost201Response call({
    bool? success,
    String? message,
    int? status,
    SupportTicket? data,
    Object? errors,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfClientSupportTicketsPost201Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfClientSupportTicketsPost201Response.copyWith.fieldName(...)`
class _$ClientSupportTicketsPost201ResponseCWProxyImpl
    implements _$ClientSupportTicketsPost201ResponseCWProxy {
  const _$ClientSupportTicketsPost201ResponseCWProxyImpl(this._value);

  final ClientSupportTicketsPost201Response _value;

  @override
  ClientSupportTicketsPost201Response success(bool? success) =>
      this(success: success);

  @override
  ClientSupportTicketsPost201Response message(String? message) =>
      this(message: message);

  @override
  ClientSupportTicketsPost201Response status(int? status) =>
      this(status: status);

  @override
  ClientSupportTicketsPost201Response data(SupportTicket? data) =>
      this(data: data);

  @override
  ClientSupportTicketsPost201Response errors(Object? errors) =>
      this(errors: errors);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientSupportTicketsPost201Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientSupportTicketsPost201Response(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientSupportTicketsPost201Response call({
    Object? success = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? data = const $CopyWithPlaceholder(),
    Object? errors = const $CopyWithPlaceholder(),
  }) {
    return ClientSupportTicketsPost201Response(
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
          : data as SupportTicket?,
      errors: errors == const $CopyWithPlaceholder()
          ? _value.errors
          // ignore: cast_nullable_to_non_nullable
          : errors as Object?,
    );
  }
}

extension $ClientSupportTicketsPost201ResponseCopyWith
    on ClientSupportTicketsPost201Response {
  /// Returns a callable class that can be used as follows: `instanceOfClientSupportTicketsPost201Response.copyWith(...)` or like so:`instanceOfClientSupportTicketsPost201Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ClientSupportTicketsPost201ResponseCWProxy get copyWith =>
      _$ClientSupportTicketsPost201ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientSupportTicketsPost201Response
_$ClientSupportTicketsPost201ResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ClientSupportTicketsPost201Response', json, (
      $checkedConvert,
    ) {
      final val = ClientSupportTicketsPost201Response(
        success: $checkedConvert('success', (v) => v as bool?),
        message: $checkedConvert('message', (v) => v as String?),
        status: $checkedConvert('status', (v) => (v as num?)?.toInt()),
        data: $checkedConvert(
          'data',
          (v) => v == null
              ? null
              : SupportTicket.fromJson(v as Map<String, dynamic>),
        ),
        errors: $checkedConvert('errors', (v) => v),
      );
      return val;
    });

Map<String, dynamic> _$ClientSupportTicketsPost201ResponseToJson(
  ClientSupportTicketsPost201Response instance,
) => <String, dynamic>{
  'success': ?instance.success,
  'message': ?instance.message,
  'status': ?instance.status,
  'data': ?instance.data?.toJson(),
  'errors': ?instance.errors,
};
