import 'package:flutter/material.dart';
import 'package:marketplace_app/commons/colors.dart';

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
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
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
              const Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 34,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Lato',
                  ),
                ),
              ),
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
                    _RegisterButton(
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

class _RegisterButton extends StatelessWidget {
  const _RegisterButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

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

class _RefCodeField extends StatelessWidget {
  const _RefCodeField(
    this.controller, {
    Key? key,
  }) : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return _AppTextField(
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
    return _AppTextField(
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
    return _AppTextField(
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

class _FullNameField extends StatelessWidget {
  const _FullNameField(
    this.controller, {
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return _AppTextField(
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
