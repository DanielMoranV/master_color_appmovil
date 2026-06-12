// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_quote_create_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TicketQuoteCreateRequestCWProxy {
  TicketQuoteCreateRequest laborCost(double laborCost);

  TicketQuoteCreateRequest partsCost(double? partsCost);

  TicketQuoteCreateRequest currency(String? currency);

  TicketQuoteCreateRequest note(String? note);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketQuoteCreateRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketQuoteCreateRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketQuoteCreateRequest call({
    double laborCost,
    double? partsCost,
    String? currency,
    String? note,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTicketQuoteCreateRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTicketQuoteCreateRequest.copyWith.fieldName(...)`
class _$TicketQuoteCreateRequestCWProxyImpl
    implements _$TicketQuoteCreateRequestCWProxy {
  const _$TicketQuoteCreateRequestCWProxyImpl(this._value);

  final TicketQuoteCreateRequest _value;

  @override
  TicketQuoteCreateRequest laborCost(double laborCost) =>
      this(laborCost: laborCost);

  @override
  TicketQuoteCreateRequest partsCost(double? partsCost) =>
      this(partsCost: partsCost);

  @override
  TicketQuoteCreateRequest currency(String? currency) =>
      this(currency: currency);

  @override
  TicketQuoteCreateRequest note(String? note) => this(note: note);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketQuoteCreateRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketQuoteCreateRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketQuoteCreateRequest call({
    Object? laborCost = const $CopyWithPlaceholder(),
    Object? partsCost = const $CopyWithPlaceholder(),
    Object? currency = const $CopyWithPlaceholder(),
    Object? note = const $CopyWithPlaceholder(),
  }) {
    return TicketQuoteCreateRequest(
      laborCost: laborCost == const $CopyWithPlaceholder()
          ? _value.laborCost
          // ignore: cast_nullable_to_non_nullable
          : laborCost as double,
      partsCost: partsCost == const $CopyWithPlaceholder()
          ? _value.partsCost
          // ignore: cast_nullable_to_non_nullable
          : partsCost as double?,
      currency: currency == const $CopyWithPlaceholder()
          ? _value.currency
          // ignore: cast_nullable_to_non_nullable
          : currency as String?,
      note: note == const $CopyWithPlaceholder()
          ? _value.note
          // ignore: cast_nullable_to_non_nullable
          : note as String?,
    );
  }
}

extension $TicketQuoteCreateRequestCopyWith on TicketQuoteCreateRequest {
  /// Returns a callable class that can be used as follows: `instanceOfTicketQuoteCreateRequest.copyWith(...)` or like so:`instanceOfTicketQuoteCreateRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TicketQuoteCreateRequestCWProxy get copyWith =>
      _$TicketQuoteCreateRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketQuoteCreateRequest _$TicketQuoteCreateRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'TicketQuoteCreateRequest',
  json,
  ($checkedConvert) {
    $checkKeys(json, requiredKeys: const ['labor_cost']);
    final val = TicketQuoteCreateRequest(
      laborCost: $checkedConvert('labor_cost', (v) => (v as num).toDouble()),
      partsCost: $checkedConvert('parts_cost', (v) => (v as num?)?.toDouble()),
      currency: $checkedConvert('currency', (v) => v as String? ?? 'PEN'),
      note: $checkedConvert('note', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {'laborCost': 'labor_cost', 'partsCost': 'parts_cost'},
);

Map<String, dynamic> _$TicketQuoteCreateRequestToJson(
  TicketQuoteCreateRequest instance,
) => <String, dynamic>{
  'labor_cost': instance.laborCost,
  'parts_cost': ?instance.partsCost,
  'currency': ?instance.currency,
  'note': ?instance.note,
};
