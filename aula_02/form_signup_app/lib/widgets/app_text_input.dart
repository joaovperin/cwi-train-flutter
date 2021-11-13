import 'package:flutter/material.dart';
import 'package:form_signup_app/commons/colors.dart';

class AppTextInput extends StatelessWidget {
  const AppTextInput(
    this.fieldName, {
    Key? key,
    this.obscureText = false,
    this.validator,
    this.suffixIcon,
  }) : super(key: key);

  final String fieldName;
  final bool obscureText;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        labelText: fieldName,
        labelStyle: const TextStyle(color: AppColors.white),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.white),
        ),
      ),
      obscureText: obscureText,
      cursorColor: AppColors.white,
      style: const TextStyle(color: AppColors.white),
    );
  }
}
