import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/widgets/app_button.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LoginButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          previous.runtimeType != current.runtimeType,
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        return AppButton(
          text: context.l10n.login,
          isLoading: isLoading,
          onPressed: onPressed,
        );
      },
    );
  }
}
