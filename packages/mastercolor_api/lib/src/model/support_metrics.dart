//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mastercolor_api/src/model/support_metrics_by_technician_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'support_metrics.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SupportMetrics {
  /// Returns a new [SupportMetrics] instance.
  SupportMetrics({

     this.totalTickets,

     this.openTickets,

     this.unassignedTickets,

     this.resolvedThisMonth,

     this.avgFirstResponseHours,

     this.avgResolutionHours,

     this.slaBreached,

     this.byStatus,

     this.byTechnician,
  });

  @JsonKey(
    
    name: r'total_tickets',
    required: false,
    includeIfNull: false,
  )


  final int? totalTickets;



  @JsonKey(
    
    name: r'open_tickets',
    required: false,
    includeIfNull: false,
  )


  final int? openTickets;



  @JsonKey(
    
    name: r'unassigned_tickets',
    required: false,
    includeIfNull: false,
  )


  final int? unassignedTickets;



  @JsonKey(
    
    name: r'resolved_this_month',
    required: false,
    includeIfNull: false,
  )


  final int? resolvedThisMonth;



  @JsonKey(
    
    name: r'avg_first_response_hours',
    required: false,
    includeIfNull: false,
  )


  final double? avgFirstResponseHours;



  @JsonKey(
    
    name: r'avg_resolution_hours',
    required: false,
    includeIfNull: false,
  )


  final double? avgResolutionHours;



  @JsonKey(
    
    name: r'sla_breached',
    required: false,
    includeIfNull: false,
  )


  final int? slaBreached;



  @JsonKey(
    
    name: r'by_status',
    required: false,
    includeIfNull: false,
  )


  final Map<String, int>? byStatus;



  @JsonKey(
    
    name: r'by_technician',
    required: false,
    includeIfNull: false,
  )


  final List<SupportMetricsByTechnicianInner>? byTechnician;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SupportMetrics &&
      other.totalTickets == totalTickets &&
      other.openTickets == openTickets &&
      other.unassignedTickets == unassignedTickets &&
      other.resolvedThisMonth == resolvedThisMonth &&
      other.avgFirstResponseHours == avgFirstResponseHours &&
      other.avgResolutionHours == avgResolutionHours &&
      other.slaBreached == slaBreached &&
      other.byStatus == byStatus &&
      other.byTechnician == byTechnician;

    @override
    int get hashCode =>
        totalTickets.hashCode +
        openTickets.hashCode +
        unassignedTickets.hashCode +
        resolvedThisMonth.hashCode +
        avgFirstResponseHours.hashCode +
        avgResolutionHours.hashCode +
        slaBreached.hashCode +
        byStatus.hashCode +
        byTechnician.hashCode;

  factory SupportMetrics.fromJson(Map<String, dynamic> json) => _$SupportMetricsFromJson(json);

  Map<String, dynamic> toJson() => _$SupportMetricsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

