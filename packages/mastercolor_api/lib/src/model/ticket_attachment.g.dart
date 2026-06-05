// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_attachment.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TicketAttachmentCWProxy {
  TicketAttachment id(int? id);

  TicketAttachment ticketId(int? ticketId);

  TicketAttachment messageId(int? messageId);

  TicketAttachment url(String? url);

  TicketAttachment fileType(String? fileType);

  TicketAttachment originalName(String? originalName);

  TicketAttachment createdAt(DateTime? createdAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketAttachment(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketAttachment(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketAttachment call({
    int? id,
    int? ticketId,
    int? messageId,
    String? url,
    String? fileType,
    String? originalName,
    DateTime? createdAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTicketAttachment.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTicketAttachment.copyWith.fieldName(...)`
class _$TicketAttachmentCWProxyImpl implements _$TicketAttachmentCWProxy {
  const _$TicketAttachmentCWProxyImpl(this._value);

  final TicketAttachment _value;

  @override
  TicketAttachment id(int? id) => this(id: id);

  @override
  TicketAttachment ticketId(int? ticketId) => this(ticketId: ticketId);

  @override
  TicketAttachment messageId(int? messageId) => this(messageId: messageId);

  @override
  TicketAttachment url(String? url) => this(url: url);

  @override
  TicketAttachment fileType(String? fileType) => this(fileType: fileType);

  @override
  TicketAttachment originalName(String? originalName) =>
      this(originalName: originalName);

  @override
  TicketAttachment createdAt(DateTime? createdAt) => this(createdAt: createdAt);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TicketAttachment(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TicketAttachment(...).copyWith(id: 12, name: "My name")
  /// ````
  TicketAttachment call({
    Object? id = const $CopyWithPlaceholder(),
    Object? ticketId = const $CopyWithPlaceholder(),
    Object? messageId = const $CopyWithPlaceholder(),
    Object? url = const $CopyWithPlaceholder(),
    Object? fileType = const $CopyWithPlaceholder(),
    Object? originalName = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
  }) {
    return TicketAttachment(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      ticketId: ticketId == const $CopyWithPlaceholder()
          ? _value.ticketId
          // ignore: cast_nullable_to_non_nullable
          : ticketId as int?,
      messageId: messageId == const $CopyWithPlaceholder()
          ? _value.messageId
          // ignore: cast_nullable_to_non_nullable
          : messageId as int?,
      url: url == const $CopyWithPlaceholder()
          ? _value.url
          // ignore: cast_nullable_to_non_nullable
          : url as String?,
      fileType: fileType == const $CopyWithPlaceholder()
          ? _value.fileType
          // ignore: cast_nullable_to_non_nullable
          : fileType as String?,
      originalName: originalName == const $CopyWithPlaceholder()
          ? _value.originalName
          // ignore: cast_nullable_to_non_nullable
          : originalName as String?,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime?,
    );
  }
}

extension $TicketAttachmentCopyWith on TicketAttachment {
  /// Returns a callable class that can be used as follows: `instanceOfTicketAttachment.copyWith(...)` or like so:`instanceOfTicketAttachment.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TicketAttachmentCWProxy get copyWith => _$TicketAttachmentCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketAttachment _$TicketAttachmentFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TicketAttachment',
      json,
      ($checkedConvert) {
        final val = TicketAttachment(
          id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
          ticketId: $checkedConvert('ticket_id', (v) => (v as num?)?.toInt()),
          messageId: $checkedConvert('message_id', (v) => (v as num?)?.toInt()),
          url: $checkedConvert('url', (v) => v as String?),
          fileType: $checkedConvert('file_type', (v) => v as String?),
          originalName: $checkedConvert('original_name', (v) => v as String?),
          createdAt: $checkedConvert(
            'created_at',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'ticketId': 'ticket_id',
        'messageId': 'message_id',
        'fileType': 'file_type',
        'originalName': 'original_name',
        'createdAt': 'created_at',
      },
    );

Map<String, dynamic> _$TicketAttachmentToJson(TicketAttachment instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'ticket_id': ?instance.ticketId,
      'message_id': ?instance.messageId,
      'url': ?instance.url,
      'file_type': ?instance.fileType,
      'original_name': ?instance.originalName,
      'created_at': ?instance.createdAt?.toIso8601String(),
    };
