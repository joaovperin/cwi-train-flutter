import 'package:cleandex_poketecture/application/mapper/item_http.mapper.dart';
import 'package:cleandex_poketecture/application/mapper/item_info_http.mapper.dart';
import 'package:cleandex_poketecture/application/mapper/move_details_http.mapper.dart';
import 'package:cleandex_poketecture/application/mapper/move_info_http.mapper.dart';
import 'package:cleandex_poketecture/application/mapper/pokemon_details_http.mapper.dart';
import 'package:cleandex_poketecture/application/mapper/pokemon_http.mapper.dart';
import 'package:cleandex_poketecture/application/repository/item_http.repository.dart';
import 'package:cleandex_poketecture/application/repository/move_http.repository.dart';
import 'package:cleandex_poketecture/application/repository/pokemon_http.repository.dart';
import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:cleandex_poketecture/commons/app_routes.dart';
import 'package:cleandex_poketecture/commons/interfaces.dart';
import 'package:cleandex_poketecture/domain/item/item.dart';
import 'package:cleandex_poketecture/domain/item/item.repository.dart';
import 'package:cleandex_poketecture/domain/item/item_info.dart';
import 'package:cleandex_poketecture/domain/move/move.repository.dart';
import 'package:cleandex_poketecture/domain/move/move_details.dart';
import 'package:cleandex_poketecture/domain/move/move.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon.repository.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon_details.dart';
import 'package:cleandex_poketecture/pages/partials/items/bloc/item_bloc.dart';
import 'package:cleandex_poketecture/pages/partials/moves/bloc/move_bloc.dart';
import 'package:cleandex_poketecture/pages/partials/pokemon/bloc/pokemon_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() {
  _registerDependencies();
  runApp(const MyApp());
}

void _registerDependencies() {
  GetIt.I.registerSingleton<PokemonRepository>(PokemonRepositoryHttp());
  GetIt.I.registerSingleton<MoveRepository>(MoveRepositoryHttp());
  GetIt.I.registerSingleton<ItemRepository>(ItemRepositoryHttp());
  GetIt.I.registerFactory<EntityMapper<Item>>(() => const ItemHttpMapper());
  GetIt.I.registerFactory<EntityMapper<Move>>(() => const MoveInfoHttpMapper());
  GetIt.I.registerFactory<EntityMapper<Pokemon>>(
      () => const PokemonInfoHttpMapper());

  GetIt.I.registerLazySingleton<EntityMapper<PokemonDetails>>(
      () => const PokemonDetailsHttpMapper());
  GetIt.I.registerLazySingleton<EntityMapper<MoveDetails>>(
      () => const MoveDetailsHttpMapper());
  GetIt.I.registerLazySingleton<EntityMapper<ItemInfo>>(
      () => const ItemInfoHttpMapper());

  GetIt.I.registerSingleton<Dio>(Dio());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PokemonBloc>(create: (context) => PokemonBloc()),
        BlocProvider<MoveBloc>(create: (context) => MoveBloc()),
        BlocProvider<ItemBloc>(create: (context) => ItemBloc()),
      ],
      child: MaterialApp(
        title: 'Cleandex Pokétecture',
        theme: ThemeData(
          backgroundColor: AppColors.background,
          scaffoldBackgroundColor: AppColors.background,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.routes,
      ),
    );
  }
}
