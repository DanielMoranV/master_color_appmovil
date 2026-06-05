// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diagnosis_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DiagnosisRequestCWProxy {
  DiagnosisRequest diagnosis(String diagnosis);

  DiagnosisRequest partsUsed(String? partsUsed);

  DiagnosisRequest resolve(bool? resolve);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DiagnosisRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DiagnosisRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  DiagnosisRequest call({String diagnosis, String? partsUsed, bool? resolve});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDiagnosisRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDiagnosisRequest.copyWith.fieldName(...)`
class _$DiagnosisRequestCWProxyImpl implements _$DiagnosisRequestCWProxy {
  const _$DiagnosisRequestCWProxyImpl(this._value);

  final DiagnosisRequest _value;

  @override
  DiagnosisRequest diagnosis(String diagnosis) => this(diagnosis: diagnosis);

  @override
  DiagnosisRequest partsUsed(String? partsUsed) => this(partsUsed: partsUsed);

  @override
  DiagnosisRequest resolve(bool? resolve) => this(resolve: resolve);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DiagnosisRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DiagnosisRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  DiagnosisRequest call({
    Object? diagnosis = const $CopyWithPlaceholder(),
    Object? partsUsed = const $CopyWithPlaceholder(),
    Object? resolve = const $CopyWithPlaceholder(),
  }) {
    return DiagnosisRequest(
      diagnosis: diagnosis == const $CopyWithPlaceholder()
          ? _value.diagnosis
          // ignore: cast_nullable_to_non_nullable
          : diagnosis as String,
      partsUsed: partsUsed == const $CopyWithPlaceholder()
          ? _value.partsUsed
          // ignore: cast_nullable_to_non_nullable
          : partsUsed as String?,
      resolve: resolve == const $CopyWithPlaceholder()
          ? _value.resolve
          // ignore: cast_nullable_to_non_nullable
          : resolve as bool?,
    );
  }
}

extension $DiagnosisRequestCopyWith on DiagnosisRequest {
  /// Returns a callable class that can be used as follows: `instanceOfDiagnosisRequest.copyWith(...)` or like so:`instanceOfDiagnosisRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DiagnosisRequestCWProxy get copyWith => _$DiagnosisRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiagnosisRequest _$DiagnosisRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DiagnosisRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['diagnosis']);
      final val = DiagnosisRequest(
        diagnosis: $checkedConvert('diagnosis', (v) => v as String),
        partsUsed: $checkedConvert('parts_used', (v) => v as String?),
        resolve: $checkedConvert('resolve', (v) => v as bool? ?? false),
      );
      return val;
    }, fieldKeyMap: const {'partsUsed': 'parts_used'});

Map<String, dynamic> _$DiagnosisRequestToJson(DiagnosisRequest instance) =>
    <String, dynamic>{
      'diagnosis': instance.diagnosis,
      'parts_used': ?instance.partsUsed,
      'resolve': ?instance.resolve,
    };
