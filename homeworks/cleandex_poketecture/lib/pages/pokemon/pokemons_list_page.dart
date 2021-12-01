import 'package:cleandex_poketecture/application/widgets/app_scaffold.widget.dart';
import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:flutter/material.dart';

class PokemonListPage extends StatelessWidget {
  static const routeName = '/pokemons';
  const PokemonListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      titleText: 'Pokémon',
      body: Center(
        child: Text(
          'List Page with flutter app bar',
          style: TextStyle(fontSize: 30, color: AppColors.textColor),
        ),
      ),
    );
  }
}
