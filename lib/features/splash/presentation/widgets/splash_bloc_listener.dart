import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/networking/dio_factory.dart';
import '../../../../core/routing/app_routes.dart';
import '../cubit/splash_cubit.dart';
import '../cubit/splash_state.dart';

class SplashBlocListener extends StatelessWidget {
  final Widget child;
  const SplashBlocListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listenWhen: (previous, current) => current.maybeWhen(
        navigateHome: (_) => true,
        navigateLogin: () => true,
        orElse: () => false,
      ),
      listener: (context, state) {
        state.whenOrNull(
          navigateHome: (token) {
            DioFactory.setTokenIntoHeaderAfterLogin(token);
            context.go(AppRoutes.home);
          },
          navigateLogin: () {
            context.go(AppRoutes.login);
          },
        );
      },
      child: child,
    );
  }
}
