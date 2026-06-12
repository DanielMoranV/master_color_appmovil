// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'technician_profile_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TechnicianProfileRequestCWProxy {
  TechnicianProfileRequest specialties(
    List<TechnicianProfileRequestSpecialtiesEnum>? specialties,
  );

  TechnicianProfileRequest coverageZones(List<String>? coverageZones);

  TechnicianProfileRequest isAvailable(bool? isAvailable);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TechnicianProfileRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TechnicianProfileRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  TechnicianProfileRequest call({
    List<TechnicianProfileRequestSpecialtiesEnum>? specialties,
    List<String>? coverageZones,
    bool? isAvailable,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTechnicianProfileRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTechnicianProfileRequest.copyWith.fieldName(...)`
class _$TechnicianProfileRequestCWProxyImpl
    implements _$TechnicianProfileRequestCWProxy {
  const _$TechnicianProfileRequestCWProxyImpl(this._value);

  final TechnicianProfileRequest _value;

  @override
  TechnicianProfileRequest specialties(
    List<TechnicianProfileRequestSpecialtiesEnum>? specialties,
  ) => this(specialties: specialties);

  @override
  TechnicianProfileRequest coverageZones(List<String>? coverageZones) =>
      this(coverageZones: coverageZones);

  @override
  TechnicianProfileRequest isAvailable(bool? isAvailable) =>
      this(isAvailable: isAvailable);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TechnicianProfileRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TechnicianProfileRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  TechnicianProfileRequest call({
    Object? specialties = const $CopyWithPlaceholder(),
    Object? coverageZones = const $CopyWithPlaceholder(),
    Object? isAvailable = const $CopyWithPlaceholder(),
  }) {
    return TechnicianProfileRequest(
      specialties: specialties == const $CopyWithPlaceholder()
          ? _value.specialties
          // ignore: cast_nullable_to_non_nullable
          : specialties as List<TechnicianProfileRequestSpecialtiesEnum>?,
      coverageZones: coverageZones == const $CopyWithPlaceholder()
          ? _value.coverageZones
          // ignore: cast_nullable_to_non_nullable
          : coverageZones as List<String>?,
      isAvailable: isAvailable == const $CopyWithPlaceholder()
          ? _value.isAvailable
          // ignore: cast_nullable_to_non_nullable
          : isAvailable as bool?,
    );
  }
}

extension $TechnicianProfileRequestCopyWith on TechnicianProfileRequest {
  /// Returns a callable class that can be used as follows: `instanceOfTechnicianProfileRequest.copyWith(...)` or like so:`instanceOfTechnicianProfileRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TechnicianProfileRequestCWProxy get copyWith =>
      _$TechnicianProfileRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TechnicianProfileRequest _$TechnicianProfileRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'TechnicianProfileRequest',
  json,
  ($checkedConvert) {
    final val = TechnicianProfileRequest(
      specialties: $checkedConvert(
        'specialties',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => $enumDecode(
                _$TechnicianProfileRequestSpecialtiesEnumEnumMap,
                e,
              ),
            )
            .toList(),
      ),
      coverageZones: $checkedConvert(
        'coverage_zones',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      isAvailable: $checkedConvert('is_available', (v) => v as bool?),
    );
    return val;
  },
  fieldKeyMap: const {
    'coverageZones': 'coverage_zones',
    'isAvailable': 'is_available',
  },
);

Map<String, dynamic> _$TechnicianProfileRequestToJson(
  TechnicianProfileRequest instance,
) => <String, dynamic>{
  'specialties': ?instance.specialties
      ?.map((e) => _$TechnicianProfileRequestSpecialtiesEnumEnumMap[e]!)
      .toList(),
  'coverage_zones': ?instance.coverageZones,
  'is_available': ?instance.isAvailable,
};

const _$TechnicianProfileRequestSpecialtiesEnumEnumMap = {
  TechnicianProfileRequestSpecialtiesEnum.garantia: 'garantia',
  TechnicianProfileRequestSpecialtiesEnum.instalacion: 'instalacion',
  TechnicianProfileRequestSpecialtiesEnum.falla: 'falla',
  TechnicianProfileRequestSpecialtiesEnum.consulta: 'consulta',
  TechnicianProfileRequestSpecialtiesEnum.otro: 'otro',
};
