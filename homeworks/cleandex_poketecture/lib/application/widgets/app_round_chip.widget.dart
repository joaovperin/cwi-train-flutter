import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppRoundChipWidget extends StatelessWidget {
  const AppRoundChipWidget(
    this.picturePath, {
    required this.color,
    Key? key,
    this.semanticsLabel,
  }) : super(key: key);

  final Color color;
  final String picturePath;
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        picturePath,
        semanticsLabel: semanticsLabel,
      ),
    );
  }
}
