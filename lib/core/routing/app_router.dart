import 'package:findit/core/routing/routes.dart';
import 'package:findit/feature/auth/presentation/views/login_view.dart';
import 'package:findit/feature/auth/presentation/views/signup_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginView:
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.signupview:
        return MaterialPageRoute(builder: (_) => SignupView());

      default:
        return null;
    }
  }
}
