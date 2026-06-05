//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mastercolor_api/src/model/ticket_status.dart';
import 'package:mastercolor_api/src/model/author_type.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticket_status_history.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TicketStatusHistory {
  /// Returns a new [TicketStatusHistory] instance.
  TicketStatusHistory({

     this.id,

     this.fromStatus,

     this.toStatus,

     this.changedByType,

     this.changedByName,

     this.note,

     this.createdAt,
  });

  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final int? id;



  @JsonKey(
    
    name: r'from_status',
    required: false,
    includeIfNull: false,
  )


  final String? fromStatus;



  @JsonKey(
    
    name: r'to_status',
    required: false,
    includeIfNull: false,
  )


  final TicketStatus? toStatus;



  @JsonKey(
    
    name: r'changed_by_type',
    required: false,
    includeIfNull: false,
  )


  final AuthorType? changedByType;



  @JsonKey(
    
    name: r'changed_by_name',
    required: false,
    includeIfNull: false,
  )


  final String? changedByName;



  @JsonKey(
    
    name: r'note',
    required: false,
    includeIfNull: false,
  )


  final String? note;



  @JsonKey(
    
    name: r'created_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? createdAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TicketStatusHistory &&
      other.id == id &&
      other.fromStatus == fromStatus &&
      other.toStatus == toStatus &&
      other.changedByType == changedByType &&
      other.changedByName == changedByName &&
      other.note == note &&
      other.createdAt == createdAt;

    @override
    int get hashCode =>
        id.hashCode +
        fromStatus.hashCode +
        toStatus.hashCode +
        changedByType.hashCode +
        changedByName.hashCode +
        note.hashCode +
        createdAt.hashCode;

  factory TicketStatusHistory.fromJson(Map<String, dynamic> json) => _$TicketStatusHistoryFromJson(json);

  Map<String, dynamic> toJson() => _$TicketStatusHistoryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

