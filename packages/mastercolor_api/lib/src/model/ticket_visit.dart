//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticket_visit.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TicketVisit {
  /// Returns a new [TicketVisit] instance.
  TicketVisit({

     this.id,

     this.ticketId,

     this.technicianId,

     this.technicianName,

     this.checkinAt,

     this.checkinLatitude,

     this.checkinLongitude,

     this.checkoutAt,

     this.checkoutLatitude,

     this.checkoutLongitude,

     this.durationMinutes,

     this.workDone,

     this.clientSignedName,

     this.signatureUrl,

     this.reportPdfUrl,

     this.reportedAt,

     this.createdAt,
  });

  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final int? id;



  @JsonKey(
    
    name: r'ticket_id',
    required: false,
    includeIfNull: false,
  )


  final int? ticketId;



  @JsonKey(
    
    name: r'technician_id',
    required: false,
    includeIfNull: false,
  )


  final int? technicianId;



  @JsonKey(
    
    name: r'technician_name',
    required: false,
    includeIfNull: false,
  )


  final String? technicianName;



  @JsonKey(
    
    name: r'checkin_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? checkinAt;



  @JsonKey(
    
    name: r'checkin_latitude',
    required: false,
    includeIfNull: false,
  )


  final double? checkinLatitude;



  @JsonKey(
    
    name: r'checkin_longitude',
    required: false,
    includeIfNull: false,
  )


  final double? checkinLongitude;



  @JsonKey(
    
    name: r'checkout_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? checkoutAt;



  @JsonKey(
    
    name: r'checkout_latitude',
    required: false,
    includeIfNull: false,
  )


  final double? checkoutLatitude;



  @JsonKey(
    
    name: r'checkout_longitude',
    required: false,
    includeIfNull: false,
  )


  final double? checkoutLongitude;



      /// Tiempo en sitio (null mientras la visita siga abierta).
  @JsonKey(
    
    name: r'duration_minutes',
    required: false,
    includeIfNull: false,
  )


  final int? durationMinutes;



  @JsonKey(
    
    name: r'work_done',
    required: false,
    includeIfNull: false,
  )


  final String? workDone;



  @JsonKey(
    
    name: r'client_signed_name',
    required: false,
    includeIfNull: false,
  )


  final String? clientSignedName;



  @JsonKey(
    
    name: r'signature_url',
    required: false,
    includeIfNull: false,
  )


  final String? signatureUrl;



      /// URL del acta de conformidad en PDF.
  @JsonKey(
    
    name: r'report_pdf_url',
    required: false,
    includeIfNull: false,
  )


  final String? reportPdfUrl;



  @JsonKey(
    
    name: r'reported_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? reportedAt;



  @JsonKey(
    
    name: r'created_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? createdAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TicketVisit &&
      other.id == id &&
      other.ticketId == ticketId &&
      other.technicianId == technicianId &&
      other.technicianName == technicianName &&
      other.checkinAt == checkinAt &&
      other.checkinLatitude == checkinLatitude &&
      other.checkinLongitude == checkinLongitude &&
      other.checkoutAt == checkoutAt &&
      other.checkoutLatitude == checkoutLatitude &&
      other.checkoutLongitude == checkoutLongitude &&
      other.durationMinutes == durationMinutes &&
      other.workDone == workDone &&
      other.clientSignedName == clientSignedName &&
      other.signatureUrl == signatureUrl &&
      other.reportPdfUrl == reportPdfUrl &&
      other.reportedAt == reportedAt &&
      other.createdAt == createdAt;

    @override
    int get hashCode =>
        id.hashCode +
        ticketId.hashCode +
        technicianId.hashCode +
        technicianName.hashCode +
        checkinAt.hashCode +
        checkinLatitude.hashCode +
        checkinLongitude.hashCode +
        checkoutAt.hashCode +
        checkoutLatitude.hashCode +
        checkoutLongitude.hashCode +
        durationMinutes.hashCode +
        workDone.hashCode +
        clientSignedName.hashCode +
        signatureUrl.hashCode +
        reportPdfUrl.hashCode +
        reportedAt.hashCode +
        createdAt.hashCode;

  factory TicketVisit.fromJson(Map<String, dynamic> json) => _$TicketVisitFromJson(json);

  Map<String, dynamic> toJson() => _$TicketVisitToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

