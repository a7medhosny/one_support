// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_comment_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketCommentResponseModel _$TicketCommentResponseModelFromJson(
  Map<String, dynamic> json,
) => TicketCommentResponseModel(
  id: json['id'] as String,
  ticketId: json['ticketId'] as String,
  userId: json['userId'] as String,
  userName: json['userName'] as String,
  content: json['content'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$TicketCommentResponseModelToJson(
  TicketCommentResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'ticketId': instance.ticketId,
  'userId': instance.userId,
  'userName': instance.userName,
  'content': instance.content,
  'createdAt': instance.createdAt.toIso8601String(),
};
