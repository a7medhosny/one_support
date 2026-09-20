import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../datasources/register_remote_data_source.dart';
import '../models/register_request_model.dart';
import '../models/register_response_model.dart';

class RegisterRepository {
  final RegisterRemoteDataSource _registerRemoteDataSource;

  const RegisterRepository(this._registerRemoteDataSource);

  Future<ApiResult<RegisterResponseModel>> register(
    RegisterRequestModel registerRequestModel,
  ) async {
    try {
      final response = await _registerRemoteDataSource.register(registerRequestModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
