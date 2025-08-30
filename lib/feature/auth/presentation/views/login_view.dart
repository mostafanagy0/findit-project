import 'package:findit/core/utils/text_style.dart';
import 'package:findit/feature/auth/presentation/widgets/login_view_body_bloc_consumer.dart';
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
      body: LoginViewBodyBlocConsumer(),
    );
  }
}
