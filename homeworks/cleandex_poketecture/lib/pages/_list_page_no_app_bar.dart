import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class _ListPageNoAppBar extends StatelessWidget {
  static const routeName = '/pokemons';
  const _ListPageNoAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: AppColors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
      ),
      body: SizedBox.expand(
        child: Column(
          children: [
            Container(
              height: 140,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: AppColors.appBarGradient,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Pokémon',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 3,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: AppColors.dividerGradient,
                ),
              ),
            ),
            const Expanded(
              child: Center(
                child: Text(
                  'List Page with no appbar',
                  style: TextStyle(fontSize: 20, color: AppColors.textColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
