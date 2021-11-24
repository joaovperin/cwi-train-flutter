import 'package:flutter/material.dart';

import 'package:mvc/archs/mvc/user_model.dart';

import 'login_repository.dart';

abstract class LoginPageContract {
  void loginSuccess();
  void loginError();
  void loginManager();
}

class LoginPresenter {
  final formKey = GlobalKey<FormState>();

  final LoginPageContract viewContract;
  final LoginRepository repository;

  UserModel user = UserModel();
  bool isLoading = false;

  LoginPresenter(this.viewContract, {this.repository});

  userEmail(String value) => user.email = value;
  userPassword(String value) => user.password = value;

  Future<void> login() async {
    bool isLoginSuccess = false;
    isLoading = true;
    viewContract.loginManager();

    if (!formKey.currentState.validate()) {
      isLoginSuccess = false;
    } else {
      formKey.currentState.save();
      try {
        isLoginSuccess = await repository.doLogin(user);
      } catch (e) {
        isLoginSuccess = false;
      }
    }

    isLoading = false;
    viewContract.loginManager();

    if (isLoginSuccess) {
      viewContract.loginSuccess();
    } else {
      viewContract.loginError();
    }
  }
}
