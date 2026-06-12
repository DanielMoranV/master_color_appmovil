// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_ticket_client.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SupportTicketClientCWProxy {
  SupportTicketClient id(int? id);

  SupportTicketClient name(String? name);

  SupportTicketClient email(String? email);

  SupportTicketClient phone(String? phone);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SupportTicketClient(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SupportTicketClient(...).copyWith(id: 12, name: "My name")
  /// ````
  SupportTicketClient call({
    int? id,
    String? name,
    String? email,
    String? phone,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSupportTicketClient.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSupportTicketClient.copyWith.fieldName(...)`
class _$SupportTicketClientCWProxyImpl implements _$SupportTicketClientCWProxy {
  const _$SupportTicketClientCWProxyImpl(this._value);

  final SupportTicketClient _value;

  @override
  SupportTicketClient id(int? id) => this(id: id);

  @override
  SupportTicketClient name(String? name) => this(name: name);

  @override
  SupportTicketClient email(String? email) => this(email: email);

  @override
  SupportTicketClient phone(String? phone) => this(phone: phone);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SupportTicketClient(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SupportTicketClient(...).copyWith(id: 12, name: "My name")
  /// ````
  SupportTicketClient call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? phone = const $CopyWithPlaceholder(),
  }) {
    return SupportTicketClient(
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
    );
  }
}

extension $SupportTicketClientCopyWith on SupportTicketClient {
  /// Returns a callable class that can be used as follows: `instanceOfSupportTicketClient.copyWith(...)` or like so:`instanceOfSupportTicketClient.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SupportTicketClientCWProxy get copyWith =>
      _$SupportTicketClientCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupportTicketClient _$SupportTicketClientFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SupportTicketClient', json, ($checkedConvert) {
      final val = SupportTicketClient(
        id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
        name: $checkedConvert('name', (v) => v as String?),
        email: $checkedConvert('email', (v) => v as String?),
        phone: $checkedConvert('phone', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$SupportTicketClientToJson(
  SupportTicketClient instance,
) => <String, dynamic>{
  'id': ?instance.id,
  'name': ?instance.name,
  'email': ?instance.email,
  'phone': ?instance.phone,
};
