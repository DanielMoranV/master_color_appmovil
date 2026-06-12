//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'service_history_event.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ServiceHistoryEvent {
  /// Returns a new [ServiceHistoryEvent] instance.
  ServiceHistoryEvent({

     this.type,

     this.at,

     this.ticketId,

     this.ticketCode,

     this.category,

     this.subject,

     this.technician,

     this.checkinAt,

     this.checkoutAt,

     this.durationMinutes,

     this.workDone,

     this.reportedAt,

     this.diagnosis,
  });

  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final ServiceHistoryEventTypeEnum? type;



  @JsonKey(
    
    name: r'at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? at;



  @JsonKey(
    
    name: r'ticket_id',
    required: false,
    includeIfNull: false,
  )


  final int? ticketId;



  @JsonKey(
    
    name: r'ticket_code',
    required: false,
    includeIfNull: false,
  )


  final String? ticketCode;



      /// Solo en ticket_opened.
  @JsonKey(
    
    name: r'category',
    required: false,
    includeIfNull: false,
  )


  final String? category;



      /// Solo en ticket_opened.
  @JsonKey(
    
    name: r'subject',
    required: false,
    includeIfNull: false,
  )


  final String? subject;



      /// Técnico (visit / resolved).
  @JsonKey(
    
    name: r'technician',
    required: false,
    includeIfNull: false,
  )


  final String? technician;



      /// Solo en visit.
  @JsonKey(
    
    name: r'checkin_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? checkinAt;



      /// Solo en visit.
  @JsonKey(
    
    name: r'checkout_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? checkoutAt;



      /// Solo en visit.
  @JsonKey(
    
    name: r'duration_minutes',
    required: false,
    includeIfNull: false,
  )


  final int? durationMinutes;



      /// Solo en visit.
  @JsonKey(
    
    name: r'work_done',
    required: false,
    includeIfNull: false,
  )


  final String? workDone;



      /// Solo en visit.
  @JsonKey(
    
    name: r'reported_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? reportedAt;



      /// Solo en resolved.
  @JsonKey(
    
    name: r'diagnosis',
    required: false,
    includeIfNull: false,
  )


  final String? diagnosis;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ServiceHistoryEvent &&
      other.type == type &&
      other.at == at &&
      other.ticketId == ticketId &&
      other.ticketCode == ticketCode &&
      other.category == category &&
      other.subject == subject &&
      other.technician == technician &&
      other.checkinAt == checkinAt &&
      other.checkoutAt == checkoutAt &&
      other.durationMinutes == durationMinutes &&
      other.workDone == workDone &&
      other.reportedAt == reportedAt &&
      other.diagnosis == diagnosis;

    @override
    int get hashCode =>
        type.hashCode +
        at.hashCode +
        ticketId.hashCode +
        ticketCode.hashCode +
        category.hashCode +
        subject.hashCode +
        technician.hashCode +
        checkinAt.hashCode +
        checkoutAt.hashCode +
        durationMinutes.hashCode +
        workDone.hashCode +
        reportedAt.hashCode +
        diagnosis.hashCode;

  factory ServiceHistoryEvent.fromJson(Map<String, dynamic> json) => _$ServiceHistoryEventFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceHistoryEventToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum ServiceHistoryEventTypeEnum {
@JsonValue(r'ticket_opened')
ticketOpened(r'ticket_opened'),
@JsonValue(r'visit')
visit(r'visit'),
@JsonValue(r'resolved')
resolved(r'resolved');

const ServiceHistoryEventTypeEnum(this.value);

final String value;

@override
String toString() => value;
}


