// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_me_get200_response_all_of_data.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AuthMeGet200ResponseAllOfDataCWProxy {
  AuthMeGet200ResponseAllOfData user(StaffUser? user);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthMeGet200ResponseAllOfData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthMeGet200ResponseAllOfData(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthMeGet200ResponseAllOfData call({StaffUser? user});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAuthMeGet200ResponseAllOfData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAuthMeGet200ResponseAllOfData.copyWith.fieldName(...)`
class _$AuthMeGet200ResponseAllOfDataCWProxyImpl
    implements _$AuthMeGet200ResponseAllOfDataCWProxy {
  const _$AuthMeGet200ResponseAllOfDataCWProxyImpl(this._value);

  final AuthMeGet200ResponseAllOfData _value;

  @override
  AuthMeGet200ResponseAllOfData user(StaffUser? user) => this(user: user);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthMeGet200ResponseAllOfData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthMeGet200ResponseAllOfData(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthMeGet200ResponseAllOfData call({
    Object? user = const $CopyWithPlaceholder(),
  }) {
    return AuthMeGet200ResponseAllOfData(
      user: user == const $CopyWithPlaceholder()
          ? _value.user
          // ignore: cast_nullable_to_non_nullable
          : user as StaffUser?,
    );
  }
}

extension $AuthMeGet200ResponseAllOfDataCopyWith
    on AuthMeGet200ResponseAllOfData {
  /// Returns a callable class that can be used as follows: `instanceOfAuthMeGet200ResponseAllOfData.copyWith(...)` or like so:`instanceOfAuthMeGet200ResponseAllOfData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AuthMeGet200ResponseAllOfDataCWProxy get copyWith =>
      _$AuthMeGet200ResponseAllOfDataCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthMeGet200ResponseAllOfData _$AuthMeGet200ResponseAllOfDataFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AuthMeGet200ResponseAllOfData', json, ($checkedConvert) {
  final val = AuthMeGet200ResponseAllOfData(
    user: $checkedConvert(
      'user',
      (v) => v == null ? null : StaffUser.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$AuthMeGet200ResponseAllOfDataToJson(
  AuthMeGet200ResponseAllOfData instance,
) => <String, dynamic>{'user': ?instance.user?.toJson()};
