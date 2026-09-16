import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/networking/api_result.dart';
import '../../../../../core/storage/preferences/preferences_constants.dart';
import '../../../../../core/storage/preferences/preferences_service.dart';
import '../../../../../core/storage/secure_storage/secure_storage_constants.dart';
import '../../../../../core/storage/secure_storage/secure_storage_service.dart';
import '../../data/models/login_request_model.dart';
import '../../data/models/login_response_model.dart';
import '../../data/repository/login_repository.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository _loginRepository;
  final SecureStorageService _secureStorageService;
  final PreferencesService _preferencesService;

  LoginCubit(
    this._loginRepository,
    this._secureStorageService,
    this._preferencesService,
  ) : super(const LoginState.initial());

  /// Returns whether remember me is enabled.
  bool get isRememberMeEnabled =>
      _preferencesService.getBool(PreferencesConstants.rememberMe) ?? false;

  /// Returns the saved email if remember me was enabled.
  String? get savedEmail =>
      _preferencesService.getString(PreferencesConstants.userEmail);
//TODO 
  Future<bool> get isUserLoggedIn async =>
      await _secureStorageService.get(
        key: SecureStorageConstants.accessToken,
      ) !=
      null;

  Future<void> login(LoginRequestModel loginRequestModel) async {
    emit(const LoginState.loading());

    final result = await _loginRepository.login(loginRequestModel);

    switch (result) {
      case Success(:final data):
        await _saveUserData(loginRequestModel, data);
        emit(LoginState.success(data));

      case Failure(:final errorHandler):
        emit(LoginState.failure(errorHandler.apiErrorModel));
    }
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
}
