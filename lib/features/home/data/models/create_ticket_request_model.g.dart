// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_ticket_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateTicketRequestModel _$CreateTicketRequestModelFromJson(
  Map<String, dynamic> json,
) => CreateTicketRequestModel(
  title: json['title'] as String,
  description: json['description'] as String,
  priority: $enumDecode(_$TicketPriorityEnumMap, json['priority']),
);

Map<String, dynamic> _$CreateTicketRequestModelToJson(
  CreateTicketRequestModel instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'priority': _$TicketPriorityEnumMap[instance.priority]!,
};

const _$TicketPriorityEnumMap = {
  TicketPriority.low: 'Low',
  TicketPriority.medium: 'Medium',
  TicketPriority.high: 'High',
  TicketPriority.critical: 'Critical',
};
