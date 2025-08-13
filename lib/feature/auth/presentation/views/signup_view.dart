import 'package:findit/core/widgets/build_app_bar.dart';
import 'package:findit/core/widgets/custom_botton.dart';
import 'package:findit/core/widgets/custom_text_field.dart';
import 'package:findit/feature/auth/presentation/widgets/google_login.dart';
import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context, title: 'Sign up'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 12),
            CustomTextFormField(
              hintText: 'Name',
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 12),
            CustomTextFormField(
              hintText: 'Email',
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 12),
            CustomTextFormField(
              hintText: 'Password',
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            CustomButton(text: 'SignUp', onPressed: () {}),
            SizedBox(height: 18),
            SocialLoginButton(),
          ],
        ),
      ),
    );
  }
}
