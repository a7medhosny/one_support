import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_support/features/splash/presentation/widgets/splash_bloc_listener.dart';
import '../../../../core/di/get_it.dart';
import '../../../../core/helpers/spacing.dart';
import '../cubit/splash_cubit.dart';
import '../widgets/splash_app_name.dart';
import '../widgets/splash_description.dart';
import '../widgets/splash_logo.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashCubit>(
      create: (_) => getIt<SplashCubit>()..checkUserLoginStatus(),
      child: const _SplashPageContent(),
    );
  }
}

class _SplashPageContent extends StatelessWidget {
  const _SplashPageContent();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashBlocListener(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SplashLogo(),
              verticalSpace(4),
              const SplashAppName(),
              verticalSpace(16),
              const SplashDescription(),
            ],
          ),
        ),
      ),
    );
  }
}
