import 'package:flutter/material.dart';
import 'package:github_ui/commons/colors.dart';
import 'package:github_ui/commons/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github UI',
      theme: ThemeData(
        primarySwatch: AppColors.primarySwatch,
      ),
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
    );
  }
}
