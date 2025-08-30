import 'package:findit/core/helpers/extentions.dart';
import 'package:findit/core/routing/routes.dart';
import 'package:findit/core/utils/text_style.dart';
import 'package:findit/feature/auth/presentation/cubit/cubit/signin_cubit.dart';
import 'package:findit/feature/auth/presentation/widgets/custom_account_state.dart';
import 'package:findit/feature/auth/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login successful! Welcome')),
          );
          context.pushNamedAndRemoveUntil(
            Routes.homeView,
            predicate: (route) {
              return false;
            },
          );
        } else if (state is SigninFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text('Welcome back', style: TextStyles.font22Bold)),
              SizedBox(height: 12),
              LoginForm(),

              //Text('  Forgot password ?', style: TextStyles.font16Narmal),
              SizedBox(height: 16),
              CustomAccountState(
                text1: 'Don\'t have an account? ',
                text2: 'Sign up',
                onTap: () {
                  context.pushNamed(Routes.signupview);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
