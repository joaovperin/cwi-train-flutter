import 'package:flutter/material.dart';
import 'package:marketplace_app/commons/colors.dart';
import 'package:marketplace_app/widgets/app_big_button.dart';
import 'package:marketplace_app/widgets/app_italic_title.dart';

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
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        // automaticallyImplyLeading: false,
      ),
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
                    const SizedBox(height: 90),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Don't have an account?",
                        style: TextStyle(color: AppColors.red, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 50),
                    AppBigButton(
                      'Continue',
                      onTap: () {
                        _formKey.currentState?.validate() ?? false;
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
    return _AppTextField(
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
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
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
    return _AppTextField(
      'Email Address',
      controller: controller,
      validator: _validator,
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

class _AppTextField extends StatelessWidget {
  const _AppTextField(
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
