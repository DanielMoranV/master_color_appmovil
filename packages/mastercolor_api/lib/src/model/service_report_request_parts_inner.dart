//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'service_report_request_parts_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ServiceReportRequestPartsInner {
  /// Returns a new [ServiceReportRequestPartsInner] instance.
  ServiceReportRequestPartsInner({

    required  this.stockId,

    required  this.qty,
  });

  @JsonKey(
    
    name: r'stock_id',
    required: true,
    includeIfNull: false,
  )


  final int stockId;



          // minimum: 1
  @JsonKey(
    
    name: r'qty',
    required: true,
    includeIfNull: false,
  )


  final int qty;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ServiceReportRequestPartsInner &&
      other.stockId == stockId &&
      other.qty == qty;

    @override
    int get hashCode =>
        stockId.hashCode +
        qty.hashCode;

  factory ServiceReportRequestPartsInner.fromJson(Map<String, dynamic> json) => _$ServiceReportRequestPartsInnerFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceReportRequestPartsInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

