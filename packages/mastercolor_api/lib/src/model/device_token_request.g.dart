// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_token_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DeviceTokenRequestCWProxy {
  DeviceTokenRequest token(String token);

  DeviceTokenRequest platform(DevicePlatform platform);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DeviceTokenRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DeviceTokenRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  DeviceTokenRequest call({String token, DevicePlatform platform});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDeviceTokenRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDeviceTokenRequest.copyWith.fieldName(...)`
class _$DeviceTokenRequestCWProxyImpl implements _$DeviceTokenRequestCWProxy {
  const _$DeviceTokenRequestCWProxyImpl(this._value);

  final DeviceTokenRequest _value;

  @override
  DeviceTokenRequest token(String token) => this(token: token);

  @override
  DeviceTokenRequest platform(DevicePlatform platform) =>
      this(platform: platform);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DeviceTokenRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DeviceTokenRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  DeviceTokenRequest call({
    Object? token = const $CopyWithPlaceholder(),
    Object? platform = const $CopyWithPlaceholder(),
  }) {
    return DeviceTokenRequest(
      token: token == const $CopyWithPlaceholder()
          ? _value.token
          // ignore: cast_nullable_to_non_nullable
          : token as String,
      platform: platform == const $CopyWithPlaceholder()
          ? _value.platform
          // ignore: cast_nullable_to_non_nullable
          : platform as DevicePlatform,
    );
  }
}

extension $DeviceTokenRequestCopyWith on DeviceTokenRequest {
  /// Returns a callable class that can be used as follows: `instanceOfDeviceTokenRequest.copyWith(...)` or like so:`instanceOfDeviceTokenRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DeviceTokenRequestCWProxy get copyWith =>
      _$DeviceTokenRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceTokenRequest _$DeviceTokenRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DeviceTokenRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['token', 'platform']);
      final val = DeviceTokenRequest(
        token: $checkedConvert('token', (v) => v as String),
        platform: $checkedConvert(
          'platform',
          (v) => $enumDecode(_$DevicePlatformEnumMap, v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$DeviceTokenRequestToJson(DeviceTokenRequest instance) =>
    <String, dynamic>{
      'token': instance.token,
      'platform': _$DevicePlatformEnumMap[instance.platform]!,
    };

const _$DevicePlatformEnumMap = {
  DevicePlatform.android: 'android',
  DevicePlatform.ios: 'ios',
};
