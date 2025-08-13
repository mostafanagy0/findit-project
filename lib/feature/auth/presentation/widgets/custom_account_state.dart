import 'package:findit/core/utils/app_colors.dart';
import 'package:findit/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class CustomAccountState extends StatelessWidget {
  const CustomAccountState({
    super.key,
    required this.text1,
    required this.text2,
    required this.onTap,
  });
  final String text1;
  final String text2;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text1, style: TextStyles.font16Narmal),
        GestureDetector(
          onTap: onTap,
          child: Text(
            text2,
            style: TextStyles.font16Narmal.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
