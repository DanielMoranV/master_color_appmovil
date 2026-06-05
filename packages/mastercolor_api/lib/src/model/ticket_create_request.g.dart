// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_create_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TicketCreateRequestCWProxy {
  TicketCreateRequest soldUnitId(int? soldUnitId);

  TicketCreateRequest category(TicketCategory category);

  TicketCreateRequest priority(TicketPriority? priority);

  TicketCreateRequest subject(String subject);

  TicketCreateRequest description(String description);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketCreateRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketCreateRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketCreateRequest call({
    int? soldUnitId,
    TicketCategory category,
    TicketPriority? priority,
    String subject,
    String description,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTicketCreateRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTicketCreateRequest.copyWith.fieldName(...)`
class _$TicketCreateRequestCWProxyImpl implements _$TicketCreateRequestCWProxy {
  const _$TicketCreateRequestCWProxyImpl(this._value);

  final TicketCreateRequest _value;

  @override
  TicketCreateRequest soldUnitId(int? soldUnitId) =>
      this(soldUnitId: soldUnitId);

  @override
  TicketCreateRequest category(TicketCategory category) =>
      this(category: category);

  @override
  TicketCreateRequest priority(TicketPriority? priority) =>
      this(priority: priority);

  @override
  TicketCreateRequest subject(String subject) => this(subject: subject);

  @override
  TicketCreateRequest description(String description) =>
      this(description: description);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketCreateRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketCreateRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketCreateRequest call({
    Object? soldUnitId = const $CopyWithPlaceholder(),
    Object? category = const $CopyWithPlaceholder(),
    Object? priority = const $CopyWithPlaceholder(),
    Object? subject = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
  }) {
    return TicketCreateRequest(
      soldUnitId: soldUnitId == const $CopyWithPlaceholder()
          ? _value.soldUnitId
          // ignore: cast_nullable_to_non_nullable
          : soldUnitId as int?,
      category: category == const $CopyWithPlaceholder()
          ? _value.category
          // ignore: cast_nullable_to_non_nullable
          : category as TicketCategory,
      priority: priority == const $CopyWithPlaceholder()
          ? _value.priority
          // ignore: cast_nullable_to_non_nullable
          : priority as TicketPriority?,
      subject: subject == const $CopyWithPlaceholder()
          ? _value.subject
          // ignore: cast_nullable_to_non_nullable
          : subject as String,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String,
    );
  }
}

extension $TicketCreateRequestCopyWith on TicketCreateRequest {
  /// Returns a callable class that can be used as follows: `instanceOfTicketCreateRequest.copyWith(...)` or like so:`instanceOfTicketCreateRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TicketCreateRequestCWProxy get copyWith =>
      _$TicketCreateRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketCreateRequest _$TicketCreateRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('TicketCreateRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['category', 'subject', 'description']);
  final val = TicketCreateRequest(
    soldUnitId: $checkedConvert('sold_unit_id', (v) => (v as num?)?.toInt()),
    category: $checkedConvert(
      'category',
      (v) => $enumDecode(_$TicketCategoryEnumMap, v),
    ),
    priority: $checkedConvert(
      'priority',
      (v) => $enumDecodeNullable(_$TicketPriorityEnumMap, v),
    ),
    subject: $checkedConvert('subject', (v) => v as String),
    description: $checkedConvert('description', (v) => v as String),
  );
  return val;
}, fieldKeyMap: const {'soldUnitId': 'sold_unit_id'});

Map<String, dynamic> _$TicketCreateRequestToJson(
  TicketCreateRequest instance,
) => <String, dynamic>{
  'sold_unit_id': ?instance.soldUnitId,
  'category': _$TicketCategoryEnumMap[instance.category]!,
  'priority': ?_$TicketPriorityEnumMap[instance.priority],
  'subject': instance.subject,
  'description': instance.description,
};

const _$TicketCategoryEnumMap = {
  TicketCategory.garantia: 'garantia',
  TicketCategory.instalacion: 'instalacion',
  TicketCategory.falla: 'falla',
  TicketCategory.consulta: 'consulta',
  TicketCategory.otro: 'otro',
};

const _$TicketPriorityEnumMap = {
  TicketPriority.baja: 'baja',
  TicketPriority.media: 'media',
  TicketPriority.alta: 'alta',
  TicketPriority.urgente: 'urgente',
};
