// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_tickets_agenda_get200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SupportTicketsAgendaGet200ResponseCWProxy {
  SupportTicketsAgendaGet200Response success(bool? success);

  SupportTicketsAgendaGet200Response message(String? message);

  SupportTicketsAgendaGet200Response status(int? status);

  SupportTicketsAgendaGet200Response data(List<SupportTicket>? data);

  SupportTicketsAgendaGet200Response errors(Object? errors);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SupportTicketsAgendaGet200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SupportTicketsAgendaGet200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  SupportTicketsAgendaGet200Response call({
    bool? success,
    String? message,
    int? status,
    List<SupportTicket>? data,
    Object? errors,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSupportTicketsAgendaGet200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSupportTicketsAgendaGet200Response.copyWith.fieldName(...)`
class _$SupportTicketsAgendaGet200ResponseCWProxyImpl
    implements _$SupportTicketsAgendaGet200ResponseCWProxy {
  const _$SupportTicketsAgendaGet200ResponseCWProxyImpl(this._value);

  final SupportTicketsAgendaGet200Response _value;

  @override
  SupportTicketsAgendaGet200Response success(bool? success) =>
      this(success: success);

  @override
  SupportTicketsAgendaGet200Response message(String? message) =>
      this(message: message);

  @override
  SupportTicketsAgendaGet200Response status(int? status) =>
      this(status: status);

  @override
  SupportTicketsAgendaGet200Response data(List<SupportTicket>? data) =>
      this(data: data);

  @override
  SupportTicketsAgendaGet200Response errors(Object? errors) =>
      this(errors: errors);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SupportTicketsAgendaGet200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SupportTicketsAgendaGet200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  SupportTicketsAgendaGet200Response call({
    Object? success = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? data = const $CopyWithPlaceholder(),
    Object? errors = const $CopyWithPlaceholder(),
  }) {
    return SupportTicketsAgendaGet200Response(
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

extension $SupportTicketsAgendaGet200ResponseCopyWith
    on SupportTicketsAgendaGet200Response {
  /// Returns a callable class that can be used as follows: `instanceOfSupportTicketsAgendaGet200Response.copyWith(...)` or like so:`instanceOfSupportTicketsAgendaGet200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SupportTicketsAgendaGet200ResponseCWProxy get copyWith =>
      _$SupportTicketsAgendaGet200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupportTicketsAgendaGet200Response _$SupportTicketsAgendaGet200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SupportTicketsAgendaGet200Response', json, (
  $checkedConvert,
) {
  final val = SupportTicketsAgendaGet200Response(
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

Map<String, dynamic> _$SupportTicketsAgendaGet200ResponseToJson(
  SupportTicketsAgendaGet200Response instance,
) => <String, dynamic>{
  'success': ?instance.success,
  'message': ?instance.message,
  'status': ?instance.status,
  'data': ?instance.data?.map((e) => e.toJson()).toList(),
  'errors': ?instance.errors,
};
