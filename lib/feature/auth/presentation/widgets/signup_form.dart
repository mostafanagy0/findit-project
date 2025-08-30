import 'package:findit/core/widgets/custom_botton.dart';
import 'package:findit/core/widgets/custom_text_field.dart';
import 'package:findit/feature/auth/presentation/cubit/cubit/signup_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String name = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'Name',
            textInputType: TextInputType.text,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Name is required';
              }
              return null;
            },
            onSaved: (value) {
              name = value!;
            },
          ),
          const SizedBox(height: 12),
          CustomTextFormField(
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
            onSaved: (value) {
              email = value!;
            },
          ),
          const SizedBox(height: 12),
          CustomTextFormField(
            hintText: 'Password',
            textInputType: TextInputType.visiblePassword,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password is required';
              } else if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
            onSaved: (value) {
              password = value!;
            },
          ),
          const SizedBox(height: 16),
          CustomButton(
            text: 'SignUp',
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();

                context.read<SignupCubit>().createUserWithEmailAndPassword(
                  email,
                  password,
                  name,
                );
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
