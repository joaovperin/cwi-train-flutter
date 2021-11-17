import 'package:flutter/material.dart';
import 'package:form_signup_app/commons/colors.dart';
import 'package:form_signup_app/commons/dialogs.dart';
import 'package:form_signup_app/commons/validators.dart';
import 'package:form_signup_app/widgets/app_signup_button.dart';
import 'package:form_signup_app/widgets/app_signup_header.dart';
import 'package:form_signup_app/widgets/app_text_input.dart';

class SignUpPage extends StatefulWidget {
  static const routeName = '/signup';
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 60, 20, 40),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: AppSignUpHeader(),
              ),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Wrap(
                  runSpacing: 20,
                  children: [
                    const AppTextInput('First name',
                        validator: Validators.name),
                    const AppTextInput('E-mail', validator: Validators.email),
                    AppTextInput(
                      'Password',
                      validator: Validators.password,
                      obscureText: !isPasswordVisible,
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.white,
                        ),
                        onPressed: () => setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        }),
                      ),
                    ),
                    AppSignUpButton(onTap: () {
                      if (!(_formKey.currentState?.validate() ?? false)) {
                        return;
                      }
                      AppDialogs.showMessage(
                          context, 'SignUp not implemented yet!');
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
