import 'package:marketplace_app/pages/register_page.dart';

class Routes {
  const Routes._();

  static const initialRoute = RegisterPage.routeName;

  static final routes = {
    RegisterPage.routeName: (context) => const RegisterPage(),
  };
}
