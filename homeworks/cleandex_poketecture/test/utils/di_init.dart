import 'package:cleandex_poketecture/application/mapper/item_details_http.mapper.dart';
import 'package:cleandex_poketecture/application/mapper/item_http.mapper.dart';
import 'package:cleandex_poketecture/application/mapper/move_details_http.mapper.dart';
import 'package:cleandex_poketecture/application/mapper/move_http.mapper.dart';
import 'package:cleandex_poketecture/application/mapper/pokemon_details_http.mapper.dart';
import 'package:cleandex_poketecture/application/mapper/pokemon_http.mapper.dart';
import 'package:cleandex_poketecture/application/repository/item_http.repository.dart';
import 'package:cleandex_poketecture/application/repository/move_http.repository.dart';
import 'package:cleandex_poketecture/application/repository/pokemon_http.repository.dart';
import 'package:cleandex_poketecture/commons/interfaces.dart';
import 'package:cleandex_poketecture/domain/item/item.dart';
import 'package:cleandex_poketecture/domain/item/item.repository.dart';
import 'package:cleandex_poketecture/domain/item/item_details.dart';
import 'package:cleandex_poketecture/domain/move/move.dart';
import 'package:cleandex_poketecture/domain/move/move.repository.dart';
import 'package:cleandex_poketecture/domain/move/move_details.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon.repository.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon_details.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

void registerDependencies() {
  final di = GetIt.instance;

  di.registerSingleton<PokemonRepository>(PokemonRepositoryHttp());
  di.registerSingleton<MoveRepository>(MoveRepositoryHttp());
  di.registerSingleton<ItemRepository>(ItemRepositoryHttp());

  di.registerFactory<EntityMapper<Item>>(() => const ItemHttpMapper());
  di.registerFactory<EntityMapper<Move>>(() => const MoveHttpMapper());
  di.registerFactory<EntityMapper<Pokemon>>(() => const PokemonHttpMapper());

  di.registerLazySingleton<EntityMapper<PokemonDetails>>(
      () => const PokemonDetailsHttpMapper());
  di.registerLazySingleton<EntityMapper<MoveDetails>>(
      () => const MoveDetailsHttpMapper());
  di.registerLazySingleton<EntityMapper<ItemDetails>>(
      () => const ItemDetailsHttpMapper());

  di.registerSingleton<Dio>(Dio());
}
