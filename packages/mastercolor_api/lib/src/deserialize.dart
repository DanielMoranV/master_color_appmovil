import 'package:mastercolor_api/src/model/api_error.dart';
import 'package:mastercolor_api/src/model/api_success.dart';
import 'package:mastercolor_api/src/model/auth_me_get200_response.dart';
import 'package:mastercolor_api/src/model/auth_me_get200_response_all_of_data.dart';
import 'package:mastercolor_api/src/model/client_auth_me_get200_response.dart';
import 'package:mastercolor_api/src/model/client_auth_me_get200_response_all_of_data.dart';
import 'package:mastercolor_api/src/model/client_product.dart';
import 'package:mastercolor_api/src/model/client_products_get200_response.dart';
import 'package:mastercolor_api/src/model/client_support_tickets_get200_response.dart';
import 'package:mastercolor_api/src/model/client_support_tickets_id_attachments_post201_response.dart';
import 'package:mastercolor_api/src/model/client_support_tickets_id_get200_response.dart';
import 'package:mastercolor_api/src/model/client_support_tickets_id_messages_post201_response.dart';
import 'package:mastercolor_api/src/model/client_support_tickets_id_messages_post_request.dart';
import 'package:mastercolor_api/src/model/client_support_tickets_id_rate_post_request.dart';
import 'package:mastercolor_api/src/model/client_support_tickets_id_reopen_put_request.dart';
import 'package:mastercolor_api/src/model/client_support_tickets_post201_response.dart';
import 'package:mastercolor_api/src/model/client_units_get200_response.dart';
import 'package:mastercolor_api/src/model/client_units_id_get200_response.dart';
import 'package:mastercolor_api/src/model/client_units_id_warranty_get200_response.dart';
import 'package:mastercolor_api/src/model/client_units_post201_response.dart';
import 'package:mastercolor_api/src/model/client_user.dart';
import 'package:mastercolor_api/src/model/device_token_request.dart';
import 'package:mastercolor_api/src/model/diagnosis_request.dart';
import 'package:mastercolor_api/src/model/pagination.dart';
import 'package:mastercolor_api/src/model/sold_unit.dart';
import 'package:mastercolor_api/src/model/sold_unit_detail.dart';
import 'package:mastercolor_api/src/model/staff_user.dart';
import 'package:mastercolor_api/src/model/staff_user_role.dart';
import 'package:mastercolor_api/src/model/support_metrics.dart';
import 'package:mastercolor_api/src/model/support_metrics_by_technician_inner.dart';
import 'package:mastercolor_api/src/model/support_metrics_get200_response.dart';
import 'package:mastercolor_api/src/model/support_technicians_get200_response.dart';
import 'package:mastercolor_api/src/model/support_ticket.dart';
import 'package:mastercolor_api/src/model/support_ticket_detail.dart';
import 'package:mastercolor_api/src/model/support_tickets_id_assign_patch_request.dart';
import 'package:mastercolor_api/src/model/support_tickets_id_messages_post_request.dart';
import 'package:mastercolor_api/src/model/support_tickets_id_status_patch_request.dart';
import 'package:mastercolor_api/src/model/support_units_id_patch_request.dart';
import 'package:mastercolor_api/src/model/technician.dart';
import 'package:mastercolor_api/src/model/ticket_attachment.dart';
import 'package:mastercolor_api/src/model/ticket_create_request.dart';
import 'package:mastercolor_api/src/model/ticket_message.dart';
import 'package:mastercolor_api/src/model/ticket_status_history.dart';
import 'package:mastercolor_api/src/model/validation_error.dart';
import 'package:mastercolor_api/src/model/warranty.dart';

final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

  ReturnType deserialize<ReturnType, BaseType>(dynamic value, String targetType, {bool growable= true}) {
      switch (targetType) {
        case 'String':
          return '$value' as ReturnType;
        case 'int':
          return (value is int ? value : int.parse('$value')) as ReturnType;
        case 'bool':
          if (value is bool) {
            return value as ReturnType;
          }
          final valueString = '$value'.toLowerCase();
          return (valueString == 'true' || valueString == '1') as ReturnType;
        case 'double':
          return (value is double ? value : double.parse('$value')) as ReturnType;
        case 'ApiError':
          return ApiError.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ApiSuccess':
          return ApiSuccess.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AuthMeGet200Response':
          return AuthMeGet200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AuthMeGet200ResponseAllOfData':
          return AuthMeGet200ResponseAllOfData.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AuthorType':
          
          
        case 'ClientAuthMeGet200Response':
          return ClientAuthMeGet200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ClientAuthMeGet200ResponseAllOfData':
          return ClientAuthMeGet200ResponseAllOfData.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ClientProduct':
          return ClientProduct.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ClientProductsGet200Response':
          return ClientProductsGet200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ClientSupportTicketsGet200Response':
          return ClientSupportTicketsGet200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ClientSupportTicketsIdAttachmentsPost201Response':
          return ClientSupportTicketsIdAttachmentsPost201Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ClientSupportTicketsIdGet200Response':
          return ClientSupportTicketsIdGet200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ClientSupportTicketsIdMessagesPost201Response':
          return ClientSupportTicketsIdMessagesPost201Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ClientSupportTicketsIdMessagesPostRequest':
          return ClientSupportTicketsIdMessagesPostRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ClientSupportTicketsIdRatePostRequest':
          return ClientSupportTicketsIdRatePostRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ClientSupportTicketsIdReopenPutRequest':
          return ClientSupportTicketsIdReopenPutRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ClientSupportTicketsPost201Response':
          return ClientSupportTicketsPost201Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ClientUnitsGet200Response':
          return ClientUnitsGet200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ClientUnitsIdGet200Response':
          return ClientUnitsIdGet200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ClientUnitsIdWarrantyGet200Response':
          return ClientUnitsIdWarrantyGet200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ClientUnitsPost201Response':
          return ClientUnitsPost201Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ClientUser':
          return ClientUser.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DevicePlatform':
          
          
        case 'DeviceTokenRequest':
          return DeviceTokenRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DiagnosisRequest':
          return DiagnosisRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Pagination':
          return Pagination.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SoldUnit':
          return SoldUnit.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SoldUnitDetail':
          return SoldUnitDetail.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SoldUnitStatus':
          
          
        case 'StaffUser':
          return StaffUser.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'StaffUserRole':
          return StaffUserRole.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SupportMetrics':
          return SupportMetrics.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SupportMetricsByTechnicianInner':
          return SupportMetricsByTechnicianInner.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SupportMetricsGet200Response':
          return SupportMetricsGet200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SupportTechniciansGet200Response':
          return SupportTechniciansGet200Response.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SupportTicket':
          return SupportTicket.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SupportTicketDetail':
          return SupportTicketDetail.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SupportTicketsIdAssignPatchRequest':
          return SupportTicketsIdAssignPatchRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SupportTicketsIdMessagesPostRequest':
          return SupportTicketsIdMessagesPostRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SupportTicketsIdStatusPatchRequest':
          return SupportTicketsIdStatusPatchRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SupportUnitsIdPatchRequest':
          return SupportUnitsIdPatchRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Technician':
          return Technician.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TicketAttachment':
          return TicketAttachment.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TicketCategory':
          
          
        case 'TicketChannel':
          
          
        case 'TicketCreateRequest':
          return TicketCreateRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TicketMessage':
          return TicketMessage.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TicketPriority':
          
          
        case 'TicketStatus':
          
          
        case 'TicketStatusHistory':
          return TicketStatusHistory.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ValidationError':
          return ValidationError.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Warranty':
          return Warranty.fromJson(value as Map<String, dynamic>) as ReturnType;
        default:
          RegExpMatch? match;

          if (value is List && (match = _regList.firstMatch(targetType)) != null) {
            targetType = match![1]!; // ignore: parameter_assignments
            return value
              .map<BaseType>((dynamic v) => deserialize<BaseType, BaseType>(v, targetType, growable: growable))
              .toList(growable: growable) as ReturnType;
          }
          if (value is Set && (match = _regSet.firstMatch(targetType)) != null) {
            targetType = match![1]!; // ignore: parameter_assignments
            return value
              .map<BaseType>((dynamic v) => deserialize<BaseType, BaseType>(v, targetType, growable: growable))
              .toSet() as ReturnType;
          }
          if (value is Map && (match = _regMap.firstMatch(targetType)) != null) {
            targetType = match![1]!.trim(); // ignore: parameter_assignments
            return Map<String, BaseType>.fromIterables(
              value.keys as Iterable<String>,
              value.values.map((dynamic v) => deserialize<BaseType, BaseType>(v, targetType, growable: growable)),
            ) as ReturnType;
          }
          break;
    }
    throw Exception('Cannot deserialize');
  }