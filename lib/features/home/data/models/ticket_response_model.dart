import 'package:json_annotation/json_annotation.dart';

part 'ticket_response_model.g.dart';

@JsonSerializable()
class TicketResponseModel {
  final String id;
  final String title;
  final String description;
  final String status;
  final String priority;
  final String customerId;
  final String customerName;
  final String? assignedAgentId;
  final String? assignedAgentName;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? resolvedAt;
  final DateTime? closedAt;

  const TicketResponseModel({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.priority,
    required this.customerId,
    required this.customerName,
    this.assignedAgentId,
    this.assignedAgentName,
    required this.createdAt,
    required this.updatedAt,
    this.resolvedAt,
    this.closedAt,
  });

  factory TicketResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TicketResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TicketResponseModelToJson(this);
}