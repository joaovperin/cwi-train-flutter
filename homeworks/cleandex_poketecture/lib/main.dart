import 'package:cleandex_poketecture/application/repository/item_repository.http.dart';
import 'package:cleandex_poketecture/application/repository/move_repository.http.dart';
import 'package:cleandex_poketecture/application/repository/pokemon_repository.http.dart';
import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:cleandex_poketecture/commons/app_routes.dart';
import 'package:cleandex_poketecture/domain/item/item.repository.dart';
import 'package:cleandex_poketecture/domain/move/move.repository.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon.repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  _registerDependencies();
  runApp(const MyApp());
}

void _registerDependencies() {
  GetIt.I.registerSingleton<PokemonRepository>(PokemonRepositoryHttp());
  GetIt.I.registerSingleton<ItemRepository>(ItemRepositoryHttp());
  GetIt.I.registerSingleton<MoveRepository>(MoveRepositoryHttp());
  GetIt.I.registerSingleton<Dio>(Dio());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cleandex Pokétecture',
      theme: ThemeData(
        backgroundColor: AppColors.background,
        scaffoldBackgroundColor: AppColors.background,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
    );
  }
}
