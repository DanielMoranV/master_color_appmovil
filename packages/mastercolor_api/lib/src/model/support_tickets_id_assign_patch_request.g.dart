// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_tickets_id_assign_patch_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SupportTicketsIdAssignPatchRequestCWProxy {
  SupportTicketsIdAssignPatchRequest assignedUserId(int assignedUserId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SupportTicketsIdAssignPatchRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SupportTicketsIdAssignPatchRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  SupportTicketsIdAssignPatchRequest call({int assignedUserId});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSupportTicketsIdAssignPatchRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSupportTicketsIdAssignPatchRequest.copyWith.fieldName(...)`
class _$SupportTicketsIdAssignPatchRequestCWProxyImpl
    implements _$SupportTicketsIdAssignPatchRequestCWProxy {
  const _$SupportTicketsIdAssignPatchRequestCWProxyImpl(this._value);

  final SupportTicketsIdAssignPatchRequest _value;

  @override
  SupportTicketsIdAssignPatchRequest assignedUserId(int assignedUserId) =>
      this(assignedUserId: assignedUserId);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SupportTicketsIdAssignPatchRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SupportTicketsIdAssignPatchRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  SupportTicketsIdAssignPatchRequest call({
    Object? assignedUserId = const $CopyWithPlaceholder(),
  }) {
    return SupportTicketsIdAssignPatchRequest(
      assignedUserId: assignedUserId == const $CopyWithPlaceholder()
          ? _value.assignedUserId
          // ignore: cast_nullable_to_non_nullable
          : assignedUserId as int,
    );
  }
}

extension $SupportTicketsIdAssignPatchRequestCopyWith
    on SupportTicketsIdAssignPatchRequest {
  /// Returns a callable class that can be used as follows: `instanceOfSupportTicketsIdAssignPatchRequest.copyWith(...)` or like so:`instanceOfSupportTicketsIdAssignPatchRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SupportTicketsIdAssignPatchRequestCWProxy get copyWith =>
      _$SupportTicketsIdAssignPatchRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupportTicketsIdAssignPatchRequest _$SupportTicketsIdAssignPatchRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'SupportTicketsIdAssignPatchRequest',
  json,
  ($checkedConvert) {
    $checkKeys(json, requiredKeys: const ['assigned_user_id']);
    final val = SupportTicketsIdAssignPatchRequest(
      assignedUserId: $checkedConvert(
        'assigned_user_id',
        (v) => (v as num).toInt(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'assignedUserId': 'assigned_user_id'},
);

Map<String, dynamic> _$SupportTicketsIdAssignPatchRequestToJson(
  SupportTicketsIdAssignPatchRequest instance,
) => <String, dynamic>{'assigned_user_id': instance.assignedUserId};
