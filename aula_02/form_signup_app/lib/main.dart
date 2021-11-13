import 'package:form_signup_app/commons/colors.dart';
import 'package:form_signup_app/commons/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Sign Up',
      theme: ThemeData(
        primarySwatch: AppColors.primarySwatch,
      ),
      // home: Pages.signUp,
      initialRoute: Routes.initialRoute,
      routes: Routes.routes,
    );
  }
}
