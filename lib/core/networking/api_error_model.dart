import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final bool? success;

  final String? message;

  @JsonKey(name: 'statusCode')
  final int? code;

  final List<String>? errors;

  const ApiErrorModel({
    this.success,
    this.message,
    this.code,
    this.errors,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  ApiErrorModel copyWith({
    bool? success,
    String? message,
    int? code,
    List<String>? errors,
  }) {
    return ApiErrorModel(
      success: success ?? this.success,
      message: message ?? this.message,
      code: code ?? this.code,
      errors: errors ?? this.errors,
    );
  }
}