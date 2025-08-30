import 'package:findit/core/di/get_it.dart';
import 'package:findit/core/routing/routes.dart';
import 'package:findit/feature/auth/presentation/cubit/cubit/signin_cubit.dart';
import 'package:findit/feature/auth/presentation/cubit/cubit/signup_cubit_cubit.dart';
import 'package:findit/feature/auth/presentation/views/login_view.dart';
import 'package:findit/feature/auth/presentation/views/signup_view.dart';
import 'package:findit/feature/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SigninCubit>(),
            child: LoginView(),
          ),
        );
      case Routes.signupview:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignupView(),
          ),
        );
      case Routes.homeView:
        return MaterialPageRoute(builder: (_) => const HomeView());
      default:
        return null;
    }
  }
}
