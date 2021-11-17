import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:form_signup_app/commons/colors.dart';
import 'package:form_signup_app/commons/dialogs.dart';

class AppSignUpHeader extends StatelessWidget {
  const AppSignUpHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Sign Up',
          style: bigTextStyle,
        ),
        const Spacer(),
        const Text(
          'Already have an account?',
          style: smallTextStyle,
        ),
        TextButton(
          onPressed: () {
            dev.log('Login button pressed', name: runtimeType.toString());
            AppDialogs.showMessage(context, 'Login not implemented yet!');
          },
          child: const Text('Log In'),
        )
      ],
    );
  }

  static const bigTextStyle = TextStyle(
    fontSize: 23,
    color: AppColors.white,
    fontWeight: FontWeight.w700,
  );

  static const smallTextStyle = TextStyle(
    fontSize: 16,
    color: AppColors.lightGrey,
  );
}
