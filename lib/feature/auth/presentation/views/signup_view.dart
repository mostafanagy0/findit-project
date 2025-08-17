import 'package:findit/core/widgets/build_app_bar.dart';
import 'package:findit/feature/auth/presentation/widgets/signup_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context, title: 'Sign up'),
      body: SignupViewBodyBlocConsumer(),
    );
  }
}
