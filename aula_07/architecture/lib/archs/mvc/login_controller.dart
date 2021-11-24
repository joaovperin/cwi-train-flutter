import 'package:flutter/material.dart';
import 'package:mvc/archs/mvc/login_repository.dart';
import 'package:mvc/archs/mvc/user_model.dart';

class LoginController {
  final formKey = GlobalKey<FormState>();

  final LoginRepository _loginRepository;

  LoginController(this._loginRepository);

  UserModel _model = UserModel();

  Future<bool> login() async {
    if (!formKey.currentState.validate()) {
      return false;
    }
    formKey.currentState.save();
    return _loginRepository.doLogin(_model);
  }

  set userEmail(String value) => _model.email = value;
  set userPassword(String value) => _model.password = value;
}
