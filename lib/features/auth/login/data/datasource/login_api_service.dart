import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/networking/api_endpoints.dart';
import '../models/login_request_model.dart';
import '../models/login_response_model.dart';

part 'login_api_service.g.dart';

@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class LoginApiService {
  factory LoginApiService(Dio dio, {String baseUrl}) = _LoginApiService;

  @POST(ApiEndpoints.login)
  Future<LoginResponseModel> login(@Body() LoginRequestModel loginRequestModel);
}
