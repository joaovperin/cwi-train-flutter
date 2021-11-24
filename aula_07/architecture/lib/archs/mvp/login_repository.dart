import 'package:mvc/archs/mvc/user_model.dart';

class LoginRepository {
  Future<bool> doLogin(UserModel model) async {
    //API Conection
    await Future.delayed(Duration(seconds: 2));
    return model.email == 'jacob@cwi.com' && model.password == '123';
  }
}
