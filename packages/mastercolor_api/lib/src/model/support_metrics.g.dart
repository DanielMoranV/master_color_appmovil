// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_metrics.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SupportMetricsCWProxy {
  SupportMetrics totalTickets(int? totalTickets);

  SupportMetrics openTickets(int? openTickets);

  SupportMetrics unassignedTickets(int? unassignedTickets);

  SupportMetrics resolvedThisMonth(int? resolvedThisMonth);

  SupportMetrics avgFirstResponseHours(double? avgFirstResponseHours);

  SupportMetrics avgResolutionHours(double? avgResolutionHours);

  SupportMetrics slaBreached(int? slaBreached);

  SupportMetrics byStatus(Map<String, int>? byStatus);

  SupportMetrics byTechnician(
    List<SupportMetricsByTechnicianInner>? byTechnician,
  );

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SupportMetrics(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SupportMetrics(...).copyWith(id: 12, name: "My name")
  /// ````
  SupportMetrics call({
    int? totalTickets,
    int? openTickets,
    int? unassignedTickets,
    int? resolvedThisMonth,
    double? avgFirstResponseHours,
    double? avgResolutionHours,
    int? slaBreached,
    Map<String, int>? byStatus,
    List<SupportMetricsByTechnicianInner>? byTechnician,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSupportMetrics.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSupportMetrics.copyWith.fieldName(...)`
class _$SupportMetricsCWProxyImpl implements _$SupportMetricsCWProxy {
  const _$SupportMetricsCWProxyImpl(this._value);

  final SupportMetrics _value;

  @override
  SupportMetrics totalTickets(int? totalTickets) =>
      this(totalTickets: totalTickets);

  @override
  SupportMetrics openTickets(int? openTickets) =>
      this(openTickets: openTickets);

  @override
  SupportMetrics unassignedTickets(int? unassignedTickets) =>
      this(unassignedTickets: unassignedTickets);

  @override
  SupportMetrics resolvedThisMonth(int? resolvedThisMonth) =>
      this(resolvedThisMonth: resolvedThisMonth);

  @override
  SupportMetrics avgFirstResponseHours(double? avgFirstResponseHours) =>
      this(avgFirstResponseHours: avgFirstResponseHours);

  @override
  SupportMetrics avgResolutionHours(double? avgResolutionHours) =>
      this(avgResolutionHours: avgResolutionHours);

  @override
  SupportMetrics slaBreached(int? slaBreached) =>
      this(slaBreached: slaBreached);

  @override
  SupportMetrics byStatus(Map<String, int>? byStatus) =>
      this(byStatus: byStatus);

  @override
  SupportMetrics byTechnician(
    List<SupportMetricsByTechnicianInner>? byTechnician,
  ) => this(byTechnician: byTechnician);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SupportMetrics(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SupportMetrics(...).copyWith(id: 12, name: "My name")
  /// ````
  SupportMetrics call({
    Object? totalTickets = const $CopyWithPlaceholder(),
    Object? openTickets = const $CopyWithPlaceholder(),
    Object? unassignedTickets = const $CopyWithPlaceholder(),
    Object? resolvedThisMonth = const $CopyWithPlaceholder(),
    Object? avgFirstResponseHours = const $CopyWithPlaceholder(),
    Object? avgResolutionHours = const $CopyWithPlaceholder(),
    Object? slaBreached = const $CopyWithPlaceholder(),
    Object? byStatus = const $CopyWithPlaceholder(),
    Object? byTechnician = const $CopyWithPlaceholder(),
  }) {
    return SupportMetrics(
      totalTickets: totalTickets == const $CopyWithPlaceholder()
          ? _value.totalTickets
          // ignore: cast_nullable_to_non_nullable
          : totalTickets as int?,
      openTickets: openTickets == const $CopyWithPlaceholder()
          ? _value.openTickets
          // ignore: cast_nullable_to_non_nullable
          : openTickets as int?,
      unassignedTickets: unassignedTickets == const $CopyWithPlaceholder()
          ? _value.unassignedTickets
          // ignore: cast_nullable_to_non_nullable
          : unassignedTickets as int?,
      resolvedThisMonth: resolvedThisMonth == const $CopyWithPlaceholder()
          ? _value.resolvedThisMonth
          // ignore: cast_nullable_to_non_nullable
          : resolvedThisMonth as int?,
      avgFirstResponseHours:
          avgFirstResponseHours == const $CopyWithPlaceholder()
          ? _value.avgFirstResponseHours
          // ignore: cast_nullable_to_non_nullable
          : avgFirstResponseHours as double?,
      avgResolutionHours: avgResolutionHours == const $CopyWithPlaceholder()
          ? _value.avgResolutionHours
          // ignore: cast_nullable_to_non_nullable
          : avgResolutionHours as double?,
      slaBreached: slaBreached == const $CopyWithPlaceholder()
          ? _value.slaBreached
          // ignore: cast_nullable_to_non_nullable
          : slaBreached as int?,
      byStatus: byStatus == const $CopyWithPlaceholder()
          ? _value.byStatus
          // ignore: cast_nullable_to_non_nullable
          : byStatus as Map<String, int>?,
      byTechnician: byTechnician == const $CopyWithPlaceholder()
          ? _value.byTechnician
          // ignore: cast_nullable_to_non_nullable
          : byTechnician as List<SupportMetricsByTechnicianInner>?,
    );
  }
}

extension $SupportMetricsCopyWith on SupportMetrics {
  /// Returns a callable class that can be used as follows: `instanceOfSupportMetrics.copyWith(...)` or like so:`instanceOfSupportMetrics.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SupportMetricsCWProxy get copyWith => _$SupportMetricsCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupportMetrics _$SupportMetricsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'SupportMetrics',
  json,
  ($checkedConvert) {
    final val = SupportMetrics(
      totalTickets: $checkedConvert(
        'total_tickets',
        (v) => (v as num?)?.toInt(),
      ),
      openTickets: $checkedConvert('open_tickets', (v) => (v as num?)?.toInt()),
      unassignedTickets: $checkedConvert(
        'unassigned_tickets',
        (v) => (v as num?)?.toInt(),
      ),
      resolvedThisMonth: $checkedConvert(
        'resolved_this_month',
        (v) => (v as num?)?.toInt(),
      ),
      avgFirstResponseHours: $checkedConvert(
        'avg_first_response_hours',
        (v) => (v as num?)?.toDouble(),
      ),
      avgResolutionHours: $checkedConvert(
        'avg_resolution_hours',
        (v) => (v as num?)?.toDouble(),
      ),
      slaBreached: $checkedConvert('sla_breached', (v) => (v as num?)?.toInt()),
      byStatus: $checkedConvert(
        'by_status',
        (v) => (v as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k, (e as num).toInt()),
        ),
      ),
      byTechnician: $checkedConvert(
        'by_technician',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => SupportMetricsByTechnicianInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'totalTickets': 'total_tickets',
    'openTickets': 'open_tickets',
    'unassignedTickets': 'unassigned_tickets',
    'resolvedThisMonth': 'resolved_this_month',
    'avgFirstResponseHours': 'avg_first_response_hours',
    'avgResolutionHours': 'avg_resolution_hours',
    'slaBreached': 'sla_breached',
    'byStatus': 'by_status',
    'byTechnician': 'by_technician',
  },
);

Map<String, dynamic> _$SupportMetricsToJson(SupportMetrics instance) =>
    <String, dynamic>{
      'total_tickets': ?instance.totalTickets,
      'open_tickets': ?instance.openTickets,
      'unassigned_tickets': ?instance.unassignedTickets,
      'resolved_this_month': ?instance.resolvedThisMonth,
      'avg_first_response_hours': ?instance.avgFirstResponseHours,
      'avg_resolution_hours': ?instance.avgResolutionHours,
      'sla_breached': ?instance.slaBreached,
      'by_status': ?instance.byStatus,
      'by_technician': ?instance.byTechnician?.map((e) => e.toJson()).toList(),
    };
