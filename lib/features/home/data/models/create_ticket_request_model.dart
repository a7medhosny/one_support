import 'package:json_annotation/json_annotation.dart';

part 'create_ticket_request_model.g.dart';

@JsonSerializable()
class CreateTicketRequestModel {
  final String title;
  final String description;
  final TicketPriority priority;

  const CreateTicketRequestModel({
    required this.title,
    required this.description,
    required this.priority,
  });

  factory CreateTicketRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateTicketRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateTicketRequestModelToJson(this);
}

@JsonEnum(alwaysCreate: true)
enum TicketPriority {
  @JsonValue('Low')
  low,

  @JsonValue('Medium')
  medium,

  @JsonValue('High')
  high,

  @JsonValue('Critical')
  critical,
}