import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/login/presentation/pages/login_page.dart';
import '../../features/auth/register/presentation/pages/register_page.dart';
import 'app_routes.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.login,
  routes: [
    // GoRoute(
    //   path: AppRoutes.splash,
    //   builder: (context, state) => const SplashPage(),
    // ),
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: AppRoutes.register,
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: const Center(child: Text('Home Page')),
      ),
    ),
  ],
);
