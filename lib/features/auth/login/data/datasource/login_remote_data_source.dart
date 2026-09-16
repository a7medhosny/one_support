import '../models/login_request_model.dart';
import '../models/login_response_model.dart';
import 'login_api_service.dart';

class LoginRemoteDataSource {
  final LoginApiService _loginApiService;

  const LoginRemoteDataSource(this._loginApiService);

  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async {
    return await _loginApiService.login(loginRequestModel);
  }
}
