//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'support_ticket_client.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SupportTicketClient {
  /// Returns a new [SupportTicketClient] instance.
  SupportTicketClient({

     this.id,

     this.name,

     this.email,

     this.phone,
  });

  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final int? id;



  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



  @JsonKey(
    
    name: r'email',
    required: false,
    includeIfNull: false,
  )


  final String? email;



  @JsonKey(
    
    name: r'phone',
    required: false,
    includeIfNull: false,
  )


  final String? phone;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SupportTicketClient &&
      other.id == id &&
      other.name == name &&
      other.email == email &&
      other.phone == phone;

    @override
    int get hashCode =>
        id.hashCode +
        name.hashCode +
        email.hashCode +
        phone.hashCode;

  factory SupportTicketClient.fromJson(Map<String, dynamic> json) => _$SupportTicketClientFromJson(json);

  Map<String, dynamic> toJson() => _$SupportTicketClientToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

