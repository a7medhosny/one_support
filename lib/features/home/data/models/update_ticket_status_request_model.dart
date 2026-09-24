import 'package:json_annotation/json_annotation.dart';

part 'update_ticket_status_request_model.g.dart';

@JsonSerializable()
class UpdateTicketStatusRequestModel {
  final String status;

  const UpdateTicketStatusRequestModel({
    required this.status,
  });

  factory UpdateTicketStatusRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateTicketStatusRequestModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$UpdateTicketStatusRequestModelToJson(this);
}