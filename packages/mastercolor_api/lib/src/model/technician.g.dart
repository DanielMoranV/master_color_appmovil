// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'technician.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TechnicianCWProxy {
  Technician id(int? id);

  Technician name(String? name);

  Technician email(String? email);

  Technician phone(String? phone);

  Technician active(bool? active);

  Technician isAvailable(bool? isAvailable);

  Technician specialties(List<TechnicianSpecialtiesEnum>? specialties);

  Technician coverageZones(List<String>? coverageZones);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Technician(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Technician(...).copyWith(id: 12, name: "My name")
  /// ````
  Technician call({
    int? id,
    String? name,
    String? email,
    String? phone,
    bool? active,
    bool? isAvailable,
    List<TechnicianSpecialtiesEnum>? specialties,
    List<String>? coverageZones,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTechnician.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTechnician.copyWith.fieldName(...)`
class _$TechnicianCWProxyImpl implements _$TechnicianCWProxy {
  const _$TechnicianCWProxyImpl(this._value);

  final Technician _value;

  @override
  Technician id(int? id) => this(id: id);

  @override
  Technician name(String? name) => this(name: name);

  @override
  Technician email(String? email) => this(email: email);

  @override
  Technician phone(String? phone) => this(phone: phone);

  @override
  Technician active(bool? active) => this(active: active);

  @override
  Technician isAvailable(bool? isAvailable) => this(isAvailable: isAvailable);

  @override
  Technician specialties(List<TechnicianSpecialtiesEnum>? specialties) =>
      this(specialties: specialties);

  @override
  Technician coverageZones(List<String>? coverageZones) =>
      this(coverageZones: coverageZones);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Technician(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Technician(...).copyWith(id: 12, name: "My name")
  /// ````
  Technician call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? phone = const $CopyWithPlaceholder(),
    Object? active = const $CopyWithPlaceholder(),
    Object? isAvailable = const $CopyWithPlaceholder(),
    Object? specialties = const $CopyWithPlaceholder(),
    Object? coverageZones = const $CopyWithPlaceholder(),
  }) {
    return Technician(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      phone: phone == const $CopyWithPlaceholder()
          ? _value.phone
          // ignore: cast_nullable_to_non_nullable
          : phone as String?,
      active: active == const $CopyWithPlaceholder()
          ? _value.active
          // ignore: cast_nullable_to_non_nullable
          : active as bool?,
      isAvailable: isAvailable == const $CopyWithPlaceholder()
          ? _value.isAvailable
          // ignore: cast_nullable_to_non_nullable
          : isAvailable as bool?,
      specialties: specialties == const $CopyWithPlaceholder()
          ? _value.specialties
          // ignore: cast_nullable_to_non_nullable
          : specialties as List<TechnicianSpecialtiesEnum>?,
      coverageZones: coverageZones == const $CopyWithPlaceholder()
          ? _value.coverageZones
          // ignore: cast_nullable_to_non_nullable
          : coverageZones as List<String>?,
    );
  }
}

extension $TechnicianCopyWith on Technician {
  /// Returns a callable class that can be used as follows: `instanceOfTechnician.copyWith(...)` or like so:`instanceOfTechnician.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TechnicianCWProxy get copyWith => _$TechnicianCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Technician _$TechnicianFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Technician',
  json,
  ($checkedConvert) {
    final val = Technician(
      id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
      name: $checkedConvert('name', (v) => v as String?),
      email: $checkedConvert('email', (v) => v as String?),
      phone: $checkedConvert('phone', (v) => v as String?),
      active: $checkedConvert('active', (v) => v as bool?),
      isAvailable: $checkedConvert('is_available', (v) => v as bool?),
      specialties: $checkedConvert(
        'specialties',
        (v) => (v as List<dynamic>?)
            ?.map((e) => $enumDecode(_$TechnicianSpecialtiesEnumEnumMap, e))
            .toList(),
      ),
      coverageZones: $checkedConvert(
        'coverage_zones',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'isAvailable': 'is_available',
    'coverageZones': 'coverage_zones',
  },
);

Map<String, dynamic> _$TechnicianToJson(Technician instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'name': ?instance.name,
      'email': ?instance.email,
      'phone': ?instance.phone,
      'active': ?instance.active,
      'is_available': ?instance.isAvailable,
      'specialties': ?instance.specialties
          ?.map((e) => _$TechnicianSpecialtiesEnumEnumMap[e]!)
          .toList(),
      'coverage_zones': ?instance.coverageZones,
    };

const _$TechnicianSpecialtiesEnumEnumMap = {
  TechnicianSpecialtiesEnum.garantia: 'garantia',
  TechnicianSpecialtiesEnum.instalacion: 'instalacion',
  TechnicianSpecialtiesEnum.falla: 'falla',
  TechnicianSpecialtiesEnum.consulta: 'consulta',
  TechnicianSpecialtiesEnum.otro: 'otro',
};
