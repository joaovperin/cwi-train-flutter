import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:flutter/material.dart';

class AppSearchField extends StatelessWidget {
  AppSearchField({
    Key? key,
  }) : super(key: key);

  final TextEditingController _searchCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        borderRadius: BorderRadius.circular(24),
      ),
      child: TextFormField(
        controller: _searchCtrl,
        onChanged: (value) {},
        cursorColor: AppColors.inputText,
        decoration: InputDecoration(
          labelText: 'Search',
          labelStyle: TextStyle(
            color: AppColors.inputText,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          prefixIcon: IconButton(
            icon: const Icon(Icons.search),
            color: AppColors.inputText,
            onPressed: () {},
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.close),
            color: AppColors.inputText,
            onPressed: () => _searchCtrl.clear(),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
