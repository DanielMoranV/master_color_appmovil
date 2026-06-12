//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticket_schedule_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TicketScheduleRequest {
  /// Returns a new [TicketScheduleRequest] instance.
  TicketScheduleRequest({

    required  this.scheduledAt,

     this.scheduledWindowMinutes,

     this.note,
  });

  @JsonKey(
    
    name: r'scheduled_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime scheduledAt;



  @JsonKey(
    
    name: r'scheduled_window_minutes',
    required: false,
    includeIfNull: false,
  )


  final int? scheduledWindowMinutes;



  @JsonKey(
    
    name: r'note',
    required: false,
    includeIfNull: false,
  )


  final String? note;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TicketScheduleRequest &&
      other.scheduledAt == scheduledAt &&
      other.scheduledWindowMinutes == scheduledWindowMinutes &&
      other.note == note;

    @override
    int get hashCode =>
        scheduledAt.hashCode +
        scheduledWindowMinutes.hashCode +
        note.hashCode;

  factory TicketScheduleRequest.fromJson(Map<String, dynamic> json) => _$TicketScheduleRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TicketScheduleRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

