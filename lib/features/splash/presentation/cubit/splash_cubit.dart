import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/login/data/repository/login_repository.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final LoginRepository _loginRepository;

  SplashCubit(this._loginRepository) : super(const SplashState.initial());

  Future<void> checkUserLoginStatus() async {
    await Future.delayed(const Duration(seconds: 3, milliseconds: 250));

    final isLoggedIn = await _loginRepository.isUserLoggedIn;
    if (isLoggedIn) {
      emit(const SplashState.navigateHome());
    } else {
      emit(const SplashState.navigateLogin());
    }
  }
}
