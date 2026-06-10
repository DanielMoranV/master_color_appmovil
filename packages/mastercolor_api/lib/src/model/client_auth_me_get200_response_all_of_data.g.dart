// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_auth_me_get200_response_all_of_data.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ClientAuthMeGet200ResponseAllOfDataCWProxy {
  ClientAuthMeGet200ResponseAllOfData user(ClientUser? user);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientAuthMeGet200ResponseAllOfData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientAuthMeGet200ResponseAllOfData(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientAuthMeGet200ResponseAllOfData call({ClientUser? user});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfClientAuthMeGet200ResponseAllOfData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfClientAuthMeGet200ResponseAllOfData.copyWith.fieldName(...)`
class _$ClientAuthMeGet200ResponseAllOfDataCWProxyImpl
    implements _$ClientAuthMeGet200ResponseAllOfDataCWProxy {
  const _$ClientAuthMeGet200ResponseAllOfDataCWProxyImpl(this._value);

  final ClientAuthMeGet200ResponseAllOfData _value;

  @override
  ClientAuthMeGet200ResponseAllOfData user(ClientUser? user) =>
      this(user: user);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClientAuthMeGet200ResponseAllOfData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClientAuthMeGet200ResponseAllOfData(...).copyWith(id: 12, name: "My name")
  /// ````
  ClientAuthMeGet200ResponseAllOfData call({
    Object? user = const $CopyWithPlaceholder(),
  }) {
    return ClientAuthMeGet200ResponseAllOfData(
      user: user == const $CopyWithPlaceholder()
          ? _value.user
          // ignore: cast_nullable_to_non_nullable
          : user as ClientUser?,
    );
  }
}

extension $ClientAuthMeGet200ResponseAllOfDataCopyWith
    on ClientAuthMeGet200ResponseAllOfData {
  /// Returns a callable class that can be used as follows: `instanceOfClientAuthMeGet200ResponseAllOfData.copyWith(...)` or like so:`instanceOfClientAuthMeGet200ResponseAllOfData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ClientAuthMeGet200ResponseAllOfDataCWProxy get copyWith =>
      _$ClientAuthMeGet200ResponseAllOfDataCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientAuthMeGet200ResponseAllOfData
_$ClientAuthMeGet200ResponseAllOfDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ClientAuthMeGet200ResponseAllOfData', json, (
      $checkedConvert,
    ) {
      final val = ClientAuthMeGet200ResponseAllOfData(
        user: $checkedConvert(
          'user',
          (v) =>
              v == null ? null : ClientUser.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ClientAuthMeGet200ResponseAllOfDataToJson(
  ClientAuthMeGet200ResponseAllOfData instance,
) => <String, dynamic>{'user': ?instance.user?.toJson()};
