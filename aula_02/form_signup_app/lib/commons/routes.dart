import 'package:form_signup_app/pages/signup_page.dart';

class Routes {
  const Routes._();

  static const initialRoute = SignUpPage.routeName;

  static final routes = {
    SignUpPage.routeName: (context) => const SignUpPage(),
  };
}
