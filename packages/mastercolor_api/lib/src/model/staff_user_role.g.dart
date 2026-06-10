// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_user_role.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$StaffUserRoleCWProxy {
  StaffUserRole id(int? id);

  StaffUserRole name(String? name);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StaffUserRole(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StaffUserRole(...).copyWith(id: 12, name: "My name")
  /// ````
  StaffUserRole call({int? id, String? name});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfStaffUserRole.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfStaffUserRole.copyWith.fieldName(...)`
class _$StaffUserRoleCWProxyImpl implements _$StaffUserRoleCWProxy {
  const _$StaffUserRoleCWProxyImpl(this._value);

  final StaffUserRole _value;

  @override
  StaffUserRole id(int? id) => this(id: id);

  @override
  StaffUserRole name(String? name) => this(name: name);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StaffUserRole(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StaffUserRole(...).copyWith(id: 12, name: "My name")
  /// ````
  StaffUserRole call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
  }) {
    return StaffUserRole(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
    );
  }
}

extension $StaffUserRoleCopyWith on StaffUserRole {
  /// Returns a callable class that can be used as follows: `instanceOfStaffUserRole.copyWith(...)` or like so:`instanceOfStaffUserRole.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$StaffUserRoleCWProxy get copyWith => _$StaffUserRoleCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StaffUserRole _$StaffUserRoleFromJson(Map<String, dynamic> json) =>
    $checkedCreate('StaffUserRole', json, ($checkedConvert) {
      final val = StaffUserRole(
        id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
        name: $checkedConvert('name', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$StaffUserRoleToJson(StaffUserRole instance) =>
    <String, dynamic>{'id': ?instance.id, 'name': ?instance.name};
