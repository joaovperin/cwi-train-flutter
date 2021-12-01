import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const Color background = Color(0xFFE4F5DB);
  static const Color textColor = Colors.black;
  static const Color white = Colors.white;
  static const Color transparent = Colors.transparent;

  static const Color enabledIcon = Color(0xFF000000);
  static const Color disabledIcon = Color(0xFFA3AF9D);

  static const Color separatorColor = Color(0xFF8DE061);

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
