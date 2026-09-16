import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  final bool? success;
  final String? message;
  final int? statusCode;
  final String? userName;
  final String? email;
  final String? token;
  final String? expiration;
  final String? refreshToken;
  final String? refreshTokenExpirationDateTime;

  const LoginResponseModel({
    this.success,
    this.message,
    this.statusCode,
    this.userName,
    this.email,
    this.token,
    this.expiration,
    this.refreshToken,
    this.refreshTokenExpirationDateTime,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}
