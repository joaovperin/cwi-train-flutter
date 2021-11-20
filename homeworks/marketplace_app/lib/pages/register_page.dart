import 'package:flutter/material.dart';
import 'package:marketplace_app/commons/colors.dart';
import 'package:marketplace_app/widgets/app_big_button.dart';
import 'package:marketplace_app/widgets/app_italic_title.dart';
import 'package:marketplace_app/widgets/app_text_field.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = '/register';
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final _fullNameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _mobileNumberCtrl = TextEditingController();
  final _countryFieldCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _confirmPasswordCtrl = TextEditingController();
  final _refCodeCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fullNameCtrl.text = 'Jonathan Doe';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_sharp,
            color: AppColors.darkGrey,
          ),
          onPressed: () {},
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppItalicTitle('Register'),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Wrap(
                  runSpacing: 8,
                  children: [
                    _FullNameField(_fullNameCtrl),
                    _EmailAddressField(_emailCtrl),
                    _MobileNumberField(_mobileNumberCtrl),
                    _CountryField(_countryFieldCtrl),
                    _PasswordField(_passwordCtrl),
                    _PasswordConfirmationField(
                      _confirmPasswordCtrl,
                      validator: _passwordConfirmationValidator,
                    ),
                    _RefCodeField(_refCodeCtrl),
                    const SizedBox(height: 90),
                    AppBigButton(
                      'Register',
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

  String? _passwordConfirmationValidator(input) {
    if (input == null || input.isEmpty) {
      return 'Password Confirmation is required';
    }
    if (_passwordCtrl.text != input) {
      return 'Passwords does not match';
    }
    return null;
  }
}

class _RefCodeField extends StatelessWidget {
  const _RefCodeField(
    this.controller, {
    Key? key,
  }) : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      'Referal Code (Optional)',
      controller: controller,
      validator: _validator,
    );
  }

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    if (value.length < 6) {
      return 'Referal code must be at least 6 characters';
    }
    return null;
  }
}

class _PasswordConfirmationField extends StatelessWidget {
  const _PasswordConfirmationField(
    this.controller, {
    required this.validator,
    Key? key,
  }) : super(key: key);
  final TextEditingController controller;
  final FormFieldValidator<String> validator;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      'Confirm Password',
      controller: controller,
      obscureText: true,
      validator: validator,
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
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
}

class _CountryField extends StatefulWidget {
  const _CountryField(
    this.controller, {
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  final String label = 'Country';
  final List<String> items = const [
    'United States',
    'Brazil',
    'Russia',
    'Wakanda'
  ];

  @override
  State<_CountryField> createState() => _CountryFieldState();
}

class _CountryFieldState extends State<_CountryField> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      isExpanded: true,
      itemHeight: 80,
      hint: Text(
        widget.label,
        style: const TextStyle(
          color: AppColors.lightGrey,
          fontSize: 20,
          fontFamily: 'Lato',
        ),
      ),
      icon: const Icon(
        Icons.arrow_drop_down,
        color: AppColors.red,
      ),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(
        color: AppColors.black,
        fontSize: 20,
        fontFamily: 'Lato',
      ),
      focusColor: AppColors.red,
      underline: Container(
        height: 1,
        color: AppColors.lightGrey,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue;
          if (newValue != null) {
            widget.controller.text = newValue;
          }
        });
      },
      items: widget.items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class _MobileNumberField extends StatelessWidget {
  const _MobileNumberField(
    this.controller, {
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return AppTextField(
      'Mobile Number',
      controller: controller,
      validator: _validator,
    );
  }

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Mobile number is required';
    }
    if (value.length != 10) {
      return 'Mobile number must be 10 digits';
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

class _FullNameField extends StatelessWidget {
  const _FullNameField(
    this.controller, {
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      'Full Name',
      controller: controller,
      validator: _validator,
    );
  }

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Full Name is required';
    }
    return null;
  }
}
