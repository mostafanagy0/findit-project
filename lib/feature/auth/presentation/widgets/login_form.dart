import 'package:findit/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomTextFormField(
          hintText: 'Email',
          textInputType: TextInputType.emailAddress,
        ),
        SizedBox(height: 12),
        CustomTextFormField(
          hintText: 'Password',
          textInputType: TextInputType.emailAddress,
        ),
        SizedBox(height: 12),
      ],
    );
  }
}
