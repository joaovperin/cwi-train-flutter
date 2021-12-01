import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:flutter/material.dart';

class ItensList extends StatelessWidget {
  const ItensList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: const Center(
        child: Text(
          'Itens List',
          style: TextStyle(fontSize: 30, color: AppColors.textColor),
        ),
      ),
    );
  }
}
