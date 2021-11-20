import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        scaffoldBackgroundColor: AppColors.white,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: AppColors.transparent,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 34,
            fontStyle: FontStyle.italic,
            fontFamily: 'Lato',
            color: AppColors.black,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.lightGrey,
            ),
          ),
          floatingLabelStyle: TextStyle(
            color: AppColors.lightGrey,
            fontSize: 20,
            fontFamily: 'Lato',
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.red,
              width: 4,
            ),
          ),
          labelStyle: TextStyle(
            color: AppColors.lightGrey,
            fontSize: 18,
            fontFamily: 'Lato',
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(),
        ),
      ),
      // home: Pages.signUp,
      initialRoute: Routes.initialRoute,
      routes: Routes.routes,
    );
  }
}
