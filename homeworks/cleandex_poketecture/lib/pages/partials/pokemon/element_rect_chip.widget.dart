import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ElementRectChipWidget extends StatelessWidget {
  const ElementRectChipWidget(this.elementName, {Key? key}) : super(key: key);

  final String elementName;
  final double containerHeight = 40;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.forElement(elementName),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              'assets/icons/elements/$elementName.svg',
              semanticsLabel: elementName,
              fit: BoxFit.contain,
              height: containerHeight * 0.75,
              color: AppColors.elementChipText,
            ),
            const SizedBox(width: 12),
            Text(
              elementName.toUpperCase(),
              style: const TextStyle(
                fontSize: 18,
                color: AppColors.elementChipText,
              ),
            )
          ],
        ),
      ),
    );
  }
}
