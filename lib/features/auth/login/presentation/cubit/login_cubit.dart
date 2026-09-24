import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/networking/api_result.dart';
import '../../data/models/login_request_model.dart';
import '../../data/repository/login_repository.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository _loginRepository;


  LoginCubit(
    this._loginRepository,
  ) : super(const LoginState.initial());


  /// Returns whether remember me is enabled.
  bool get isRememberMeEnabled =>
      _loginRepository.isRememberMeEnabled;

  /// Returns the saved email if remember me was enabled.
  String? get savedEmail =>
      _loginRepository.savedEmail;

  Future<void> login(LoginRequestModel loginRequestModel) async {
    emit(const LoginState.loading());

    final result = await _loginRepository.login(loginRequestModel);

    switch (result) {
      case Success(:final data):
        emit(LoginState.success(data));

      case Failure(:final errorHandler):
      debugPrint('LoginCubit login error: ${errorHandler.apiErrorModel}');
        emit(LoginState.failure(errorHandler.apiErrorModel));
    }
  }



}
