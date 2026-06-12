// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visit_check_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VisitCheckRequestCWProxy {
  VisitCheckRequest latitude(double? latitude);

  VisitCheckRequest longitude(double? longitude);

  VisitCheckRequest at(DateTime? at);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VisitCheckRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VisitCheckRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  VisitCheckRequest call({double? latitude, double? longitude, DateTime? at});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVisitCheckRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVisitCheckRequest.copyWith.fieldName(...)`
class _$VisitCheckRequestCWProxyImpl implements _$VisitCheckRequestCWProxy {
  const _$VisitCheckRequestCWProxyImpl(this._value);

  final VisitCheckRequest _value;

  @override
  VisitCheckRequest latitude(double? latitude) => this(latitude: latitude);

  @override
  VisitCheckRequest longitude(double? longitude) => this(longitude: longitude);

  @override
  VisitCheckRequest at(DateTime? at) => this(at: at);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VisitCheckRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VisitCheckRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  VisitCheckRequest call({
    Object? latitude = const $CopyWithPlaceholder(),
    Object? longitude = const $CopyWithPlaceholder(),
    Object? at = const $CopyWithPlaceholder(),
  }) {
    return VisitCheckRequest(
      latitude: latitude == const $CopyWithPlaceholder()
          ? _value.latitude
          // ignore: cast_nullable_to_non_nullable
          : latitude as double?,
      longitude: longitude == const $CopyWithPlaceholder()
          ? _value.longitude
          // ignore: cast_nullable_to_non_nullable
          : longitude as double?,
      at: at == const $CopyWithPlaceholder()
          ? _value.at
          // ignore: cast_nullable_to_non_nullable
          : at as DateTime?,
    );
  }
}

extension $VisitCheckRequestCopyWith on VisitCheckRequest {
  /// Returns a callable class that can be used as follows: `instanceOfVisitCheckRequest.copyWith(...)` or like so:`instanceOfVisitCheckRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VisitCheckRequestCWProxy get copyWith =>
      _$VisitCheckRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisitCheckRequest _$VisitCheckRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('VisitCheckRequest', json, ($checkedConvert) {
      final val = VisitCheckRequest(
        latitude: $checkedConvert('latitude', (v) => (v as num?)?.toDouble()),
        longitude: $checkedConvert('longitude', (v) => (v as num?)?.toDouble()),
        at: $checkedConvert(
          'at',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
      );
      return val;
    });

Map<String, dynamic> _$VisitCheckRequestToJson(VisitCheckRequest instance) =>
    <String, dynamic>{
      'latitude': ?instance.latitude,
      'longitude': ?instance.longitude,
      'at': ?instance.at?.toIso8601String(),
    };
