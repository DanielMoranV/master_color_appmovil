// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_history_event.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ServiceHistoryEventCWProxy {
  ServiceHistoryEvent type(ServiceHistoryEventTypeEnum? type);

  ServiceHistoryEvent at(DateTime? at);

  ServiceHistoryEvent ticketId(int? ticketId);

  ServiceHistoryEvent ticketCode(String? ticketCode);

  ServiceHistoryEvent category(String? category);

  ServiceHistoryEvent subject(String? subject);

  ServiceHistoryEvent technician(String? technician);

  ServiceHistoryEvent checkinAt(DateTime? checkinAt);

  ServiceHistoryEvent checkoutAt(DateTime? checkoutAt);

  ServiceHistoryEvent durationMinutes(int? durationMinutes);

  ServiceHistoryEvent workDone(String? workDone);

  ServiceHistoryEvent reportedAt(DateTime? reportedAt);

  ServiceHistoryEvent diagnosis(String? diagnosis);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ServiceHistoryEvent(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ServiceHistoryEvent(...).copyWith(id: 12, name: "My name")
  /// ````
  ServiceHistoryEvent call({
    ServiceHistoryEventTypeEnum? type,
    DateTime? at,
    int? ticketId,
    String? ticketCode,
    String? category,
    String? subject,
    String? technician,
    DateTime? checkinAt,
    DateTime? checkoutAt,
    int? durationMinutes,
    String? workDone,
    DateTime? reportedAt,
    String? diagnosis,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfServiceHistoryEvent.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfServiceHistoryEvent.copyWith.fieldName(...)`
class _$ServiceHistoryEventCWProxyImpl implements _$ServiceHistoryEventCWProxy {
  const _$ServiceHistoryEventCWProxyImpl(this._value);

  final ServiceHistoryEvent _value;

  @override
  ServiceHistoryEvent type(ServiceHistoryEventTypeEnum? type) =>
      this(type: type);

  @override
  ServiceHistoryEvent at(DateTime? at) => this(at: at);

  @override
  ServiceHistoryEvent ticketId(int? ticketId) => this(ticketId: ticketId);

  @override
  ServiceHistoryEvent ticketCode(String? ticketCode) =>
      this(ticketCode: ticketCode);

  @override
  ServiceHistoryEvent category(String? category) => this(category: category);

  @override
  ServiceHistoryEvent subject(String? subject) => this(subject: subject);

  @override
  ServiceHistoryEvent technician(String? technician) =>
      this(technician: technician);

  @override
  ServiceHistoryEvent checkinAt(DateTime? checkinAt) =>
      this(checkinAt: checkinAt);

  @override
  ServiceHistoryEvent checkoutAt(DateTime? checkoutAt) =>
      this(checkoutAt: checkoutAt);

  @override
  ServiceHistoryEvent durationMinutes(int? durationMinutes) =>
      this(durationMinutes: durationMinutes);

  @override
  ServiceHistoryEvent workDone(String? workDone) => this(workDone: workDone);

  @override
  ServiceHistoryEvent reportedAt(DateTime? reportedAt) =>
      this(reportedAt: reportedAt);

  @override
  ServiceHistoryEvent diagnosis(String? diagnosis) =>
      this(diagnosis: diagnosis);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ServiceHistoryEvent(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ServiceHistoryEvent(...).copyWith(id: 12, name: "My name")
  /// ````
  ServiceHistoryEvent call({
    Object? type = const $CopyWithPlaceholder(),
    Object? at = const $CopyWithPlaceholder(),
    Object? ticketId = const $CopyWithPlaceholder(),
    Object? ticketCode = const $CopyWithPlaceholder(),
    Object? category = const $CopyWithPlaceholder(),
    Object? subject = const $CopyWithPlaceholder(),
    Object? technician = const $CopyWithPlaceholder(),
    Object? checkinAt = const $CopyWithPlaceholder(),
    Object? checkoutAt = const $CopyWithPlaceholder(),
    Object? durationMinutes = const $CopyWithPlaceholder(),
    Object? workDone = const $CopyWithPlaceholder(),
    Object? reportedAt = const $CopyWithPlaceholder(),
    Object? diagnosis = const $CopyWithPlaceholder(),
  }) {
    return ServiceHistoryEvent(
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as ServiceHistoryEventTypeEnum?,
      at: at == const $CopyWithPlaceholder()
          ? _value.at
          // ignore: cast_nullable_to_non_nullable
          : at as DateTime?,
      ticketId: ticketId == const $CopyWithPlaceholder()
          ? _value.ticketId
          // ignore: cast_nullable_to_non_nullable
          : ticketId as int?,
      ticketCode: ticketCode == const $CopyWithPlaceholder()
          ? _value.ticketCode
          // ignore: cast_nullable_to_non_nullable
          : ticketCode as String?,
      category: category == const $CopyWithPlaceholder()
          ? _value.category
          // ignore: cast_nullable_to_non_nullable
          : category as String?,
      subject: subject == const $CopyWithPlaceholder()
          ? _value.subject
          // ignore: cast_nullable_to_non_nullable
          : subject as String?,
      technician: technician == const $CopyWithPlaceholder()
          ? _value.technician
          // ignore: cast_nullable_to_non_nullable
          : technician as String?,
      checkinAt: checkinAt == const $CopyWithPlaceholder()
          ? _value.checkinAt
          // ignore: cast_nullable_to_non_nullable
          : checkinAt as DateTime?,
      checkoutAt: checkoutAt == const $CopyWithPlaceholder()
          ? _value.checkoutAt
          // ignore: cast_nullable_to_non_nullable
          : checkoutAt as DateTime?,
      durationMinutes: durationMinutes == const $CopyWithPlaceholder()
          ? _value.durationMinutes
          // ignore: cast_nullable_to_non_nullable
          : durationMinutes as int?,
      workDone: workDone == const $CopyWithPlaceholder()
          ? _value.workDone
          // ignore: cast_nullable_to_non_nullable
          : workDone as String?,
      reportedAt: reportedAt == const $CopyWithPlaceholder()
          ? _value.reportedAt
          // ignore: cast_nullable_to_non_nullable
          : reportedAt as DateTime?,
      diagnosis: diagnosis == const $CopyWithPlaceholder()
          ? _value.diagnosis
          // ignore: cast_nullable_to_non_nullable
          : diagnosis as String?,
    );
  }
}

extension $ServiceHistoryEventCopyWith on ServiceHistoryEvent {
  /// Returns a callable class that can be used as follows: `instanceOfServiceHistoryEvent.copyWith(...)` or like so:`instanceOfServiceHistoryEvent.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ServiceHistoryEventCWProxy get copyWith =>
      _$ServiceHistoryEventCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceHistoryEvent _$ServiceHistoryEventFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ServiceHistoryEvent',
      json,
      ($checkedConvert) {
        final val = ServiceHistoryEvent(
          type: $checkedConvert(
            'type',
            (v) => $enumDecodeNullable(_$ServiceHistoryEventTypeEnumEnumMap, v),
          ),
          at: $checkedConvert(
            'at',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          ticketId: $checkedConvert('ticket_id', (v) => (v as num?)?.toInt()),
          ticketCode: $checkedConvert('ticket_code', (v) => v as String?),
          category: $checkedConvert('category', (v) => v as String?),
          subject: $checkedConvert('subject', (v) => v as String?),
          technician: $checkedConvert('technician', (v) => v as String?),
          checkinAt: $checkedConvert(
            'checkin_at',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          checkoutAt: $checkedConvert(
            'checkout_at',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          durationMinutes: $checkedConvert(
            'duration_minutes',
            (v) => (v as num?)?.toInt(),
          ),
          workDone: $checkedConvert('work_done', (v) => v as String?),
          reportedAt: $checkedConvert(
            'reported_at',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          diagnosis: $checkedConvert('diagnosis', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'ticketId': 'ticket_id',
        'ticketCode': 'ticket_code',
        'checkinAt': 'checkin_at',
        'checkoutAt': 'checkout_at',
        'durationMinutes': 'duration_minutes',
        'workDone': 'work_done',
        'reportedAt': 'reported_at',
      },
    );

Map<String, dynamic> _$ServiceHistoryEventToJson(
  ServiceHistoryEvent instance,
) => <String, dynamic>{
  'type': ?_$ServiceHistoryEventTypeEnumEnumMap[instance.type],
  'at': ?instance.at?.toIso8601String(),
  'ticket_id': ?instance.ticketId,
  'ticket_code': ?instance.ticketCode,
  'category': ?instance.category,
  'subject': ?instance.subject,
  'technician': ?instance.technician,
  'checkin_at': ?instance.checkinAt?.toIso8601String(),
  'checkout_at': ?instance.checkoutAt?.toIso8601String(),
  'duration_minutes': ?instance.durationMinutes,
  'work_done': ?instance.workDone,
  'reported_at': ?instance.reportedAt?.toIso8601String(),
  'diagnosis': ?instance.diagnosis,
};

const _$ServiceHistoryEventTypeEnumEnumMap = {
  ServiceHistoryEventTypeEnum.ticketOpened: 'ticket_opened',
  ServiceHistoryEventTypeEnum.visit: 'visit',
  ServiceHistoryEventTypeEnum.resolved: 'resolved',
};
