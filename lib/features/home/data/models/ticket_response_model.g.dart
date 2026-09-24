// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketResponseModel _$TicketResponseModelFromJson(Map<String, dynamic> json) =>
    TicketResponseModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      status: json['status'] as String,
      priority: json['priority'] as String,
      customerId: json['customerId'] as String,
      customerName: json['customerName'] as String,
      assignedAgentId: json['assignedAgentId'] as String?,
      assignedAgentName: json['assignedAgentName'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      resolvedAt: json['resolvedAt'] == null
          ? null
          : DateTime.parse(json['resolvedAt'] as String),
      closedAt: json['closedAt'] == null
          ? null
          : DateTime.parse(json['closedAt'] as String),
    );

Map<String, dynamic> _$TicketResponseModelToJson(
  TicketResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'status': instance.status,
  'priority': instance.priority,
  'customerId': instance.customerId,
  'customerName': instance.customerName,
  'assignedAgentId': instance.assignedAgentId,
  'assignedAgentName': instance.assignedAgentName,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'resolvedAt': instance.resolvedAt?.toIso8601String(),
  'closedAt': instance.closedAt?.toIso8601String(),
};
