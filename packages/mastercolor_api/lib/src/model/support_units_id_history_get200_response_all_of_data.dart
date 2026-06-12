//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mastercolor_api/src/model/service_history_event.dart';
import 'package:mastercolor_api/src/model/sold_unit.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'support_units_id_history_get200_response_all_of_data.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SupportUnitsIdHistoryGet200ResponseAllOfData {
  /// Returns a new [SupportUnitsIdHistoryGet200ResponseAllOfData] instance.
  SupportUnitsIdHistoryGet200ResponseAllOfData({

     this.unit,

     this.ticketsCount,

     this.timeline,
  });

  @JsonKey(
    
    name: r'unit',
    required: false,
    includeIfNull: false,
  )


  final SoldUnit? unit;



  @JsonKey(
    
    name: r'tickets_count',
    required: false,
    includeIfNull: false,
  )


  final int? ticketsCount;



  @JsonKey(
    
    name: r'timeline',
    required: false,
    includeIfNull: false,
  )


  final List<ServiceHistoryEvent>? timeline;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SupportUnitsIdHistoryGet200ResponseAllOfData &&
      other.unit == unit &&
      other.ticketsCount == ticketsCount &&
      other.timeline == timeline;

    @override
    int get hashCode =>
        unit.hashCode +
        ticketsCount.hashCode +
        timeline.hashCode;

  factory SupportUnitsIdHistoryGet200ResponseAllOfData.fromJson(Map<String, dynamic> json) => _$SupportUnitsIdHistoryGet200ResponseAllOfDataFromJson(json);

  Map<String, dynamic> toJson() => _$SupportUnitsIdHistoryGet200ResponseAllOfDataToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

