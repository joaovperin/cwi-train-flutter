import 'package:flutter/material.dart';
import 'package:mvc/archs/mvc/login_controller.dart';
import 'package:mvc/archs/mvc/login_repository.dart';

import '../../home_page.dart';

/**
 * Créditos exemplo Flutterando https://www.youtube.com/watch?v=4KBqWANDbE4
 */

class LoginPageMVC extends StatefulWidget {
  @override
  _LoginPageMVCState createState() => _LoginPageMVCState();
}

class _LoginPageMVCState extends State<LoginPageMVC> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  LoginController _loginController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loginController = LoginController(LoginRepository());
  }

  @override
  void dispose() {
    super.dispose();
  }

  _loginSuccess() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => HomePage()),
    );
  }

  _loginError() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text('Login error'),
      backgroundColor: Colors.red,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MVC'),
      ),
      key: _scaffoldKey,
      body: Form(
        key: _loginController.formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'email',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Campo não pode ser vazio';
                  } else if (!value.contains('@')) {
                    return 'Email não é válido';
                  }
                  return null;
                },
                onSaved: (value) => _loginController.userEmail = value,
              ),
              SizedBox(height: 10),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'password',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Campo não pode ser vazio';
                  }
                  return null;
                },
                onSaved: (value) => _loginController.userPassword = value,
              ),
              SizedBox(height: 30),
              RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 80),
                textColor: Colors.white,
                color: Colors.blue,
                child: Text('ENTER'),
                onPressed: _isLoading
                    ? null
                    : () async {
                        setState(() => _isLoading = true);
                        try {
                          final status = await _loginController.login();
                          if (status) {
                            _loginSuccess();
                          } else {
                            _loginError();
                          }
                        } finally {
                          setState(() => _isLoading = false);
                        }
                      },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
