import 'package:flutter/material.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/storage/preferences/preferences_constants.dart';
import '../../../../../core/storage/preferences/preferences_service.dart';
import '../../../../../core/storage/secure_storage/secure_storage_constants.dart';
import '../../../../../core/storage/secure_storage/secure_storage_service.dart';
import '../datasource/login_remote_data_source.dart';
import '../models/login_request_model.dart';
import '../models/login_response_model.dart';

class LoginRepository {
  final LoginRemoteDataSource _loginRemoteDataSource;
  final SecureStorageService _secureStorageService;
  final PreferencesService _preferencesService;

  const LoginRepository(
    this._loginRemoteDataSource,
    this._secureStorageService,
    this._preferencesService,
  );

  Future<ApiResult<LoginResponseModel>> login(
    LoginRequestModel loginRequestModel,
  ) async {
    try {
      final response = await _loginRemoteDataSource.login(loginRequestModel);
      await _saveUserData(loginRequestModel, response);
      return ApiResult.success(response);
    } catch (error) {
      debugPrint('LoginRepository login error: $error');
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<void> logout() async {
    await _secureStorageService.clear();
  }

  Future<void> _saveUserData(
    LoginRequestModel request,
    LoginResponseModel data,
  ) async {
    // 1. Secure Storage for sensitive credentials
    if (data.token != null && data.token!.isNotEmpty) {
      await _secureStorageService.save(
        key: SecureStorageConstants.accessToken,
        value: data.token!,
      );
    }
    if (data.refreshToken != null && data.refreshToken!.isNotEmpty) {
      await _secureStorageService.save(
        key: SecureStorageConstants.refreshToken,
        value: data.refreshToken!,
      );
    }

    // 2. Preferences Storage for non-sensitive data
    await _preferencesService.saveBool(
      PreferencesConstants.rememberMe,
      request.rememberMe,
    );

    if (request.rememberMe) {
      await _preferencesService.saveString(
        PreferencesConstants.userEmail,
        request.email,
      );
    } else {
      await _preferencesService.remove(PreferencesConstants.userEmail);
    }

    if (data.userName != null && data.userName!.isNotEmpty) {
      await _preferencesService.saveString(
        PreferencesConstants.userName,
        data.userName!,
      );
    }
    if (data.expiration != null && data.expiration!.isNotEmpty) {
      await _preferencesService.saveString(
        PreferencesConstants.tokenExpiration,
        data.expiration!,
      );
    }
    if (data.refreshTokenExpirationDateTime != null &&
        data.refreshTokenExpirationDateTime!.isNotEmpty) {
      await _preferencesService.saveString(
        PreferencesConstants.refreshTokenExpiration,
        data.refreshTokenExpirationDateTime!,
      );
    }
  }

  /// Returns whether remember me is enabled.
  bool get isRememberMeEnabled =>
      _preferencesService.getBool(PreferencesConstants.rememberMe) ?? false;

  /// Returns the saved email if remember me was enabled.
  String? get savedEmail =>
      _preferencesService.getString(PreferencesConstants.userEmail);

  Future<String?> get userToken async =>
      await _secureStorageService.get(key: SecureStorageConstants.accessToken);

  Future<bool> isUserLoggedIn() async {
    final String? token = await userToken;
    return token != null && token.isNotEmpty && !isTokenExpired();
  }

  bool isTokenExpired() {
    final String? tokenExpiration = _preferencesService.getString(
      PreferencesConstants.tokenExpiration,
    );
    if (tokenExpiration == null || tokenExpiration.isEmpty) {
      return true; // Consider token expired if expiration is null or empty
    }

    final expirationDateTime = DateTime.tryParse(tokenExpiration);
    if (expirationDateTime == null) {
      return true; // Consider token expired if parsing fails
    }

    return DateTime.now().isAfter(expirationDateTime);
  }
}
