// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_status_history.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TicketStatusHistoryCWProxy {
  TicketStatusHistory id(int? id);

  TicketStatusHistory fromStatus(String? fromStatus);

  TicketStatusHistory toStatus(TicketStatus? toStatus);

  TicketStatusHistory changedByType(AuthorType? changedByType);

  TicketStatusHistory changedByName(String? changedByName);

  TicketStatusHistory note(String? note);

  TicketStatusHistory createdAt(DateTime? createdAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketStatusHistory(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketStatusHistory(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketStatusHistory call({
    int? id,
    String? fromStatus,
    TicketStatus? toStatus,
    AuthorType? changedByType,
    String? changedByName,
    String? note,
    DateTime? createdAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTicketStatusHistory.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTicketStatusHistory.copyWith.fieldName(...)`
class _$TicketStatusHistoryCWProxyImpl implements _$TicketStatusHistoryCWProxy {
  const _$TicketStatusHistoryCWProxyImpl(this._value);

  final TicketStatusHistory _value;

  @override
  TicketStatusHistory id(int? id) => this(id: id);

  @override
  TicketStatusHistory fromStatus(String? fromStatus) =>
      this(fromStatus: fromStatus);

  @override
  TicketStatusHistory toStatus(TicketStatus? toStatus) =>
      this(toStatus: toStatus);

  @override
  TicketStatusHistory changedByType(AuthorType? changedByType) =>
      this(changedByType: changedByType);

  @override
  TicketStatusHistory changedByName(String? changedByName) =>
      this(changedByName: changedByName);

  @override
  TicketStatusHistory note(String? note) => this(note: note);

  @override
  TicketStatusHistory createdAt(DateTime? createdAt) =>
      this(createdAt: createdAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketStatusHistory(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketStatusHistory(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketStatusHistory call({
    Object? id = const $CopyWithPlaceholder(),
    Object? fromStatus = const $CopyWithPlaceholder(),
    Object? toStatus = const $CopyWithPlaceholder(),
    Object? changedByType = const $CopyWithPlaceholder(),
    Object? changedByName = const $CopyWithPlaceholder(),
    Object? note = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
  }) {
    return TicketStatusHistory(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      fromStatus: fromStatus == const $CopyWithPlaceholder()
          ? _value.fromStatus
          // ignore: cast_nullable_to_non_nullable
          : fromStatus as String?,
      toStatus: toStatus == const $CopyWithPlaceholder()
          ? _value.toStatus
          // ignore: cast_nullable_to_non_nullable
          : toStatus as TicketStatus?,
      changedByType: changedByType == const $CopyWithPlaceholder()
          ? _value.changedByType
          // ignore: cast_nullable_to_non_nullable
          : changedByType as AuthorType?,
      changedByName: changedByName == const $CopyWithPlaceholder()
          ? _value.changedByName
          // ignore: cast_nullable_to_non_nullable
          : changedByName as String?,
      note: note == const $CopyWithPlaceholder()
          ? _value.note
          // ignore: cast_nullable_to_non_nullable
          : note as String?,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime?,
    );
  }
}

extension $TicketStatusHistoryCopyWith on TicketStatusHistory {
  /// Returns a callable class that can be used as follows: `instanceOfTicketStatusHistory.copyWith(...)` or like so:`instanceOfTicketStatusHistory.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TicketStatusHistoryCWProxy get copyWith =>
      _$TicketStatusHistoryCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketStatusHistory _$TicketStatusHistoryFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TicketStatusHistory',
      json,
      ($checkedConvert) {
        final val = TicketStatusHistory(
          id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
          fromStatus: $checkedConvert('from_status', (v) => v as String?),
          toStatus: $checkedConvert(
            'to_status',
            (v) => $enumDecodeNullable(_$TicketStatusEnumMap, v),
          ),
          changedByType: $checkedConvert(
            'changed_by_type',
            (v) => $enumDecodeNullable(_$AuthorTypeEnumMap, v),
          ),
          changedByName: $checkedConvert(
            'changed_by_name',
            (v) => v as String?,
          ),
          note: $checkedConvert('note', (v) => v as String?),
          createdAt: $checkedConvert(
            'created_at',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'fromStatus': 'from_status',
        'toStatus': 'to_status',
        'changedByType': 'changed_by_type',
        'changedByName': 'changed_by_name',
        'createdAt': 'created_at',
      },
    );

Map<String, dynamic> _$TicketStatusHistoryToJson(
  TicketStatusHistory instance,
) => <String, dynamic>{
  'id': ?instance.id,
  'from_status': ?instance.fromStatus,
  'to_status': ?_$TicketStatusEnumMap[instance.toStatus],
  'changed_by_type': ?_$AuthorTypeEnumMap[instance.changedByType],
  'changed_by_name': ?instance.changedByName,
  'note': ?instance.note,
  'created_at': ?instance.createdAt?.toIso8601String(),
};

const _$TicketStatusEnumMap = {
  TicketStatus.abierto: 'abierto',
  TicketStatus.asignado: 'asignado',
  TicketStatus.enProceso: 'en_proceso',
  TicketStatus.enEsperaCliente: 'en_espera_cliente',
  TicketStatus.resuelto: 'resuelto',
  TicketStatus.cerrado: 'cerrado',
  TicketStatus.cancelado: 'cancelado',
};

const _$AuthorTypeEnumMap = {
  AuthorType.client: 'client',
  AuthorType.user: 'user',
};
