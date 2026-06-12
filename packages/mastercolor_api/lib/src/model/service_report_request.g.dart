// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_report_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ServiceReportRequestCWProxy {
  ServiceReportRequest workDone(String workDone);

  ServiceReportRequest clientSignedName(String? clientSignedName);

  ServiceReportRequest clientSignature(String? clientSignature);

  ServiceReportRequest clientSignatureFile(MultipartFile? clientSignatureFile);

  ServiceReportRequest parts(List<ServiceReportRequestPartsInner>? parts);

  ServiceReportRequest photos(List<MultipartFile>? photos);

  ServiceReportRequest resolve(bool? resolve);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ServiceReportRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ServiceReportRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ServiceReportRequest call({
    String workDone,
    String? clientSignedName,
    String? clientSignature,
    MultipartFile? clientSignatureFile,
    List<ServiceReportRequestPartsInner>? parts,
    List<MultipartFile>? photos,
    bool? resolve,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfServiceReportRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfServiceReportRequest.copyWith.fieldName(...)`
class _$ServiceReportRequestCWProxyImpl
    implements _$ServiceReportRequestCWProxy {
  const _$ServiceReportRequestCWProxyImpl(this._value);

  final ServiceReportRequest _value;

  @override
  ServiceReportRequest workDone(String workDone) => this(workDone: workDone);

  @override
  ServiceReportRequest clientSignedName(String? clientSignedName) =>
      this(clientSignedName: clientSignedName);

  @override
  ServiceReportRequest clientSignature(String? clientSignature) =>
      this(clientSignature: clientSignature);

  @override
  ServiceReportRequest clientSignatureFile(
    MultipartFile? clientSignatureFile,
  ) => this(clientSignatureFile: clientSignatureFile);

  @override
  ServiceReportRequest parts(List<ServiceReportRequestPartsInner>? parts) =>
      this(parts: parts);

  @override
  ServiceReportRequest photos(List<MultipartFile>? photos) =>
      this(photos: photos);

  @override
  ServiceReportRequest resolve(bool? resolve) => this(resolve: resolve);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ServiceReportRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ServiceReportRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ServiceReportRequest call({
    Object? workDone = const $CopyWithPlaceholder(),
    Object? clientSignedName = const $CopyWithPlaceholder(),
    Object? clientSignature = const $CopyWithPlaceholder(),
    Object? clientSignatureFile = const $CopyWithPlaceholder(),
    Object? parts = const $CopyWithPlaceholder(),
    Object? photos = const $CopyWithPlaceholder(),
    Object? resolve = const $CopyWithPlaceholder(),
  }) {
    return ServiceReportRequest(
      workDone: workDone == const $CopyWithPlaceholder()
          ? _value.workDone
          // ignore: cast_nullable_to_non_nullable
          : workDone as String,
      clientSignedName: clientSignedName == const $CopyWithPlaceholder()
          ? _value.clientSignedName
          // ignore: cast_nullable_to_non_nullable
          : clientSignedName as String?,
      clientSignature: clientSignature == const $CopyWithPlaceholder()
          ? _value.clientSignature
          // ignore: cast_nullable_to_non_nullable
          : clientSignature as String?,
      clientSignatureFile: clientSignatureFile == const $CopyWithPlaceholder()
          ? _value.clientSignatureFile
          // ignore: cast_nullable_to_non_nullable
          : clientSignatureFile as MultipartFile?,
      parts: parts == const $CopyWithPlaceholder()
          ? _value.parts
          // ignore: cast_nullable_to_non_nullable
          : parts as List<ServiceReportRequestPartsInner>?,
      photos: photos == const $CopyWithPlaceholder()
          ? _value.photos
          // ignore: cast_nullable_to_non_nullable
          : photos as List<MultipartFile>?,
      resolve: resolve == const $CopyWithPlaceholder()
          ? _value.resolve
          // ignore: cast_nullable_to_non_nullable
          : resolve as bool?,
    );
  }
}

extension $ServiceReportRequestCopyWith on ServiceReportRequest {
  /// Returns a callable class that can be used as follows: `instanceOfServiceReportRequest.copyWith(...)` or like so:`instanceOfServiceReportRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ServiceReportRequestCWProxy get copyWith =>
      _$ServiceReportRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceReportRequest _$ServiceReportRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ServiceReportRequest',
  json,
  ($checkedConvert) {
    $checkKeys(json, requiredKeys: const ['work_done']);
    final val = ServiceReportRequest(
      workDone: $checkedConvert('work_done', (v) => v as String),
      clientSignedName: $checkedConvert(
        'client_signed_name',
        (v) => v as String?,
      ),
      clientSignature: $checkedConvert('client_signature', (v) => v as String?),
      parts: $checkedConvert(
        'parts',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => ServiceReportRequestPartsInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      resolve: $checkedConvert('resolve', (v) => v as bool?),
    );
    return val;
  },
  fieldKeyMap: const {
    'workDone': 'work_done',
    'clientSignedName': 'client_signed_name',
    'clientSignature': 'client_signature',
  },
);

Map<String, dynamic> _$ServiceReportRequestToJson(
  ServiceReportRequest instance,
) => <String, dynamic>{
  'work_done': instance.workDone,
  'client_signed_name': ?instance.clientSignedName,
  'client_signature': ?instance.clientSignature,
  'parts': ?instance.parts?.map((e) => e.toJson()).toList(),
  'resolve': ?instance.resolve,
};
