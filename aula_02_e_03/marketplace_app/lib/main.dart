import 'package:flutter/material.dart';
import 'package:marketplace_app/commons/colors.dart';
import 'package:marketplace_app/commons/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marketplace App',
      theme: ThemeData(
        primarySwatch: AppColors.primarySwatch,
      ),
      // home: Pages.signUp,
      initialRoute: Routes.initialRoute,
      routes: Routes.routes,
    );
  }
}
