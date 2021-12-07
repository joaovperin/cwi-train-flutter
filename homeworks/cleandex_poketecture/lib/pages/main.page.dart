import 'package:cleandex_poketecture/application/widgets/app_scaffold.widget.dart';
import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:cleandex_poketecture/commons/interfaces.dart';
import 'package:cleandex_poketecture/pages/partials/items/items_list.widget.dart';
import 'package:cleandex_poketecture/pages/partials/moves/move_list.widget.dart';
import 'package:cleandex_poketecture/pages/partials/pokemon/pokemon_list.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {
  static const routeName = '/';
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentSelected = 0;

  static const appScreenItems = <_AppScreenItem>[
    _AppScreenItem(
      title: 'Pokémon',
      icon: 'pokemons.svg',
      body: PokemonList(),
    ),
    _AppScreenItem(
      title: 'Moves',
      icon: 'moves.svg',
      body: MoveList(),
    ),
    _AppScreenItem(
      title: 'Items',
      icon: 'items.svg',
      body: ItemsList(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final selectedItem = appScreenItems[currentSelected];
    return AppScaffoldWidget(
      title: selectedItem.title,
      onSearch: (value) {
        selectedItem.body.getBloc(context).onSearch(value);
      },
      body: Column(
        children: [
          Expanded(child: selectedItem.body),
          Container(
            height: 3,
            width: double.infinity,
            decoration: const BoxDecoration(color: AppColors.separator),
          )
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 90,
        child: BottomNavigationBar(
          backgroundColor: AppColors.background,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: const IconThemeData(color: AppColors.enabledIcon),
          unselectedIconTheme:
              const IconThemeData(color: AppColors.disabledIcon),
          selectedItemColor: AppColors.enabledIcon,
          unselectedItemColor: AppColors.disabledIcon,
          onTap: (index) => setState(() => currentSelected = index),
          currentIndex: currentSelected,
          items: [
            ...appScreenItems.map(
              (item) => item.navBarItem(
                selected: currentSelected == appScreenItems.indexOf(item),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _AppScreenItem {
  final String title;
  final String icon;
  final WidgetWithSearchableBlock body;

  const _AppScreenItem({
    required this.title,
    required this.icon,
    required this.body,
  });

  BottomNavigationBarItem navBarItem({bool selected = false}) =>
      BottomNavigationBarItem(
        label: title,
        tooltip: title,
        icon: SvgPicture.asset(
          'assets/icons/$icon',
          semanticsLabel: title,
          color: selected ? AppColors.enabledIcon : AppColors.disabledIcon,
        ),
      );
}
