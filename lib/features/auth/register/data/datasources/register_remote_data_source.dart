

import '../models/register_request_model.dart';
import '../models/register_response_model.dart';
import 'register_api_service.dart';

class RegisterRemoteDataSource {
  final RegisterApiService _registerApiService;

  const RegisterRemoteDataSource(this._registerApiService);

  Future<RegisterResponseModel> register(RegisterRequestModel registerRequestModel) async {
    return await _registerApiService.register(registerRequestModel);
  }
}
