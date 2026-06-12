// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_quote.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TicketQuoteCWProxy {
  TicketQuote id(int? id);

  TicketQuote ticketId(int? ticketId);

  TicketQuote laborCost(double? laborCost);

  TicketQuote partsCost(double? partsCost);

  TicketQuote total(double? total);

  TicketQuote currency(String? currency);

  TicketQuote status(TicketQuoteStatusEnum? status);

  TicketQuote note(String? note);

  TicketQuote createdByUserId(int? createdByUserId);

  TicketQuote decidedAt(DateTime? decidedAt);

  TicketQuote createdAt(DateTime? createdAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketQuote(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketQuote(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketQuote call({
    int? id,
    int? ticketId,
    double? laborCost,
    double? partsCost,
    double? total,
    String? currency,
    TicketQuoteStatusEnum? status,
    String? note,
    int? createdByUserId,
    DateTime? decidedAt,
    DateTime? createdAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTicketQuote.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTicketQuote.copyWith.fieldName(...)`
class _$TicketQuoteCWProxyImpl implements _$TicketQuoteCWProxy {
  const _$TicketQuoteCWProxyImpl(this._value);

  final TicketQuote _value;

  @override
  TicketQuote id(int? id) => this(id: id);

  @override
  TicketQuote ticketId(int? ticketId) => this(ticketId: ticketId);

  @override
  TicketQuote laborCost(double? laborCost) => this(laborCost: laborCost);

  @override
  TicketQuote partsCost(double? partsCost) => this(partsCost: partsCost);

  @override
  TicketQuote total(double? total) => this(total: total);

  @override
  TicketQuote currency(String? currency) => this(currency: currency);

  @override
  TicketQuote status(TicketQuoteStatusEnum? status) => this(status: status);

  @override
  TicketQuote note(String? note) => this(note: note);

  @override
  TicketQuote createdByUserId(int? createdByUserId) =>
      this(createdByUserId: createdByUserId);

  @override
  TicketQuote decidedAt(DateTime? decidedAt) => this(decidedAt: decidedAt);

  @override
  TicketQuote createdAt(DateTime? createdAt) => this(createdAt: createdAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketQuote(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketQuote(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketQuote call({
    Object? id = const $CopyWithPlaceholder(),
    Object? ticketId = const $CopyWithPlaceholder(),
    Object? laborCost = const $CopyWithPlaceholder(),
    Object? partsCost = const $CopyWithPlaceholder(),
    Object? total = const $CopyWithPlaceholder(),
    Object? currency = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? note = const $CopyWithPlaceholder(),
    Object? createdByUserId = const $CopyWithPlaceholder(),
    Object? decidedAt = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
  }) {
    return TicketQuote(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      ticketId: ticketId == const $CopyWithPlaceholder()
          ? _value.ticketId
          // ignore: cast_nullable_to_non_nullable
          : ticketId as int?,
      laborCost: laborCost == const $CopyWithPlaceholder()
          ? _value.laborCost
          // ignore: cast_nullable_to_non_nullable
          : laborCost as double?,
      partsCost: partsCost == const $CopyWithPlaceholder()
          ? _value.partsCost
          // ignore: cast_nullable_to_non_nullable
          : partsCost as double?,
      total: total == const $CopyWithPlaceholder()
          ? _value.total
          // ignore: cast_nullable_to_non_nullable
          : total as double?,
      currency: currency == const $CopyWithPlaceholder()
          ? _value.currency
          // ignore: cast_nullable_to_non_nullable
          : currency as String?,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as TicketQuoteStatusEnum?,
      note: note == const $CopyWithPlaceholder()
          ? _value.note
          // ignore: cast_nullable_to_non_nullable
          : note as String?,
      createdByUserId: createdByUserId == const $CopyWithPlaceholder()
          ? _value.createdByUserId
          // ignore: cast_nullable_to_non_nullable
          : createdByUserId as int?,
      decidedAt: decidedAt == const $CopyWithPlaceholder()
          ? _value.decidedAt
          // ignore: cast_nullable_to_non_nullable
          : decidedAt as DateTime?,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime?,
    );
  }
}

extension $TicketQuoteCopyWith on TicketQuote {
  /// Returns a callable class that can be used as follows: `instanceOfTicketQuote.copyWith(...)` or like so:`instanceOfTicketQuote.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TicketQuoteCWProxy get copyWith => _$TicketQuoteCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketQuote _$TicketQuoteFromJson(Map<String, dynamic> json) => $checkedCreate(
  'TicketQuote',
  json,
  ($checkedConvert) {
    final val = TicketQuote(
      id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
      ticketId: $checkedConvert('ticket_id', (v) => (v as num?)?.toInt()),
      laborCost: $checkedConvert('labor_cost', (v) => (v as num?)?.toDouble()),
      partsCost: $checkedConvert('parts_cost', (v) => (v as num?)?.toDouble()),
      total: $checkedConvert('total', (v) => (v as num?)?.toDouble()),
      currency: $checkedConvert('currency', (v) => v as String?),
      status: $checkedConvert(
        'status',
        (v) => $enumDecodeNullable(_$TicketQuoteStatusEnumEnumMap, v),
      ),
      note: $checkedConvert('note', (v) => v as String?),
      createdByUserId: $checkedConvert(
        'created_by_user_id',
        (v) => (v as num?)?.toInt(),
      ),
      decidedAt: $checkedConvert(
        'decided_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      createdAt: $checkedConvert(
        'created_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'ticketId': 'ticket_id',
    'laborCost': 'labor_cost',
    'partsCost': 'parts_cost',
    'createdByUserId': 'created_by_user_id',
    'decidedAt': 'decided_at',
    'createdAt': 'created_at',
  },
);

Map<String, dynamic> _$TicketQuoteToJson(TicketQuote instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'ticket_id': ?instance.ticketId,
      'labor_cost': ?instance.laborCost,
      'parts_cost': ?instance.partsCost,
      'total': ?instance.total,
      'currency': ?instance.currency,
      'status': ?_$TicketQuoteStatusEnumEnumMap[instance.status],
      'note': ?instance.note,
      'created_by_user_id': ?instance.createdByUserId,
      'decided_at': ?instance.decidedAt?.toIso8601String(),
      'created_at': ?instance.createdAt?.toIso8601String(),
    };

const _$TicketQuoteStatusEnumEnumMap = {
  TicketQuoteStatusEnum.pendiente: 'pendiente',
  TicketQuoteStatusEnum.aprobado: 'aprobado',
  TicketQuoteStatusEnum.rechazado: 'rechazado',
};
