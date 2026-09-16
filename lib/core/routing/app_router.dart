import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/login/presentation/pages/login_page.dart';
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
      builder: (context, state) => Scaffold(
        appBar: AppBar(title: const Text('Register')),
        body: const Center(child: Text('Register Page')),
      ),
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
