// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_tickets_id_status_patch_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SupportTicketsIdStatusPatchRequestCWProxy {
  SupportTicketsIdStatusPatchRequest status(TicketStatus status);

  SupportTicketsIdStatusPatchRequest note(String? note);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SupportTicketsIdStatusPatchRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SupportTicketsIdStatusPatchRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  SupportTicketsIdStatusPatchRequest call({TicketStatus status, String? note});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSupportTicketsIdStatusPatchRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSupportTicketsIdStatusPatchRequest.copyWith.fieldName(...)`
class _$SupportTicketsIdStatusPatchRequestCWProxyImpl
    implements _$SupportTicketsIdStatusPatchRequestCWProxy {
  const _$SupportTicketsIdStatusPatchRequestCWProxyImpl(this._value);

  final SupportTicketsIdStatusPatchRequest _value;

  @override
  SupportTicketsIdStatusPatchRequest status(TicketStatus status) =>
      this(status: status);

  @override
  SupportTicketsIdStatusPatchRequest note(String? note) => this(note: note);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SupportTicketsIdStatusPatchRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SupportTicketsIdStatusPatchRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  SupportTicketsIdStatusPatchRequest call({
    Object? status = const $CopyWithPlaceholder(),
    Object? note = const $CopyWithPlaceholder(),
  }) {
    return SupportTicketsIdStatusPatchRequest(
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as TicketStatus,
      note: note == const $CopyWithPlaceholder()
          ? _value.note
          // ignore: cast_nullable_to_non_nullable
          : note as String?,
    );
  }
}

extension $SupportTicketsIdStatusPatchRequestCopyWith
    on SupportTicketsIdStatusPatchRequest {
  /// Returns a callable class that can be used as follows: `instanceOfSupportTicketsIdStatusPatchRequest.copyWith(...)` or like so:`instanceOfSupportTicketsIdStatusPatchRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SupportTicketsIdStatusPatchRequestCWProxy get copyWith =>
      _$SupportTicketsIdStatusPatchRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupportTicketsIdStatusPatchRequest _$SupportTicketsIdStatusPatchRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SupportTicketsIdStatusPatchRequest', json, (
  $checkedConvert,
) {
  $checkKeys(json, requiredKeys: const ['status']);
  final val = SupportTicketsIdStatusPatchRequest(
    status: $checkedConvert(
      'status',
      (v) => $enumDecode(_$TicketStatusEnumMap, v),
    ),
    note: $checkedConvert('note', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$SupportTicketsIdStatusPatchRequestToJson(
  SupportTicketsIdStatusPatchRequest instance,
) => <String, dynamic>{
  'status': _$TicketStatusEnumMap[instance.status]!,
  'note': ?instance.note,
};

const _$TicketStatusEnumMap = {
  TicketStatus.abierto: 'abierto',
  TicketStatus.asignado: 'asignado',
  TicketStatus.enProceso: 'en_proceso',
  TicketStatus.enEsperaCliente: 'en_espera_cliente',
  TicketStatus.enEsperaAprobacion: 'en_espera_aprobacion',
  TicketStatus.resuelto: 'resuelto',
  TicketStatus.cerrado: 'cerrado',
  TicketStatus.cancelado: 'cancelado',
};
