import 'package:mvc/archs/mvc/user_model.dart';

class LoginRepository {
  Future<bool> doLogin(UserModel model) {
    // API Connection
    return Future.delayed(Duration(seconds: 2), () {
      return model.email == 'joao.perin@cwi.com.br' && model.password == '123';
    });
  }
}
