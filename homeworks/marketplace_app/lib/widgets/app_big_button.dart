import 'package:flutter/material.dart';

import 'package:marketplace_app/commons/colors.dart';

class AppBigButton extends StatelessWidget {
  const AppBigButton(
    this.text, {
    Key? key,
    this.onTap,
  }) : super(key: key);

  final String text;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: AppColors.red,
        ),
        width: MediaQuery.of(context).size.width,
        child: const Text(
          'Register',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
