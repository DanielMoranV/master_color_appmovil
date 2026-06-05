//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pagination.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Pagination {
  /// Returns a new [Pagination] instance.
  Pagination({

     this.currentPage,

     this.lastPage,

     this.perPage,

     this.total,
  });

  @JsonKey(
    
    name: r'current_page',
    required: false,
    includeIfNull: false,
  )


  final int? currentPage;



  @JsonKey(
    
    name: r'last_page',
    required: false,
    includeIfNull: false,
  )


  final int? lastPage;



  @JsonKey(
    
    name: r'per_page',
    required: false,
    includeIfNull: false,
  )


  final int? perPage;



  @JsonKey(
    
    name: r'total',
    required: false,
    includeIfNull: false,
  )


  final int? total;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Pagination &&
      other.currentPage == currentPage &&
      other.lastPage == lastPage &&
      other.perPage == perPage &&
      other.total == total;

    @override
    int get hashCode =>
        currentPage.hashCode +
        lastPage.hashCode +
        perPage.hashCode +
        total.hashCode;

  factory Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

