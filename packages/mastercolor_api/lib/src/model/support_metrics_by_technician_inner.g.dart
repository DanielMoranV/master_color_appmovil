// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_metrics_by_technician_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SupportMetricsByTechnicianInnerCWProxy {
  SupportMetricsByTechnicianInner userId(int? userId);

  SupportMetricsByTechnicianInner name(String? name);

  SupportMetricsByTechnicianInner assigned(int? assigned);

  SupportMetricsByTechnicianInner resolved(int? resolved);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SupportMetricsByTechnicianInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SupportMetricsByTechnicianInner(...).copyWith(id: 12, name: "My name")
  /// ````
  SupportMetricsByTechnicianInner call({
    int? userId,
    String? name,
    int? assigned,
    int? resolved,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSupportMetricsByTechnicianInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSupportMetricsByTechnicianInner.copyWith.fieldName(...)`
class _$SupportMetricsByTechnicianInnerCWProxyImpl
    implements _$SupportMetricsByTechnicianInnerCWProxy {
  const _$SupportMetricsByTechnicianInnerCWProxyImpl(this._value);

  final SupportMetricsByTechnicianInner _value;

  @override
  SupportMetricsByTechnicianInner userId(int? userId) => this(userId: userId);

  @override
  SupportMetricsByTechnicianInner name(String? name) => this(name: name);

  @override
  SupportMetricsByTechnicianInner assigned(int? assigned) =>
      this(assigned: assigned);

  @override
  SupportMetricsByTechnicianInner resolved(int? resolved) =>
      this(resolved: resolved);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SupportMetricsByTechnicianInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SupportMetricsByTechnicianInner(...).copyWith(id: 12, name: "My name")
  /// ````
  SupportMetricsByTechnicianInner call({
    Object? userId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? assigned = const $CopyWithPlaceholder(),
    Object? resolved = const $CopyWithPlaceholder(),
  }) {
    return SupportMetricsByTechnicianInner(
      userId: userId == const $CopyWithPlaceholder()
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as int?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      assigned: assigned == const $CopyWithPlaceholder()
          ? _value.assigned
          // ignore: cast_nullable_to_non_nullable
          : assigned as int?,
      resolved: resolved == const $CopyWithPlaceholder()
          ? _value.resolved
          // ignore: cast_nullable_to_non_nullable
          : resolved as int?,
    );
  }
}

extension $SupportMetricsByTechnicianInnerCopyWith
    on SupportMetricsByTechnicianInner {
  /// Returns a callable class that can be used as follows: `instanceOfSupportMetricsByTechnicianInner.copyWith(...)` or like so:`instanceOfSupportMetricsByTechnicianInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SupportMetricsByTechnicianInnerCWProxy get copyWith =>
      _$SupportMetricsByTechnicianInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupportMetricsByTechnicianInner _$SupportMetricsByTechnicianInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SupportMetricsByTechnicianInner', json, ($checkedConvert) {
  final val = SupportMetricsByTechnicianInner(
    userId: $checkedConvert('user_id', (v) => (v as num?)?.toInt()),
    name: $checkedConvert('name', (v) => v as String?),
    assigned: $checkedConvert('assigned', (v) => (v as num?)?.toInt()),
    resolved: $checkedConvert('resolved', (v) => (v as num?)?.toInt()),
  );
  return val;
}, fieldKeyMap: const {'userId': 'user_id'});

Map<String, dynamic> _$SupportMetricsByTechnicianInnerToJson(
  SupportMetricsByTechnicianInner instance,
) => <String, dynamic>{
  'user_id': ?instance.userId,
  'name': ?instance.name,
  'assigned': ?instance.assigned,
  'resolved': ?instance.resolved,
};
