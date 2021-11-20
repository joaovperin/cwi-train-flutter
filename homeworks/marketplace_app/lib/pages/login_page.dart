import 'package:flutter/material.dart';
import 'package:marketplace_app/commons/colors.dart';
import 'package:marketplace_app/pages/home_page.dart';
import 'package:marketplace_app/pages/register_page.dart';
import 'package:marketplace_app/widgets/app_big_button.dart';
import 'package:marketplace_app/widgets/app_italic_title.dart';
import 'package:marketplace_app/widgets/app_text_field.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailCtrl.text = 'jonathan@app.com';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppItalicTitle('Login'),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Wrap(
                  runSpacing: 8,
                  children: [
                    _EmailAddressField(_emailCtrl),
                    _PasswordField(_passwordCtrl),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        child: const Text(
                          "Don't have an account?",
                          style: TextStyle(color: AppColors.red, fontSize: 16),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            RegisterPage.routeName,
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 80),
                    AppBigButton(
                      'Continue',
                      onTap: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          Navigator.of(context).pushNamed(
                            HomePage.routeName,
                          );
                        }
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField(
    this.controller, {
    Key? key,
  }) : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      'Password',
      controller: controller,
      obscureText: true,
      validator: _validator,
    );
  }

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }
}

class _EmailAddressField extends StatelessWidget {
  const _EmailAddressField(
    this.controller, {
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      'Email Address',
      controller: controller,
      validator: _validator,
      autofocus: true,
    );
  }

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email address is required';
    }
    if (!RegExp(
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
    ).hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }
}
