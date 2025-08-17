import 'package:findit/core/helpers/extentions.dart';
import 'package:findit/core/routing/routes.dart';
import 'package:findit/feature/auth/presentation/cubit/cubit/signup_cubit_cubit.dart';
import 'package:findit/feature/auth/presentation/widgets/google_login.dart';
import 'package:findit/feature/auth/presentation/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Signup successful! Welcome')),
          );
          context.pushNamed(Routes.loginView);
        } else if (state is SignupFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
        if (state is SignupLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: const [
              SizedBox(height: 12),
              SignupForm(),
              SizedBox(height: 18),
              SocialLoginButton(),
            ],
          ),
        );
      },
    );
  }
}
