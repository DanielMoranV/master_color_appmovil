// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_user.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$StaffUserCWProxy {
  StaffUser id(int? id);

  StaffUser name(String? name);

  StaffUser email(String? email);

  StaffUser role(StaffUserRole? role);

  StaffUser roleName(String? roleName);

  StaffUser isActive(bool? isActive);

  StaffUser phone(String? phone);

  StaffUser dni(String? dni);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StaffUser(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StaffUser(...).copyWith(id: 12, name: "My name")
  /// ````
  StaffUser call({
    int? id,
    String? name,
    String? email,
    StaffUserRole? role,
    String? roleName,
    bool? isActive,
    String? phone,
    String? dni,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfStaffUser.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfStaffUser.copyWith.fieldName(...)`
class _$StaffUserCWProxyImpl implements _$StaffUserCWProxy {
  const _$StaffUserCWProxyImpl(this._value);

  final StaffUser _value;

  @override
  StaffUser id(int? id) => this(id: id);

  @override
  StaffUser name(String? name) => this(name: name);

  @override
  StaffUser email(String? email) => this(email: email);

  @override
  StaffUser role(StaffUserRole? role) => this(role: role);

  @override
  StaffUser roleName(String? roleName) => this(roleName: roleName);

  @override
  StaffUser isActive(bool? isActive) => this(isActive: isActive);

  @override
  StaffUser phone(String? phone) => this(phone: phone);

  @override
  StaffUser dni(String? dni) => this(dni: dni);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StaffUser(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StaffUser(...).copyWith(id: 12, name: "My name")
  /// ````
  StaffUser call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? role = const $CopyWithPlaceholder(),
    Object? roleName = const $CopyWithPlaceholder(),
    Object? isActive = const $CopyWithPlaceholder(),
    Object? phone = const $CopyWithPlaceholder(),
    Object? dni = const $CopyWithPlaceholder(),
  }) {
    return StaffUser(
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
      role: role == const $CopyWithPlaceholder()
          ? _value.role
          // ignore: cast_nullable_to_non_nullable
          : role as StaffUserRole?,
      roleName: roleName == const $CopyWithPlaceholder()
          ? _value.roleName
          // ignore: cast_nullable_to_non_nullable
          : roleName as String?,
      isActive: isActive == const $CopyWithPlaceholder()
          ? _value.isActive
          // ignore: cast_nullable_to_non_nullable
          : isActive as bool?,
      phone: phone == const $CopyWithPlaceholder()
          ? _value.phone
          // ignore: cast_nullable_to_non_nullable
          : phone as String?,
      dni: dni == const $CopyWithPlaceholder()
          ? _value.dni
          // ignore: cast_nullable_to_non_nullable
          : dni as String?,
    );
  }
}

extension $StaffUserCopyWith on StaffUser {
  /// Returns a callable class that can be used as follows: `instanceOfStaffUser.copyWith(...)` or like so:`instanceOfStaffUser.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$StaffUserCWProxy get copyWith => _$StaffUserCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StaffUser _$StaffUserFromJson(Map<String, dynamic> json) => $checkedCreate(
  'StaffUser',
  json,
  ($checkedConvert) {
    final val = StaffUser(
      id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
      name: $checkedConvert('name', (v) => v as String?),
      email: $checkedConvert('email', (v) => v as String?),
      role: $checkedConvert(
        'role',
        (v) => v == null
            ? null
            : StaffUserRole.fromJson(v as Map<String, dynamic>),
      ),
      roleName: $checkedConvert('role_name', (v) => v as String?),
      isActive: $checkedConvert('is_active', (v) => v as bool?),
      phone: $checkedConvert('phone', (v) => v as String?),
      dni: $checkedConvert('dni', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {'roleName': 'role_name', 'isActive': 'is_active'},
);

Map<String, dynamic> _$StaffUserToJson(StaffUser instance) => <String, dynamic>{
  'id': ?instance.id,
  'name': ?instance.name,
  'email': ?instance.email,
  'role': ?instance.role?.toJson(),
  'role_name': ?instance.roleName,
  'is_active': ?instance.isActive,
  'phone': ?instance.phone,
  'dni': ?instance.dni,
};
