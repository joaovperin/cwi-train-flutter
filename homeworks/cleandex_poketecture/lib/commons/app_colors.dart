import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const Color background = Color(0xFFE4F5DB);
  static const Color text = Color(0xFF4F4F4F);
  static const Color lightText = Color(0xFFA4A4A4);
  static const Color fadedText = Color(0x47000000);
  static const Color container = Colors.white;
  static const Color containerShadow = Color(0x47000000);
  static const Color statusBar = Colors.transparent;

  static const Color listTileBg = Colors.transparent;
  static const Color splash = Color(0xFF9BE4FB);

  static const Color enabledIcon = Color(0xFF000000);
  static const Color disabledIcon = Color(0xFFA3AF9D);

  static Color get inputText => Colors.black.withAlpha(180);
  static Color get inputBackground => Colors.grey.withAlpha(70);
  static Color get cursor => inputText;

  static const Color separator = Color(0xFF8DE061);
  static const Color cardColor = Color(0xFFFFFFFF);

  static const List<Color> detailsPagePokeGradient = [
    Color(0xFF559EDF),
    Color(0xFF69B9E3),
  ];

  static const List<Color> detailsPageItemsGradient = [
    Color(0xFF6FD3D2),
    Color(0xFF6FD3D2),
  ];

  static const List<Color> appBarGradient = [
    Color(0xFFDEE8FA),
    Color(0xFFD8F6DB),
  ];

  static const List<Color> dividerGradient = [
    Color(0xFF6EB9FB),
    Color(0xFF89DF74),
    Color(0xFF51E85E),
  ];

  static const Color bug = Color(0xFF92BC2C);
  static const Color dark = Color(0xFF595761);
  static const Color dragon = Color(0xFF0C69C8);
  static const Color electric = Color(0xFFEDD53E);
  static const Color fairy = Color(0xFFEC8CE5);
  static const Color fighting = Color(0xFFCE4265);
  static const Color fire = Color(0xFFFB9B51);
  static const Color flying = Color(0xFF90A7DA);
  static const Color ghost = Color(0xFF516AAC);
  static const Color grass = Color(0xFF5FBC51);
  static const Color ground = Color(0xFFD38F5E);
  static const Color ice = Color(0xFF8CDDD4);
  static const Color normal = Color(0xFF9298A4);
  static const Color poison = Color(0xFFA864C7);
  static const Color psychic = Color(0xFFF66F71);
  static const Color rock = Color(0xFFCCBD8C);
  static const Color steel = Color(0xFF52869D);
  static const Color water = Color(0xFF4A90DD);
  // .....
  static const Color unknown = Colors.black;
  // .....

  static const element = {
    'bug': AppColors.bug,
    'dark': AppColors.dark,
    'dragon': AppColors.dragon,
    'electric': AppColors.electric,
    'fairy': AppColors.fairy,
    'fighting': AppColors.fighting,
    'fire': AppColors.fire,
    'flying': AppColors.flying,
    'ghost': AppColors.ghost,
    'grass': AppColors.grass,
    'ground': AppColors.ground,
    'ice': AppColors.ice,
    'normal': AppColors.normal,
    'poison': AppColors.poison,
    'psychic': AppColors.psychic,
    'rock': AppColors.rock,
    'steel': AppColors.steel,
    'water': AppColors.water,
  };

  static MaterialColor? get primarySwatch => null;
}
