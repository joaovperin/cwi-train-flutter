import 'package:marketplace_app/pages/login_page.dart';

class Routes {
  const Routes._();

  static const initialRoute = LoginPage.routeName;

  static final routes = {
    LoginPage.routeName: (context) => const LoginPage(),
  };
}
