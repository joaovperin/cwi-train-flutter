import 'package:flutter/material.dart';
import 'package:github_ui/commons/colors.dart';
import 'package:github_ui/pages/seach_user_page.dart';

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
      home: const SearchUserPage(),
    );
  }
}
