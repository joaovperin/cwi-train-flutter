import 'package:flutter/material.dart';
import 'package:marketplace_app/commons/colors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
    this.label, {
    Key? key,
    required this.controller,
    this.obscureText = false,
    this.validator,
  }) : super(key: key);

  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      style: const TextStyle(
        fontSize: 20,
        color: AppColors.darkGrey,
        fontFamily: 'Lato',
      ),
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelText: label,
        labelStyle: const TextStyle(
          color: AppColors.lightGrey,
          fontSize: 18,
          fontFamily: 'Lato',
        ),
        floatingLabelStyle: const TextStyle(
          color: AppColors.lightGrey,
          fontSize: 20,
          fontFamily: 'Lato',
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.lightGrey,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.red,
            width: 4,
          ),
        ),
      ),
    );
  }
}
