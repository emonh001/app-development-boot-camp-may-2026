import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:m_expense/app/go_router/route_paths.dart';
import 'package:m_expense/features/authentication/presentation/screens/forgot_password_screen.dart';
import 'package:m_expense/features/authentication/presentation/screens/signin_screen.dart';
import 'package:m_expense/features/authentication/presentation/screens/signup_screen.dart';
import 'package:m_expense/features/authentication/presentation/screens/splash_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: RoutePaths.splash,
    routes: [
      GoRoute(
        path: RoutePaths.splash,
        name: RoutePaths.splash,
        pageBuilder: (context, state) =>
            const MaterialPage(child: SplashScreen()),
      ),

      GoRoute(
        path: RoutePaths.signup,
        name: RoutePaths.signup,
        pageBuilder: (context, state) =>
        const MaterialPage(child: SignupScreen()),
      ),

      GoRoute(
        path: RoutePaths.signin,
        name: RoutePaths.signin,
        pageBuilder: (context, state) =>
        const MaterialPage(child: SigninScreen()),
      ),

      GoRoute(
        path: RoutePaths.forgotPassword,
        name: RoutePaths.forgotPassword,
        pageBuilder: (context, state) =>
        const MaterialPage(child: ForgotPasswordScreen()),
      ),

    ],
  );
}
