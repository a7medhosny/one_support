// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_activity_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketActivityResponseModel _$TicketActivityResponseModelFromJson(
  Map<String, dynamic> json,
) => TicketActivityResponseModel(
  id: json['id'] as String,
  ticketId: json['ticketId'] as String,
  userId: json['userId'] as String,
  userName: json['userName'] as String,
  type: json['type'] as String,
  description: json['description'] as String,
  oldValue: json['oldValue'] as String?,
  newValue: json['newValue'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$TicketActivityResponseModelToJson(
  TicketActivityResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'ticketId': instance.ticketId,
  'userId': instance.userId,
  'userName': instance.userName,
  'type': instance.type,
  'description': instance.description,
  'oldValue': instance.oldValue,
  'newValue': instance.newValue,
  'createdAt': instance.createdAt.toIso8601String(),
};
