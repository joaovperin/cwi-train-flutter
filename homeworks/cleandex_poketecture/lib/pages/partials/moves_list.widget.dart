import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:flutter/material.dart';

class MovesList extends StatelessWidget {
  const MovesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: const Center(
        child: Text(
          'Moves List',
          style: TextStyle(fontSize: 30, color: AppColors.textColor),
        ),
      ),
    );
  }
}
