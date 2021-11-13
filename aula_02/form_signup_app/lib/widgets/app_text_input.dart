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
    return SizedBox(
      height: 80,
      child: TextFormField(
        validator: validator,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          labelText: fieldName,
          labelStyle: const TextStyle(color: AppColors.white),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.white),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.white),
          ),
        ),
        obscureText: obscureText,
        cursorColor: AppColors.white,
        style: const TextStyle(color: AppColors.white),
      ),
    );
  }
}
