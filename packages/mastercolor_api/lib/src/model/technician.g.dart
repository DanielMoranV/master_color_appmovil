// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'technician.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TechnicianCWProxy {
  Technician id(int? id);

  Technician name(String? name);

  Technician email(String? email);

  Technician active(bool? active);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Technician(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Technician(...).copyWith(id: 12, name: "My name")
  /// ````
  Technician call({int? id, String? name, String? email, bool? active});
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
  Technician active(bool? active) => this(active: active);

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
    Object? active = const $CopyWithPlaceholder(),
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
      active: active == const $CopyWithPlaceholder()
          ? _value.active
          // ignore: cast_nullable_to_non_nullable
          : active as bool?,
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

Technician _$TechnicianFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Technician', json, ($checkedConvert) {
      final val = Technician(
        id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
        name: $checkedConvert('name', (v) => v as String?),
        email: $checkedConvert('email', (v) => v as String?),
        active: $checkedConvert('active', (v) => v as bool?),
      );
      return val;
    });

Map<String, dynamic> _$TechnicianToJson(Technician instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'name': ?instance.name,
      'email': ?instance.email,
      'active': ?instance.active,
    };
