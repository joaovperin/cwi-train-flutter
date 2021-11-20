import 'package:marketplace_app/pages/verification_page.dart';
import 'package:marketplace_app/pages/home_page.dart';
import 'package:marketplace_app/pages/login_page.dart';
import 'package:marketplace_app/pages/register_page.dart';

class Routes {
  const Routes._();

  static const initialRoute = LoginPage.routeName;

  static final routes = {
    RegisterPage.routeName: (context) => const RegisterPage(),
    LoginPage.routeName: (context) => const LoginPage(),
    VerificationPage.routeName: (context) => const VerificationPage(),
    HomePage.routeName: (context) => const HomePage(),
  };
}
