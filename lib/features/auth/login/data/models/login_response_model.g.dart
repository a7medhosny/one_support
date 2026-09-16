// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    LoginResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      token: json['token'] as String?,
      expiration: json['expiration'] as String?,
      refreshToken: json['refreshToken'] as String?,
      refreshTokenExpirationDateTime:
          json['refreshTokenExpirationDateTime'] as String?,
    );

Map<String, dynamic> _$LoginResponseModelToJson(LoginResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'statusCode': instance.statusCode,
      'userName': instance.userName,
      'email': instance.email,
      'token': instance.token,
      'expiration': instance.expiration,
      'refreshToken': instance.refreshToken,
      'refreshTokenExpirationDateTime': instance.refreshTokenExpirationDateTime,
    };
