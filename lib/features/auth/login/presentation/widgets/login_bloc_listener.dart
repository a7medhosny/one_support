import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/helpers/ui_feedback_helper.dart';
import '../../../../../core/networking/dio_factory.dart';
import '../../../../../core/routing/app_routes.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  final Widget child;

  const LoginBlocListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) => current.maybeWhen(
        success: (_) => true,
        failure: (_) => true,
        orElse: () => false,
      ),
      listener: (context, state) {
        state.whenOrNull(
          success: (loginResponse) {
            if (loginResponse.token != null &&
                loginResponse.token!.isNotEmpty) {
              DioFactory.setTokenIntoHeaderAfterLogin(loginResponse.token!);
            }
            UIFeedbackHelper.showSuccessSnackBar(
              context: context,
              message: loginResponse.message ?? context.l10n.loginSuccess,
            );
            context.go(AppRoutes.home);
          },
          failure: (apiErrorModel) {
            final errorMessage =
                apiErrorModel.errors?.firstOrNull ??
                apiErrorModel.message ??
                context.l10n.loginFailed;
          

            UIFeedbackHelper.showErrorSnackBar(
              context: context,
              message: errorMessage,
            );
          },
        );
      },
      child: child,
    );
  }
}
