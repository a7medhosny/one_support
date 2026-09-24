// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tickets_pagination_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketsPaginationResponseModel _$TicketsPaginationResponseModelFromJson(
  Map<String, dynamic> json,
) => TicketsPaginationResponseModel(
  items: (json['items'] as List<dynamic>)
      .map((e) => TicketResponseModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  page: (json['page'] as num).toInt(),
  pageSize: (json['pageSize'] as num).toInt(),
  totalCount: (json['totalCount'] as num).toInt(),
  totalPages: (json['totalPages'] as num).toInt(),
);

Map<String, dynamic> _$TicketsPaginationResponseModelToJson(
  TicketsPaginationResponseModel instance,
) => <String, dynamic>{
  'items': instance.items,
  'page': instance.page,
  'pageSize': instance.pageSize,
  'totalCount': instance.totalCount,
  'totalPages': instance.totalPages,
};
