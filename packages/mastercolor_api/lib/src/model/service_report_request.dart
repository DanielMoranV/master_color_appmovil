//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:mastercolor_api/src/model/service_report_request_parts_inner.dart';
import 'package:dio/dio.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'service_report_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ServiceReportRequest {
  /// Returns a new [ServiceReportRequest] instance.
  ServiceReportRequest({

    required  this.workDone,

     this.clientSignedName,

     this.clientSignature,

     this.clientSignatureFile,

     this.parts,

     this.photos,

     this.resolve,
  });

  @JsonKey(
    
    name: r'work_done',
    required: true,
    includeIfNull: false,
  )


  final String workDone;



  @JsonKey(
    
    name: r'client_signed_name',
    required: false,
    includeIfNull: false,
  )


  final String? clientSignedName;



      /// Firma como cadena base64 (data URI o base64 puro). Alternativa a client_signature_file.
  @JsonKey(
    
    name: r'client_signature',
    required: false,
    includeIfNull: false,
  )


  final String? clientSignature;



      /// Firma como imagen (multipart). Alternativa a client_signature.
  @JsonKey(ignore: true)


  final MultipartFile? clientSignatureFile;



      /// Repuestos consumidos durante la visita (descuentan inventario).
  @JsonKey(
    
    name: r'parts',
    required: false,
    includeIfNull: false,
  )


  final List<ServiceReportRequestPartsInner>? parts;



      /// Fotos del servicio (multipart).
  @JsonKey(ignore: true)


  final List<MultipartFile>? photos;



      /// Si es true, marca el ticket como 'resuelto' al cerrar el acta.
  @JsonKey(
    
    name: r'resolve',
    required: false,
    includeIfNull: false,
  )


  final bool? resolve;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ServiceReportRequest &&
      other.workDone == workDone &&
      other.clientSignedName == clientSignedName &&
      other.clientSignature == clientSignature &&
      other.clientSignatureFile == clientSignatureFile &&
      other.parts == parts &&
      other.photos == photos &&
      other.resolve == resolve;

    @override
    int get hashCode =>
        workDone.hashCode +
        clientSignedName.hashCode +
        clientSignature.hashCode +
        clientSignatureFile.hashCode +
        parts.hashCode +
        photos.hashCode +
        resolve.hashCode;

  factory ServiceReportRequest.fromJson(Map<String, dynamic> json) => _$ServiceReportRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceReportRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

