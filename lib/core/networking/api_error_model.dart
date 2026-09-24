import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final bool? success;

  final String? message;

  final int? statusCode;

  final List<String>? errors;

  const ApiErrorModel({
    this.success,
    this.message,
    this.statusCode,
    this.errors,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  ApiErrorModel copyWith({
    bool? success,
    String? message,
    int? statusCode,
    List<String>? errors,
  }) {
    return ApiErrorModel(
      success: success ?? this.success,
      message: message ?? this.message,
      statusCode: statusCode ?? this.statusCode,
      errors: errors ?? this.errors,
    );
  }
}