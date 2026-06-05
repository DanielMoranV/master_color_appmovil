// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_message.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TicketMessageCWProxy {
  TicketMessage id(int? id);

  TicketMessage ticketId(int? ticketId);

  TicketMessage authorType(AuthorType? authorType);

  TicketMessage authorId(int? authorId);

  TicketMessage authorName(String? authorName);

  TicketMessage body(String? body);

  TicketMessage isInternal(bool? isInternal);

  TicketMessage readAt(DateTime? readAt);

  TicketMessage createdAt(DateTime? createdAt);

  TicketMessage attachments(List<TicketAttachment>? attachments);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketMessage(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketMessage(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketMessage call({
    int? id,
    int? ticketId,
    AuthorType? authorType,
    int? authorId,
    String? authorName,
    String? body,
    bool? isInternal,
    DateTime? readAt,
    DateTime? createdAt,
    List<TicketAttachment>? attachments,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTicketMessage.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTicketMessage.copyWith.fieldName(...)`
class _$TicketMessageCWProxyImpl implements _$TicketMessageCWProxy {
  const _$TicketMessageCWProxyImpl(this._value);

  final TicketMessage _value;

  @override
  TicketMessage id(int? id) => this(id: id);

  @override
  TicketMessage ticketId(int? ticketId) => this(ticketId: ticketId);

  @override
  TicketMessage authorType(AuthorType? authorType) =>
      this(authorType: authorType);

  @override
  TicketMessage authorId(int? authorId) => this(authorId: authorId);

  @override
  TicketMessage authorName(String? authorName) => this(authorName: authorName);

  @override
  TicketMessage body(String? body) => this(body: body);

  @override
  TicketMessage isInternal(bool? isInternal) => this(isInternal: isInternal);

  @override
  TicketMessage readAt(DateTime? readAt) => this(readAt: readAt);

  @override
  TicketMessage createdAt(DateTime? createdAt) => this(createdAt: createdAt);

  @override
  TicketMessage attachments(List<TicketAttachment>? attachments) =>
      this(attachments: attachments);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketMessage(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketMessage(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketMessage call({
    Object? id = const $CopyWithPlaceholder(),
    Object? ticketId = const $CopyWithPlaceholder(),
    Object? authorType = const $CopyWithPlaceholder(),
    Object? authorId = const $CopyWithPlaceholder(),
    Object? authorName = const $CopyWithPlaceholder(),
    Object? body = const $CopyWithPlaceholder(),
    Object? isInternal = const $CopyWithPlaceholder(),
    Object? readAt = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? attachments = const $CopyWithPlaceholder(),
  }) {
    return TicketMessage(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      ticketId: ticketId == const $CopyWithPlaceholder()
          ? _value.ticketId
          // ignore: cast_nullable_to_non_nullable
          : ticketId as int?,
      authorType: authorType == const $CopyWithPlaceholder()
          ? _value.authorType
          // ignore: cast_nullable_to_non_nullable
          : authorType as AuthorType?,
      authorId: authorId == const $CopyWithPlaceholder()
          ? _value.authorId
          // ignore: cast_nullable_to_non_nullable
          : authorId as int?,
      authorName: authorName == const $CopyWithPlaceholder()
          ? _value.authorName
          // ignore: cast_nullable_to_non_nullable
          : authorName as String?,
      body: body == const $CopyWithPlaceholder()
          ? _value.body
          // ignore: cast_nullable_to_non_nullable
          : body as String?,
      isInternal: isInternal == const $CopyWithPlaceholder()
          ? _value.isInternal
          // ignore: cast_nullable_to_non_nullable
          : isInternal as bool?,
      readAt: readAt == const $CopyWithPlaceholder()
          ? _value.readAt
          // ignore: cast_nullable_to_non_nullable
          : readAt as DateTime?,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime?,
      attachments: attachments == const $CopyWithPlaceholder()
          ? _value.attachments
          // ignore: cast_nullable_to_non_nullable
          : attachments as List<TicketAttachment>?,
    );
  }
}

extension $TicketMessageCopyWith on TicketMessage {
  /// Returns a callable class that can be used as follows: `instanceOfTicketMessage.copyWith(...)` or like so:`instanceOfTicketMessage.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TicketMessageCWProxy get copyWith => _$TicketMessageCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketMessage _$TicketMessageFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TicketMessage',
      json,
      ($checkedConvert) {
        final val = TicketMessage(
          id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
          ticketId: $checkedConvert('ticket_id', (v) => (v as num?)?.toInt()),
          authorType: $checkedConvert(
            'author_type',
            (v) => $enumDecodeNullable(_$AuthorTypeEnumMap, v),
          ),
          authorId: $checkedConvert('author_id', (v) => (v as num?)?.toInt()),
          authorName: $checkedConvert('author_name', (v) => v as String?),
          body: $checkedConvert('body', (v) => v as String?),
          isInternal: $checkedConvert('is_internal', (v) => v as bool?),
          readAt: $checkedConvert(
            'read_at',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          createdAt: $checkedConvert(
            'created_at',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          attachments: $checkedConvert(
            'attachments',
            (v) => (v as List<dynamic>?)
                ?.map(
                  (e) => TicketAttachment.fromJson(e as Map<String, dynamic>),
                )
                .toList(),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'ticketId': 'ticket_id',
        'authorType': 'author_type',
        'authorId': 'author_id',
        'authorName': 'author_name',
        'isInternal': 'is_internal',
        'readAt': 'read_at',
        'createdAt': 'created_at',
      },
    );

Map<String, dynamic> _$TicketMessageToJson(TicketMessage instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'ticket_id': ?instance.ticketId,
      'author_type': ?_$AuthorTypeEnumMap[instance.authorType],
      'author_id': ?instance.authorId,
      'author_name': ?instance.authorName,
      'body': ?instance.body,
      'is_internal': ?instance.isInternal,
      'read_at': ?instance.readAt?.toIso8601String(),
      'created_at': ?instance.createdAt?.toIso8601String(),
      'attachments': ?instance.attachments?.map((e) => e.toJson()).toList(),
    };

const _$AuthorTypeEnumMap = {
  AuthorType.client: 'client',
  AuthorType.user: 'user',
};
