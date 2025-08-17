import 'package:findit/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.suffexIcon,
    this.onSaved,
    this.obscureText = false,
    this.validator,
  });
  final String hintText;
  final TextInputType textInputType;
  final Widget? suffexIcon;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onSaved: onSaved,
      validator: validator,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintStyle: TextStyles.font16Narmal,
        suffixIcon: suffexIcon,
        hintText: hintText,
        filled: true,
        fillColor: const Color(0xFFF0F2F5),
        border: buildBorder(),
        focusedBorder: buildBorder(),
        enabledBorder: buildBorder(),
      ),
    );
  }
}

OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(width: 1, color: Color(0xFFE6E9E9)),
  );
}
