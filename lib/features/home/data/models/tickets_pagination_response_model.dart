import 'package:json_annotation/json_annotation.dart';

import 'ticket_response_model.dart';

part 'tickets_pagination_response_model.g.dart';

@JsonSerializable()
class TicketsPaginationResponseModel {
  final List<TicketResponseModel> items;
  final int page;
  final int pageSize;
  final int totalCount;
  final int totalPages;

  const TicketsPaginationResponseModel({
    required this.items,
    required this.page,
    required this.pageSize,
    required this.totalCount,
    required this.totalPages,
  });

  factory TicketsPaginationResponseModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$TicketsPaginationResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TicketsPaginationResponseModelToJson(this);
}