import 'package:findit/core/helpers/extentions.dart';
import 'package:findit/core/routing/routes.dart';
import 'package:findit/core/utils/text_style.dart';
import 'package:findit/core/widgets/custom_botton.dart';
import 'package:findit/feature/auth/presentation/widgets/custom_account_state.dart';
import 'package:findit/feature/auth/presentation/widgets/google_login.dart';
import 'package:findit/feature/auth/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text('Lost & Found', style: TextStyles.font18Bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text('Welcome back', style: TextStyles.font22Bold)),
            SizedBox(height: 12),
            LoginForm(),
            //Text('  Forgot password ?', style: TextStyles.font16Narmal),
            SizedBox(height: 12),
            CustomButton(text: 'login', onPressed: () {}),
            SizedBox(height: 16),
            SocialLoginButton(),
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
      ),
    );
  }
}
