import 'package:cleandex_poketecture/application/mapper/item_http.mapper.dart';
import 'package:cleandex_poketecture/application/mapper/move_http.mapper.dart';
import 'package:cleandex_poketecture/application/mapper/pokemon_http.mapper.dart';
import 'package:cleandex_poketecture/application/mapper/pokemon_info_http.mapper.dart';
import 'package:cleandex_poketecture/application/repository/item_http.repository.dart';
import 'package:cleandex_poketecture/application/repository/move_http.repository.dart';
import 'package:cleandex_poketecture/application/repository/pokemon_http.repository.dart';
import 'package:cleandex_poketecture/commons/interfaces.dart';
import 'package:cleandex_poketecture/domain/item/item.dart';
import 'package:cleandex_poketecture/domain/item/item.repository.dart';
import 'package:cleandex_poketecture/domain/move/move.dart';
import 'package:cleandex_poketecture/domain/move/move.repository.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon.repository.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon_info.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

void registerDependencies() {
  GetIt.I.registerSingleton<PokemonRepository>(PokemonRepositoryHttp());
  GetIt.I.registerSingleton<MoveRepository>(MoveRepositoryHttp());
  GetIt.I.registerSingleton<ItemRepository>(ItemRepositoryHttp());
  GetIt.I.registerFactory<MappableMapper<Pokemon>>(
      () => const PokemonHttpMapper());
  GetIt.I.registerFactory<MappableMapper<Move>>(() => const MoveHttpMapper());
  GetIt.I.registerFactory<MappableMapper<Item>>(() => const ItemHttpMapper());

  GetIt.I.registerLazySingleton<MappableMapper<PokemonInfo>>(
      () => const PokemonInfoHttpMapper());

  GetIt.I.registerSingleton<Dio>(Dio());
}
