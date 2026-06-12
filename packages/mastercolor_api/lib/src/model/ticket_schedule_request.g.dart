// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_schedule_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TicketScheduleRequestCWProxy {
  TicketScheduleRequest scheduledAt(DateTime scheduledAt);

  TicketScheduleRequest scheduledWindowMinutes(int? scheduledWindowMinutes);

  TicketScheduleRequest note(String? note);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketScheduleRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketScheduleRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketScheduleRequest call({
    DateTime scheduledAt,
    int? scheduledWindowMinutes,
    String? note,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTicketScheduleRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTicketScheduleRequest.copyWith.fieldName(...)`
class _$TicketScheduleRequestCWProxyImpl
    implements _$TicketScheduleRequestCWProxy {
  const _$TicketScheduleRequestCWProxyImpl(this._value);

  final TicketScheduleRequest _value;

  @override
  TicketScheduleRequest scheduledAt(DateTime scheduledAt) =>
      this(scheduledAt: scheduledAt);

  @override
  TicketScheduleRequest scheduledWindowMinutes(int? scheduledWindowMinutes) =>
      this(scheduledWindowMinutes: scheduledWindowMinutes);

  @override
  TicketScheduleRequest note(String? note) => this(note: note);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketScheduleRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketScheduleRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketScheduleRequest call({
    Object? scheduledAt = const $CopyWithPlaceholder(),
    Object? scheduledWindowMinutes = const $CopyWithPlaceholder(),
    Object? note = const $CopyWithPlaceholder(),
  }) {
    return TicketScheduleRequest(
      scheduledAt: scheduledAt == const $CopyWithPlaceholder()
          ? _value.scheduledAt
          // ignore: cast_nullable_to_non_nullable
          : scheduledAt as DateTime,
      scheduledWindowMinutes:
          scheduledWindowMinutes == const $CopyWithPlaceholder()
          ? _value.scheduledWindowMinutes
          // ignore: cast_nullable_to_non_nullable
          : scheduledWindowMinutes as int?,
      note: note == const $CopyWithPlaceholder()
          ? _value.note
          // ignore: cast_nullable_to_non_nullable
          : note as String?,
    );
  }
}

extension $TicketScheduleRequestCopyWith on TicketScheduleRequest {
  /// Returns a callable class that can be used as follows: `instanceOfTicketScheduleRequest.copyWith(...)` or like so:`instanceOfTicketScheduleRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TicketScheduleRequestCWProxy get copyWith =>
      _$TicketScheduleRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketScheduleRequest _$TicketScheduleRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'TicketScheduleRequest',
  json,
  ($checkedConvert) {
    $checkKeys(json, requiredKeys: const ['scheduled_at']);
    final val = TicketScheduleRequest(
      scheduledAt: $checkedConvert(
        'scheduled_at',
        (v) => DateTime.parse(v as String),
      ),
      scheduledWindowMinutes: $checkedConvert(
        'scheduled_window_minutes',
        (v) => (v as num?)?.toInt(),
      ),
      note: $checkedConvert('note', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'scheduledAt': 'scheduled_at',
    'scheduledWindowMinutes': 'scheduled_window_minutes',
  },
);

Map<String, dynamic> _$TicketScheduleRequestToJson(
  TicketScheduleRequest instance,
) => <String, dynamic>{
  'scheduled_at': instance.scheduledAt.toIso8601String(),
  'scheduled_window_minutes': ?instance.scheduledWindowMinutes,
  'note': ?instance.note,
};
