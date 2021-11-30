import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ListPageWithFlutterAppBar extends StatelessWidget {
  static const routeName = '/pokemons-v2';
  const ListPageWithFlutterAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: const Text(
          'Pokémon',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: AppColors.appBarGradient,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        toolbarHeight: 140,
        elevation: 0,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2),
          child: Container(
            height: 2,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: AppColors.dividerGradient,
              ),
            ),
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'List Page with flutter app bar',
          style: TextStyle(fontSize: 30, color: AppColors.textColor),
        ),
      ),
    );
  }
}
