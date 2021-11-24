class UserModel {
  String email = '';
  String password = '';

  Future<bool> doLogin() async {
    //API Conection
    await Future.delayed(Duration(seconds: 2));
    return email == 'juliano@cwi.com' && password == '123';
  }
}
