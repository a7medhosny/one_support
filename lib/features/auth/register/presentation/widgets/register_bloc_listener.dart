import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/helpers/ui_feedback_helper.dart';
import '../../../../../core/routing/app_routes.dart';
import '../cubit/register_cubit.dart';
import '../cubit/register_state.dart';

class RegisterBlocListener extends StatelessWidget {
  final Widget child;

  const RegisterBlocListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) => current.maybeWhen(
        success: (_) => true,
        failure: (_) => true,
        orElse: () => false,
      ),
      listener: (context, state) {
        state.whenOrNull(
          success: (message) {
            UIFeedbackHelper.showSuccessSnackBar(
              context: context,
              message: message.isNotEmpty
                  ? message
                  : context.l10n.registerSuccess,
            );
            context.pushReplacement(AppRoutes.login);
          },
          failure: (apiErrorModel) {
            final errorMessage =
                apiErrorModel.errors?.firstOrNull ??
                apiErrorModel.message ??
                context.l10n.registerFailed;
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
