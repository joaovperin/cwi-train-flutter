import 'package:cleandex_poketecture/application/widgets/app_round_chip.widget.dart';
import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:flutter/material.dart';

class ElementRoundWidget extends StatelessWidget {
  const ElementRoundWidget(this.elementName, {Key? key}) : super(key: key);

  final String elementName;

  @override
  Widget build(BuildContext context) {
    return AppRoundChipWidget(
      'assets/icons/elements/$elementName.svg',
      color: AppColors.element[elementName] ?? AppColors.unknown,
      semanticsLabel: elementName,
    );
  }
}
