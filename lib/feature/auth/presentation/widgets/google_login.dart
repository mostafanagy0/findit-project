import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,

      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Color(0xFFF0F2F5),
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color(0xFFF0F2F5), width: 1),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: () {},
        child: ListTile(
          visualDensity: const VisualDensity(
            vertical: VisualDensity.minimumDensity,
          ),
          leading: SvgPicture.asset('assets/image/google_icon.svg'),
          title: Text(
            'Login with Google',
            textAlign: TextAlign.center,
            // style: TextStyles.semiBold16,
          ),
        ),
      ),
    );
  }
}
