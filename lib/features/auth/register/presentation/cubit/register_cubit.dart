import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/networking/api_result.dart';
import '../../data/models/register_request_model.dart';
import '../../data/repository/register_repository.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepository _registerRepository;


  RegisterCubit(
    this._registerRepository,
  ) : super(const RegisterState.initial());



  Future<void> register(RegisterRequestModel registerRequestModel) async {
    emit(const RegisterState.loading());

    final result = await _registerRepository.register(registerRequestModel);

    switch (result) {
      case Success(:final data):
        emit(RegisterState.success(data.message ?? 'Registration successful'));

      case Failure(:final errorHandler):
        emit(RegisterState.failure(errorHandler.apiErrorModel));
    }
  }

}
