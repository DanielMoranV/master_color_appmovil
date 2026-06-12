// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_units_id_history_get200_response_all_of_data.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SupportUnitsIdHistoryGet200ResponseAllOfDataCWProxy {
  SupportUnitsIdHistoryGet200ResponseAllOfData unit(SoldUnit? unit);

  SupportUnitsIdHistoryGet200ResponseAllOfData ticketsCount(int? ticketsCount);

  SupportUnitsIdHistoryGet200ResponseAllOfData timeline(
    List<ServiceHistoryEvent>? timeline,
  );

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SupportUnitsIdHistoryGet200ResponseAllOfData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SupportUnitsIdHistoryGet200ResponseAllOfData(...).copyWith(id: 12, name: "My name")
  /// ````
  SupportUnitsIdHistoryGet200ResponseAllOfData call({
    SoldUnit? unit,
    int? ticketsCount,
    List<ServiceHistoryEvent>? timeline,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSupportUnitsIdHistoryGet200ResponseAllOfData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSupportUnitsIdHistoryGet200ResponseAllOfData.copyWith.fieldName(...)`
class _$SupportUnitsIdHistoryGet200ResponseAllOfDataCWProxyImpl
    implements _$SupportUnitsIdHistoryGet200ResponseAllOfDataCWProxy {
  const _$SupportUnitsIdHistoryGet200ResponseAllOfDataCWProxyImpl(this._value);

  final SupportUnitsIdHistoryGet200ResponseAllOfData _value;

  @override
  SupportUnitsIdHistoryGet200ResponseAllOfData unit(SoldUnit? unit) =>
      this(unit: unit);

  @override
  SupportUnitsIdHistoryGet200ResponseAllOfData ticketsCount(
    int? ticketsCount,
  ) => this(ticketsCount: ticketsCount);

  @override
  SupportUnitsIdHistoryGet200ResponseAllOfData timeline(
    List<ServiceHistoryEvent>? timeline,
  ) => this(timeline: timeline);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SupportUnitsIdHistoryGet200ResponseAllOfData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SupportUnitsIdHistoryGet200ResponseAllOfData(...).copyWith(id: 12, name: "My name")
  /// ````
  SupportUnitsIdHistoryGet200ResponseAllOfData call({
    Object? unit = const $CopyWithPlaceholder(),
    Object? ticketsCount = const $CopyWithPlaceholder(),
    Object? timeline = const $CopyWithPlaceholder(),
  }) {
    return SupportUnitsIdHistoryGet200ResponseAllOfData(
      unit: unit == const $CopyWithPlaceholder()
          ? _value.unit
          // ignore: cast_nullable_to_non_nullable
          : unit as SoldUnit?,
      ticketsCount: ticketsCount == const $CopyWithPlaceholder()
          ? _value.ticketsCount
          // ignore: cast_nullable_to_non_nullable
          : ticketsCount as int?,
      timeline: timeline == const $CopyWithPlaceholder()
          ? _value.timeline
          // ignore: cast_nullable_to_non_nullable
          : timeline as List<ServiceHistoryEvent>?,
    );
  }
}

extension $SupportUnitsIdHistoryGet200ResponseAllOfDataCopyWith
    on SupportUnitsIdHistoryGet200ResponseAllOfData {
  /// Returns a callable class that can be used as follows: `instanceOfSupportUnitsIdHistoryGet200ResponseAllOfData.copyWith(...)` or like so:`instanceOfSupportUnitsIdHistoryGet200ResponseAllOfData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SupportUnitsIdHistoryGet200ResponseAllOfDataCWProxy get copyWith =>
      _$SupportUnitsIdHistoryGet200ResponseAllOfDataCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupportUnitsIdHistoryGet200ResponseAllOfData
_$SupportUnitsIdHistoryGet200ResponseAllOfDataFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'SupportUnitsIdHistoryGet200ResponseAllOfData',
  json,
  ($checkedConvert) {
    final val = SupportUnitsIdHistoryGet200ResponseAllOfData(
      unit: $checkedConvert(
        'unit',
        (v) => v == null ? null : SoldUnit.fromJson(v as Map<String, dynamic>),
      ),
      ticketsCount: $checkedConvert(
        'tickets_count',
        (v) => (v as num?)?.toInt(),
      ),
      timeline: $checkedConvert(
        'timeline',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => ServiceHistoryEvent.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'ticketsCount': 'tickets_count'},
);

Map<String, dynamic> _$SupportUnitsIdHistoryGet200ResponseAllOfDataToJson(
  SupportUnitsIdHistoryGet200ResponseAllOfData instance,
) => <String, dynamic>{
  'unit': ?instance.unit?.toJson(),
  'tickets_count': ?instance.ticketsCount,
  'timeline': ?instance.timeline?.map((e) => e.toJson()).toList(),
};
