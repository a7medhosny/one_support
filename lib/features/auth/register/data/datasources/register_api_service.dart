import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/networking/api_endpoints.dart';
import '../models/register_request_model.dart';
import '../models/register_response_model.dart';

part 'register_api_service.g.dart';

@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class RegisterApiService {
  factory RegisterApiService(Dio dio, {String baseUrl}) = _RegisterApiService;

  @POST(ApiEndpoints.register)
  Future<RegisterResponseModel> register(@Body() RegisterRequestModel registerRequestModel);
}
