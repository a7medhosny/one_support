import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../datasource/login_remote_data_source.dart';
import '../models/login_request_model.dart';
import '../models/login_response_model.dart';

class LoginRepository {
  final LoginRemoteDataSource _loginRemoteDataSource;

  const LoginRepository(this._loginRemoteDataSource);

  Future<ApiResult<LoginResponseModel>> login(
    LoginRequestModel loginRequestModel,
  ) async {
    try {
      final response = await _loginRemoteDataSource.login(loginRequestModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
