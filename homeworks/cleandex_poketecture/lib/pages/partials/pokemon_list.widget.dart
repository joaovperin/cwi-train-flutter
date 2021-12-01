import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:flutter/material.dart';

class PokemonList extends StatelessWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: const Center(
        child: Text(
          'Pokémon List',
          style: TextStyle(fontSize: 30, color: AppColors.textColor),
        ),
      ),
    );
  }
}
