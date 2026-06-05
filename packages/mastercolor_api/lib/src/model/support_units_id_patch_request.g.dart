// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_units_id_patch_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SupportUnitsIdPatchRequestCWProxy {
  SupportUnitsIdPatchRequest serialNumber(String? serialNumber);

  SupportUnitsIdPatchRequest status(SoldUnitStatus? status);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SupportUnitsIdPatchRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SupportUnitsIdPatchRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  SupportUnitsIdPatchRequest call({
    String? serialNumber,
    SoldUnitStatus? status,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSupportUnitsIdPatchRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSupportUnitsIdPatchRequest.copyWith.fieldName(...)`
class _$SupportUnitsIdPatchRequestCWProxyImpl
    implements _$SupportUnitsIdPatchRequestCWProxy {
  const _$SupportUnitsIdPatchRequestCWProxyImpl(this._value);

  final SupportUnitsIdPatchRequest _value;

  @override
  SupportUnitsIdPatchRequest serialNumber(String? serialNumber) =>
      this(serialNumber: serialNumber);

  @override
  SupportUnitsIdPatchRequest status(SoldUnitStatus? status) =>
      this(status: status);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SupportUnitsIdPatchRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SupportUnitsIdPatchRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  SupportUnitsIdPatchRequest call({
    Object? serialNumber = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
  }) {
    return SupportUnitsIdPatchRequest(
      serialNumber: serialNumber == const $CopyWithPlaceholder()
          ? _value.serialNumber
          // ignore: cast_nullable_to_non_nullable
          : serialNumber as String?,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as SoldUnitStatus?,
    );
  }
}

extension $SupportUnitsIdPatchRequestCopyWith on SupportUnitsIdPatchRequest {
  /// Returns a callable class that can be used as follows: `instanceOfSupportUnitsIdPatchRequest.copyWith(...)` or like so:`instanceOfSupportUnitsIdPatchRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SupportUnitsIdPatchRequestCWProxy get copyWith =>
      _$SupportUnitsIdPatchRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupportUnitsIdPatchRequest _$SupportUnitsIdPatchRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'SupportUnitsIdPatchRequest',
  json,
  ($checkedConvert) {
    final val = SupportUnitsIdPatchRequest(
      serialNumber: $checkedConvert('serial_number', (v) => v as String?),
      status: $checkedConvert(
        'status',
        (v) => $enumDecodeNullable(_$SoldUnitStatusEnumMap, v),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'serialNumber': 'serial_number'},
);

Map<String, dynamic> _$SupportUnitsIdPatchRequestToJson(
  SupportUnitsIdPatchRequest instance,
) => <String, dynamic>{
  'serial_number': ?instance.serialNumber,
  'status': ?_$SoldUnitStatusEnumMap[instance.status],
};

const _$SoldUnitStatusEnumMap = {
  SoldUnitStatus.activa: 'activa',
  SoldUnitStatus.enServicio: 'en_servicio',
  SoldUnitStatus.baja: 'baja',
};
