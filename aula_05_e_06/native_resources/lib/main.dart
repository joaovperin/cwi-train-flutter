import 'package:flutter/material.dart';
import 'package:native_resources/commons/colors.dart';
import 'package:native_resources/commons/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Native Resources',
      theme: ThemeData(
        primarySwatch: AppColors.primarySwatch,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontSize: 16,
            color: AppColors.textColor,
          ),
          bodyText2: TextStyle(
            fontSize: 14,
            color: AppColors.textColor,
          ),
        ),
      ),
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
    );
  }
}
