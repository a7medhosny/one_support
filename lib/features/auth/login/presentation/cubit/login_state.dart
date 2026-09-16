import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/networking/api_error_model.dart';
import '../../data/models/login_response_model.dart';

part 'login_state.freezed.dart';

@freezed
sealed class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.success(LoginResponseModel loginResponseModel) =
      _Success;
  const factory LoginState.failure(ApiErrorModel apiErrorModel) = _Failure;
}

