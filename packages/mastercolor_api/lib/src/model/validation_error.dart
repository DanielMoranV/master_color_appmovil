//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'validation_error.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ValidationError {
  /// Returns a new [ValidationError] instance.
  ValidationError({

     this.success,

     this.message,

     this.data,

     this.errors,
  });

  @JsonKey(
    
    name: r'success',
    required: false,
    includeIfNull: false,
  )


  final bool? success;



  @JsonKey(
    
    name: r'message',
    required: false,
    includeIfNull: false,
  )


  final String? message;



  @JsonKey(
    
    name: r'data',
    required: false,
    includeIfNull: false,
  )


  final Object? data;



  @JsonKey(
    
    name: r'errors',
    required: false,
    includeIfNull: false,
  )


  final Map<String, List<String>>? errors;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ValidationError &&
      other.success == success &&
      other.message == message &&
      other.data == data &&
      other.errors == errors;

    @override
    int get hashCode =>
        success.hashCode +
        message.hashCode +
        (data == null ? 0 : data.hashCode) +
        errors.hashCode;

  factory ValidationError.fromJson(Map<String, dynamic> json) => _$ValidationErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ValidationErrorToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

