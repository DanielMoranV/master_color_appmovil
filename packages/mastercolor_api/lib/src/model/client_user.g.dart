// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_user.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ClientUserCWProxy {
  ClientUser id(int? id);

  ClientUser name(String? name);

  ClientUser email(String? email);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientUser(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientUser(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientUser call({int? id, String? name, String? email});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfClientUser.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfClientUser.copyWith.fieldName(...)`
class _$ClientUserCWProxyImpl implements _$ClientUserCWProxy {
  const _$ClientUserCWProxyImpl(this._value);

  final ClientUser _value;

  @override
  ClientUser id(int? id) => this(id: id);

  @override
  ClientUser name(String? name) => this(name: name);

  @override
  ClientUser email(String? email) => this(email: email);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientUser(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientUser(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientUser call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
  }) {
    return ClientUser(
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
    );
  }
}

extension $ClientUserCopyWith on ClientUser {
  /// Returns a callable class that can be used as follows: `instanceOfClientUser.copyWith(...)` or like so:`instanceOfClientUser.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ClientUserCWProxy get copyWith => _$ClientUserCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientUser _$ClientUserFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ClientUser', json, ($checkedConvert) {
      final val = ClientUser(
        id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
        name: $checkedConvert('name', (v) => v as String?),
        email: $checkedConvert('email', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$ClientUserToJson(ClientUser instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'name': ?instance.name,
      'email': ?instance.email,
    };
