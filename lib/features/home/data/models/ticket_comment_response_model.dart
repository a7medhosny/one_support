import 'package:json_annotation/json_annotation.dart';

part 'ticket_comment_response_model.g.dart';

@JsonSerializable()
class TicketCommentResponseModel {
  final String id;
  final String ticketId;
  final String userId;
  final String userName;
  final String content;
  final DateTime createdAt;

  const TicketCommentResponseModel({
    required this.id,
    required this.ticketId,
    required this.userId,
    required this.userName,
    required this.content,
    required this.createdAt,
  });

  factory TicketCommentResponseModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$TicketCommentResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TicketCommentResponseModelToJson(this);
}