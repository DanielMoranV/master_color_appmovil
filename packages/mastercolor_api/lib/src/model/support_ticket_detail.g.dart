// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_ticket_detail.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SupportTicketDetailCWProxy {
  SupportTicketDetail id(int? id);

  SupportTicketDetail code(String? code);

  SupportTicketDetail clientId(int? clientId);

  SupportTicketDetail soldUnitId(int? soldUnitId);

  SupportTicketDetail productId(int? productId);

  SupportTicketDetail category(TicketCategory? category);

  SupportTicketDetail priority(TicketPriority? priority);

  SupportTicketDetail subject(String? subject);

  SupportTicketDetail description(String? description);

  SupportTicketDetail status(TicketStatus? status);

  SupportTicketDetail channel(TicketChannel? channel);

  SupportTicketDetail serviceType(
    SupportTicketDetailServiceTypeEnum? serviceType,
  );

  SupportTicketDetail serviceAddressId(int? serviceAddressId);

  SupportTicketDetail scheduledAt(DateTime? scheduledAt);

  SupportTicketDetail scheduledWindowMinutes(int? scheduledWindowMinutes);

  SupportTicketDetail assignedUserId(int? assignedUserId);

  SupportTicketDetail assignedUserName(String? assignedUserName);

  SupportTicketDetail isWarrantyCovered(bool? isWarrantyCovered);

  SupportTicketDetail slaDueAt(DateTime? slaDueAt);

  SupportTicketDetail slaStatus(SupportTicketDetailSlaStatusEnum? slaStatus);

  SupportTicketDetail firstResponseAt(DateTime? firstResponseAt);

  SupportTicketDetail resolvedAt(DateTime? resolvedAt);

  SupportTicketDetail closedAt(DateTime? closedAt);

  SupportTicketDetail rating(int? rating);

  SupportTicketDetail ratingComment(String? ratingComment);

  SupportTicketDetail createdAt(DateTime? createdAt);

  SupportTicketDetail updatedAt(DateTime? updatedAt);

  SupportTicketDetail client(SupportTicketClient? client);

  SupportTicketDetail serviceAddress(Address? serviceAddress);

  SupportTicketDetail soldUnit(SoldUnit? soldUnit);

  SupportTicketDetail messages(List<TicketMessage>? messages);

  SupportTicketDetail attachments(List<TicketAttachment>? attachments);

  SupportTicketDetail statusHistory(List<TicketStatusHistory>? statusHistory);

  SupportTicketDetail diagnosis(String? diagnosis);

  SupportTicketDetail partsUsed(String? partsUsed);

  SupportTicketDetail parts(List<TicketPart>? parts);

  SupportTicketDetail visits(List<TicketVisit>? visits);

  SupportTicketDetail quote(TicketQuote? quote);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SupportTicketDetail(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SupportTicketDetail(...).copyWith(id: 12, name: "My name")
  /// ````
  SupportTicketDetail call({
    int? id,
    String? code,
    int? clientId,
    int? soldUnitId,
    int? productId,
    TicketCategory? category,
    TicketPriority? priority,
    String? subject,
    String? description,
    TicketStatus? status,
    TicketChannel? channel,
    SupportTicketDetailServiceTypeEnum? serviceType,
    int? serviceAddressId,
    DateTime? scheduledAt,
    int? scheduledWindowMinutes,
    int? assignedUserId,
    String? assignedUserName,
    bool? isWarrantyCovered,
    DateTime? slaDueAt,
    SupportTicketDetailSlaStatusEnum? slaStatus,
    DateTime? firstResponseAt,
    DateTime? resolvedAt,
    DateTime? closedAt,
    int? rating,
    String? ratingComment,
    DateTime? createdAt,
    DateTime? updatedAt,
    SupportTicketClient? client,
    Address? serviceAddress,
    SoldUnit? soldUnit,
    List<TicketMessage>? messages,
    List<TicketAttachment>? attachments,
    List<TicketStatusHistory>? statusHistory,
    String? diagnosis,
    String? partsUsed,
    List<TicketPart>? parts,
    List<TicketVisit>? visits,
    TicketQuote? quote,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSupportTicketDetail.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSupportTicketDetail.copyWith.fieldName(...)`
class _$SupportTicketDetailCWProxyImpl implements _$SupportTicketDetailCWProxy {
  const _$SupportTicketDetailCWProxyImpl(this._value);

  final SupportTicketDetail _value;

  @override
  SupportTicketDetail id(int? id) => this(id: id);

  @override
  SupportTicketDetail code(String? code) => this(code: code);

  @override
  SupportTicketDetail clientId(int? clientId) => this(clientId: clientId);

  @override
  SupportTicketDetail soldUnitId(int? soldUnitId) =>
      this(soldUnitId: soldUnitId);

  @override
  SupportTicketDetail productId(int? productId) => this(productId: productId);

  @override
  SupportTicketDetail category(TicketCategory? category) =>
      this(category: category);

  @override
  SupportTicketDetail priority(TicketPriority? priority) =>
      this(priority: priority);

  @override
  SupportTicketDetail subject(String? subject) => this(subject: subject);

  @override
  SupportTicketDetail description(String? description) =>
      this(description: description);

  @override
  SupportTicketDetail status(TicketStatus? status) => this(status: status);

  @override
  SupportTicketDetail channel(TicketChannel? channel) => this(channel: channel);

  @override
  SupportTicketDetail serviceType(
    SupportTicketDetailServiceTypeEnum? serviceType,
  ) => this(serviceType: serviceType);

  @override
  SupportTicketDetail serviceAddressId(int? serviceAddressId) =>
      this(serviceAddressId: serviceAddressId);

  @override
  SupportTicketDetail scheduledAt(DateTime? scheduledAt) =>
      this(scheduledAt: scheduledAt);

  @override
  SupportTicketDetail scheduledWindowMinutes(int? scheduledWindowMinutes) =>
      this(scheduledWindowMinutes: scheduledWindowMinutes);

  @override
  SupportTicketDetail assignedUserId(int? assignedUserId) =>
      this(assignedUserId: assignedUserId);

  @override
  SupportTicketDetail assignedUserName(String? assignedUserName) =>
      this(assignedUserName: assignedUserName);

  @override
  SupportTicketDetail isWarrantyCovered(bool? isWarrantyCovered) =>
      this(isWarrantyCovered: isWarrantyCovered);

  @override
  SupportTicketDetail slaDueAt(DateTime? slaDueAt) => this(slaDueAt: slaDueAt);

  @override
  SupportTicketDetail slaStatus(SupportTicketDetailSlaStatusEnum? slaStatus) =>
      this(slaStatus: slaStatus);

  @override
  SupportTicketDetail firstResponseAt(DateTime? firstResponseAt) =>
      this(firstResponseAt: firstResponseAt);

  @override
  SupportTicketDetail resolvedAt(DateTime? resolvedAt) =>
      this(resolvedAt: resolvedAt);

  @override
  SupportTicketDetail closedAt(DateTime? closedAt) => this(closedAt: closedAt);

  @override
  SupportTicketDetail rating(int? rating) => this(rating: rating);

  @override
  SupportTicketDetail ratingComment(String? ratingComment) =>
      this(ratingComment: ratingComment);

  @override
  SupportTicketDetail createdAt(DateTime? createdAt) =>
      this(createdAt: createdAt);

  @override
  SupportTicketDetail updatedAt(DateTime? updatedAt) =>
      this(updatedAt: updatedAt);

  @override
  SupportTicketDetail client(SupportTicketClient? client) =>
      this(client: client);

  @override
  SupportTicketDetail serviceAddress(Address? serviceAddress) =>
      this(serviceAddress: serviceAddress);

  @override
  SupportTicketDetail soldUnit(SoldUnit? soldUnit) => this(soldUnit: soldUnit);

  @override
  SupportTicketDetail messages(List<TicketMessage>? messages) =>
      this(messages: messages);

  @override
  SupportTicketDetail attachments(List<TicketAttachment>? attachments) =>
      this(attachments: attachments);

  @override
  SupportTicketDetail statusHistory(List<TicketStatusHistory>? statusHistory) =>
      this(statusHistory: statusHistory);

  @override
  SupportTicketDetail diagnosis(String? diagnosis) =>
      this(diagnosis: diagnosis);

  @override
  SupportTicketDetail partsUsed(String? partsUsed) =>
      this(partsUsed: partsUsed);

  @override
  SupportTicketDetail parts(List<TicketPart>? parts) => this(parts: parts);

  @override
  SupportTicketDetail visits(List<TicketVisit>? visits) => this(visits: visits);

  @override
  SupportTicketDetail quote(TicketQuote? quote) => this(quote: quote);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SupportTicketDetail(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SupportTicketDetail(...).copyWith(id: 12, name: "My name")
  /// ````
  SupportTicketDetail call({
    Object? id = const $CopyWithPlaceholder(),
    Object? code = const $CopyWithPlaceholder(),
    Object? clientId = const $CopyWithPlaceholder(),
    Object? soldUnitId = const $CopyWithPlaceholder(),
    Object? productId = const $CopyWithPlaceholder(),
    Object? category = const $CopyWithPlaceholder(),
    Object? priority = const $CopyWithPlaceholder(),
    Object? subject = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? channel = const $CopyWithPlaceholder(),
    Object? serviceType = const $CopyWithPlaceholder(),
    Object? serviceAddressId = const $CopyWithPlaceholder(),
    Object? scheduledAt = const $CopyWithPlaceholder(),
    Object? scheduledWindowMinutes = const $CopyWithPlaceholder(),
    Object? assignedUserId = const $CopyWithPlaceholder(),
    Object? assignedUserName = const $CopyWithPlaceholder(),
    Object? isWarrantyCovered = const $CopyWithPlaceholder(),
    Object? slaDueAt = const $CopyWithPlaceholder(),
    Object? slaStatus = const $CopyWithPlaceholder(),
    Object? firstResponseAt = const $CopyWithPlaceholder(),
    Object? resolvedAt = const $CopyWithPlaceholder(),
    Object? closedAt = const $CopyWithPlaceholder(),
    Object? rating = const $CopyWithPlaceholder(),
    Object? ratingComment = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
    Object? client = const $CopyWithPlaceholder(),
    Object? serviceAddress = const $CopyWithPlaceholder(),
    Object? soldUnit = const $CopyWithPlaceholder(),
    Object? messages = const $CopyWithPlaceholder(),
    Object? attachments = const $CopyWithPlaceholder(),
    Object? statusHistory = const $CopyWithPlaceholder(),
    Object? diagnosis = const $CopyWithPlaceholder(),
    Object? partsUsed = const $CopyWithPlaceholder(),
    Object? parts = const $CopyWithPlaceholder(),
    Object? visits = const $CopyWithPlaceholder(),
    Object? quote = const $CopyWithPlaceholder(),
  }) {
    return SupportTicketDetail(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      code: code == const $CopyWithPlaceholder()
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String?,
      clientId: clientId == const $CopyWithPlaceholder()
          ? _value.clientId
          // ignore: cast_nullable_to_non_nullable
          : clientId as int?,
      soldUnitId: soldUnitId == const $CopyWithPlaceholder()
          ? _value.soldUnitId
          // ignore: cast_nullable_to_non_nullable
          : soldUnitId as int?,
      productId: productId == const $CopyWithPlaceholder()
          ? _value.productId
          // ignore: cast_nullable_to_non_nullable
          : productId as int?,
      category: category == const $CopyWithPlaceholder()
          ? _value.category
          // ignore: cast_nullable_to_non_nullable
          : category as TicketCategory?,
      priority: priority == const $CopyWithPlaceholder()
          ? _value.priority
          // ignore: cast_nullable_to_non_nullable
          : priority as TicketPriority?,
      subject: subject == const $CopyWithPlaceholder()
          ? _value.subject
          // ignore: cast_nullable_to_non_nullable
          : subject as String?,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as TicketStatus?,
      channel: channel == const $CopyWithPlaceholder()
          ? _value.channel
          // ignore: cast_nullable_to_non_nullable
          : channel as TicketChannel?,
      serviceType: serviceType == const $CopyWithPlaceholder()
          ? _value.serviceType
          // ignore: cast_nullable_to_non_nullable
          : serviceType as SupportTicketDetailServiceTypeEnum?,
      serviceAddressId: serviceAddressId == const $CopyWithPlaceholder()
          ? _value.serviceAddressId
          // ignore: cast_nullable_to_non_nullable
          : serviceAddressId as int?,
      scheduledAt: scheduledAt == const $CopyWithPlaceholder()
          ? _value.scheduledAt
          // ignore: cast_nullable_to_non_nullable
          : scheduledAt as DateTime?,
      scheduledWindowMinutes:
          scheduledWindowMinutes == const $CopyWithPlaceholder()
          ? _value.scheduledWindowMinutes
          // ignore: cast_nullable_to_non_nullable
          : scheduledWindowMinutes as int?,
      assignedUserId: assignedUserId == const $CopyWithPlaceholder()
          ? _value.assignedUserId
          // ignore: cast_nullable_to_non_nullable
          : assignedUserId as int?,
      assignedUserName: assignedUserName == const $CopyWithPlaceholder()
          ? _value.assignedUserName
          // ignore: cast_nullable_to_non_nullable
          : assignedUserName as String?,
      isWarrantyCovered: isWarrantyCovered == const $CopyWithPlaceholder()
          ? _value.isWarrantyCovered
          // ignore: cast_nullable_to_non_nullable
          : isWarrantyCovered as bool?,
      slaDueAt: slaDueAt == const $CopyWithPlaceholder()
          ? _value.slaDueAt
          // ignore: cast_nullable_to_non_nullable
          : slaDueAt as DateTime?,
      slaStatus: slaStatus == const $CopyWithPlaceholder()
          ? _value.slaStatus
          // ignore: cast_nullable_to_non_nullable
          : slaStatus as SupportTicketDetailSlaStatusEnum?,
      firstResponseAt: firstResponseAt == const $CopyWithPlaceholder()
          ? _value.firstResponseAt
          // ignore: cast_nullable_to_non_nullable
          : firstResponseAt as DateTime?,
      resolvedAt: resolvedAt == const $CopyWithPlaceholder()
          ? _value.resolvedAt
          // ignore: cast_nullable_to_non_nullable
          : resolvedAt as DateTime?,
      closedAt: closedAt == const $CopyWithPlaceholder()
          ? _value.closedAt
          // ignore: cast_nullable_to_non_nullable
          : closedAt as DateTime?,
      rating: rating == const $CopyWithPlaceholder()
          ? _value.rating
          // ignore: cast_nullable_to_non_nullable
          : rating as int?,
      ratingComment: ratingComment == const $CopyWithPlaceholder()
          ? _value.ratingComment
          // ignore: cast_nullable_to_non_nullable
          : ratingComment as String?,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime?,
      updatedAt: updatedAt == const $CopyWithPlaceholder()
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime?,
      client: client == const $CopyWithPlaceholder()
          ? _value.client
          // ignore: cast_nullable_to_non_nullable
          : client as SupportTicketClient?,
      serviceAddress: serviceAddress == const $CopyWithPlaceholder()
          ? _value.serviceAddress
          // ignore: cast_nullable_to_non_nullable
          : serviceAddress as Address?,
      soldUnit: soldUnit == const $CopyWithPlaceholder()
          ? _value.soldUnit
          // ignore: cast_nullable_to_non_nullable
          : soldUnit as SoldUnit?,
      messages: messages == const $CopyWithPlaceholder()
          ? _value.messages
          // ignore: cast_nullable_to_non_nullable
          : messages as List<TicketMessage>?,
      attachments: attachments == const $CopyWithPlaceholder()
          ? _value.attachments
          // ignore: cast_nullable_to_non_nullable
          : attachments as List<TicketAttachment>?,
      statusHistory: statusHistory == const $CopyWithPlaceholder()
          ? _value.statusHistory
          // ignore: cast_nullable_to_non_nullable
          : statusHistory as List<TicketStatusHistory>?,
      diagnosis: diagnosis == const $CopyWithPlaceholder()
          ? _value.diagnosis
          // ignore: cast_nullable_to_non_nullable
          : diagnosis as String?,
      partsUsed: partsUsed == const $CopyWithPlaceholder()
          ? _value.partsUsed
          // ignore: cast_nullable_to_non_nullable
          : partsUsed as String?,
      parts: parts == const $CopyWithPlaceholder()
          ? _value.parts
          // ignore: cast_nullable_to_non_nullable
          : parts as List<TicketPart>?,
      visits: visits == const $CopyWithPlaceholder()
          ? _value.visits
          // ignore: cast_nullable_to_non_nullable
          : visits as List<TicketVisit>?,
      quote: quote == const $CopyWithPlaceholder()
          ? _value.quote
          // ignore: cast_nullable_to_non_nullable
          : quote as TicketQuote?,
    );
  }
}

extension $SupportTicketDetailCopyWith on SupportTicketDetail {
  /// Returns a callable class that can be used as follows: `instanceOfSupportTicketDetail.copyWith(...)` or like so:`instanceOfSupportTicketDetail.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SupportTicketDetailCWProxy get copyWith =>
      _$SupportTicketDetailCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupportTicketDetail _$SupportTicketDetailFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'SupportTicketDetail',
  json,
  ($checkedConvert) {
    final val = SupportTicketDetail(
      id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
      code: $checkedConvert('code', (v) => v as String?),
      clientId: $checkedConvert('client_id', (v) => (v as num?)?.toInt()),
      soldUnitId: $checkedConvert('sold_unit_id', (v) => (v as num?)?.toInt()),
      productId: $checkedConvert('product_id', (v) => (v as num?)?.toInt()),
      category: $checkedConvert(
        'category',
        (v) => $enumDecodeNullable(_$TicketCategoryEnumMap, v),
      ),
      priority: $checkedConvert(
        'priority',
        (v) => $enumDecodeNullable(_$TicketPriorityEnumMap, v),
      ),
      subject: $checkedConvert('subject', (v) => v as String?),
      description: $checkedConvert('description', (v) => v as String?),
      status: $checkedConvert(
        'status',
        (v) => $enumDecodeNullable(_$TicketStatusEnumMap, v),
      ),
      channel: $checkedConvert(
        'channel',
        (v) => $enumDecodeNullable(_$TicketChannelEnumMap, v),
      ),
      serviceType: $checkedConvert(
        'service_type',
        (v) =>
            $enumDecodeNullable(_$SupportTicketDetailServiceTypeEnumEnumMap, v),
      ),
      serviceAddressId: $checkedConvert(
        'service_address_id',
        (v) => (v as num?)?.toInt(),
      ),
      scheduledAt: $checkedConvert(
        'scheduled_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      scheduledWindowMinutes: $checkedConvert(
        'scheduled_window_minutes',
        (v) => (v as num?)?.toInt(),
      ),
      assignedUserId: $checkedConvert(
        'assigned_user_id',
        (v) => (v as num?)?.toInt(),
      ),
      assignedUserName: $checkedConvert(
        'assigned_user_name',
        (v) => v as String?,
      ),
      isWarrantyCovered: $checkedConvert(
        'is_warranty_covered',
        (v) => v as bool?,
      ),
      slaDueAt: $checkedConvert(
        'sla_due_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      slaStatus: $checkedConvert(
        'sla_status',
        (v) =>
            $enumDecodeNullable(_$SupportTicketDetailSlaStatusEnumEnumMap, v),
      ),
      firstResponseAt: $checkedConvert(
        'first_response_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      resolvedAt: $checkedConvert(
        'resolved_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      closedAt: $checkedConvert(
        'closed_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      rating: $checkedConvert('rating', (v) => (v as num?)?.toInt()),
      ratingComment: $checkedConvert('rating_comment', (v) => v as String?),
      createdAt: $checkedConvert(
        'created_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      updatedAt: $checkedConvert(
        'updated_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      client: $checkedConvert(
        'client',
        (v) => v == null
            ? null
            : SupportTicketClient.fromJson(v as Map<String, dynamic>),
      ),
      serviceAddress: $checkedConvert(
        'service_address',
        (v) => v == null ? null : Address.fromJson(v as Map<String, dynamic>),
      ),
      soldUnit: $checkedConvert(
        'sold_unit',
        (v) => v == null ? null : SoldUnit.fromJson(v as Map<String, dynamic>),
      ),
      messages: $checkedConvert(
        'messages',
        (v) => (v as List<dynamic>?)
            ?.map((e) => TicketMessage.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      attachments: $checkedConvert(
        'attachments',
        (v) => (v as List<dynamic>?)
            ?.map((e) => TicketAttachment.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      statusHistory: $checkedConvert(
        'status_history',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => TicketStatusHistory.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      diagnosis: $checkedConvert('diagnosis', (v) => v as String?),
      partsUsed: $checkedConvert('parts_used', (v) => v as String?),
      parts: $checkedConvert(
        'parts',
        (v) => (v as List<dynamic>?)
            ?.map((e) => TicketPart.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      visits: $checkedConvert(
        'visits',
        (v) => (v as List<dynamic>?)
            ?.map((e) => TicketVisit.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      quote: $checkedConvert(
        'quote',
        (v) =>
            v == null ? null : TicketQuote.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'clientId': 'client_id',
    'soldUnitId': 'sold_unit_id',
    'productId': 'product_id',
    'serviceType': 'service_type',
    'serviceAddressId': 'service_address_id',
    'scheduledAt': 'scheduled_at',
    'scheduledWindowMinutes': 'scheduled_window_minutes',
    'assignedUserId': 'assigned_user_id',
    'assignedUserName': 'assigned_user_name',
    'isWarrantyCovered': 'is_warranty_covered',
    'slaDueAt': 'sla_due_at',
    'slaStatus': 'sla_status',
    'firstResponseAt': 'first_response_at',
    'resolvedAt': 'resolved_at',
    'closedAt': 'closed_at',
    'ratingComment': 'rating_comment',
    'createdAt': 'created_at',
    'updatedAt': 'updated_at',
    'serviceAddress': 'service_address',
    'soldUnit': 'sold_unit',
    'statusHistory': 'status_history',
    'partsUsed': 'parts_used',
  },
);

Map<String, dynamic> _$SupportTicketDetailToJson(
  SupportTicketDetail instance,
) => <String, dynamic>{
  'id': ?instance.id,
  'code': ?instance.code,
  'client_id': ?instance.clientId,
  'sold_unit_id': ?instance.soldUnitId,
  'product_id': ?instance.productId,
  'category': ?_$TicketCategoryEnumMap[instance.category],
  'priority': ?_$TicketPriorityEnumMap[instance.priority],
  'subject': ?instance.subject,
  'description': ?instance.description,
  'status': ?_$TicketStatusEnumMap[instance.status],
  'channel': ?_$TicketChannelEnumMap[instance.channel],
  'service_type':
      ?_$SupportTicketDetailServiceTypeEnumEnumMap[instance.serviceType],
  'service_address_id': ?instance.serviceAddressId,
  'scheduled_at': ?instance.scheduledAt?.toIso8601String(),
  'scheduled_window_minutes': ?instance.scheduledWindowMinutes,
  'assigned_user_id': ?instance.assignedUserId,
  'assigned_user_name': ?instance.assignedUserName,
  'is_warranty_covered': ?instance.isWarrantyCovered,
  'sla_due_at': ?instance.slaDueAt?.toIso8601String(),
  'sla_status': ?_$SupportTicketDetailSlaStatusEnumEnumMap[instance.slaStatus],
  'first_response_at': ?instance.firstResponseAt?.toIso8601String(),
  'resolved_at': ?instance.resolvedAt?.toIso8601String(),
  'closed_at': ?instance.closedAt?.toIso8601String(),
  'rating': ?instance.rating,
  'rating_comment': ?instance.ratingComment,
  'created_at': ?instance.createdAt?.toIso8601String(),
  'updated_at': ?instance.updatedAt?.toIso8601String(),
  'client': ?instance.client?.toJson(),
  'service_address': ?instance.serviceAddress?.toJson(),
  'sold_unit': ?instance.soldUnit?.toJson(),
  'messages': ?instance.messages?.map((e) => e.toJson()).toList(),
  'attachments': ?instance.attachments?.map((e) => e.toJson()).toList(),
  'status_history': ?instance.statusHistory?.map((e) => e.toJson()).toList(),
  'diagnosis': ?instance.diagnosis,
  'parts_used': ?instance.partsUsed,
  'parts': ?instance.parts?.map((e) => e.toJson()).toList(),
  'visits': ?instance.visits?.map((e) => e.toJson()).toList(),
  'quote': ?instance.quote?.toJson(),
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

const _$TicketStatusEnumMap = {
  TicketStatus.abierto: 'abierto',
  TicketStatus.asignado: 'asignado',
  TicketStatus.enProceso: 'en_proceso',
  TicketStatus.enEsperaCliente: 'en_espera_cliente',
  TicketStatus.enEsperaAprobacion: 'en_espera_aprobacion',
  TicketStatus.resuelto: 'resuelto',
  TicketStatus.cerrado: 'cerrado',
  TicketStatus.cancelado: 'cancelado',
};

const _$TicketChannelEnumMap = {
  TicketChannel.app: 'app',
  TicketChannel.web: 'web',
  TicketChannel.telefono: 'telefono',
};

const _$SupportTicketDetailServiceTypeEnumEnumMap = {
  SupportTicketDetailServiceTypeEnum.remoto: 'remoto',
  SupportTicketDetailServiceTypeEnum.domicilio: 'domicilio',
  SupportTicketDetailServiceTypeEnum.taller: 'taller',
};

const _$SupportTicketDetailSlaStatusEnumEnumMap = {
  SupportTicketDetailSlaStatusEnum.onTrack: 'on_track',
  SupportTicketDetailSlaStatusEnum.dueSoon: 'due_soon',
  SupportTicketDetailSlaStatusEnum.breached: 'breached',
};
