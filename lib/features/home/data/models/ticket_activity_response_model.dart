import 'package:json_annotation/json_annotation.dart';

part 'ticket_activity_response_model.g.dart';

@JsonSerializable()
class TicketActivityResponseModel {
  final String id;
  final String ticketId;
  final String userId;
  final String userName;
  final String type;
  final String description;
  final String? oldValue;
  final String? newValue;
  final DateTime createdAt;

  const TicketActivityResponseModel({
    required this.id,
    required this.ticketId,
    required this.userId,
    required this.userName,
    required this.type,
    required this.description,
    this.oldValue,
    this.newValue,
    required this.createdAt,
  });

  factory TicketActivityResponseModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$TicketActivityResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TicketActivityResponseModelToJson(this);
}