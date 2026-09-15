import 'package:go_router/go_router.dart';

import 'app_routes.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      // builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: AppRoutes.login,
      // builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: AppRoutes.home,
      // builder: (context, state) => const HomePage(),
    ),
  ],
);