import 'package:findit/core/widgets/custom_botton.dart';
import 'package:findit/core/widgets/custom_text_field.dart';
import 'package:findit/feature/auth/presentation/cubit/cubit/signin_cubit.dart';
import 'package:findit/feature/auth/presentation/widgets/google_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            onSaved: (value) {
              email = value!;
            },
            hintText: 'Email',
            textInputType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email is required';
              } else if (!value.contains('@')) {
                return 'Enter a valid email';
              }
              return null;
            },
          ),
          SizedBox(height: 12),
          CustomTextFormField(
            hintText: 'Password',
            onSaved: (value) {
              password = value!;
            },
            textInputType: TextInputType.visiblePassword,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password is required';
              } else if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
          ),
          SizedBox(height: 12),
          SizedBox(height: 12),
          CustomButton(
            text: 'login',
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                context.read<SigninCubit>().signInWithEmailAndPassword(
                  email,
                  password,
                );
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
              }
            },
          ),
          SizedBox(height: 16),
          SocialLoginButton(),
        ],
      ),
    );
  }
}
