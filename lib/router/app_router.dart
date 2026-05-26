import 'package:flutter/material.dart';

import '../shared/screens/splash_view.dart';
import '../features/login/screens/login_view.dart';
import '../features/signup/screens/signup_view.dart';
import '../features/forgot_password/screens/forgot_password_view.dart';
import '../features/forgot_password/screens/check_email_view.dart';
import '../features/forgot_password/screens/successfully_view.dart';
import '../features/Home/screens/home_view.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgot-password';
  static const String checkEmail = '/check-email';
  static const String successfully = '/successfully';
  static const String home = '/home';
}

class AppRouter {
  static Map<String, WidgetBuilder> routes = {
    AppRoutes.splash: (context) => const SplashView(),
    AppRoutes.login: (context) => const LoginView(),
    AppRoutes.signup: (context) => const SignUpView(),
    AppRoutes.forgotPassword: (context) => const ForgotPasswordView(),
    AppRoutes.checkEmail: (context) => const CheckEmailView(),
    AppRoutes.successfully: (context) => const SuccessfullyView(),
    AppRoutes.home: (context) => const HomeView(),
  };
}