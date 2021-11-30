import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const Color background = Color(0xFFE4F5DB);
  static const Color textColor = Colors.black;
  static const Color transparent = Colors.transparent;

  static const List<Color> appBarGradient = [
    Color(0xFFDEE8FA),
    Color(0xFFD8F6DB),
  ];

  static const List<Color> dividerGradient = [
    Color(0xFF6EB9FB),
    Color(0xFF89DF74),
    Color(0xFF51E85E),
  ];

  static MaterialColor? get primarySwatch => null;
}
