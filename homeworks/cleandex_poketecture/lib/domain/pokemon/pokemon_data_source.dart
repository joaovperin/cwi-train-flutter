import 'package:cleandex_poketecture/domain/pokemon/pokemon.repository.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon_details.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon_info.dart';
import 'package:get_it/get_it.dart';

class PokemonDataSource {
  static const itemsPerPage = 40;

  final PokemonRepository _pokemonRepository = GetIt.I.get<PokemonRepository>();
  int currentPage;
  int rowsCount;

  PokemonDataSource()
      : currentPage = 0,
        rowsCount = 0;

  Future<List<PokemonInfo>> searchByName(String search) async {
    return _pokemonRepository.findAll(search: search);
  }

  Future<PokemonDetails> findDetails(PokemonInfo modelInfo) {
    return _pokemonRepository.findDetailsById(modelInfo.id);
  }

  Future<List<PokemonInfo>> fetchNextPage() async {
    final page = await _pokemonRepository.findPage(
      page: currentPage++,
      size: itemsPerPage,
    );

    if (page.isLastPage) {
      throw NoMoreRowsException();
    }

    rowsCount = page.count;
    return page.results;
  }

  void resetCounter() {
    currentPage = 0;
    rowsCount = 0;
  }
}

class NoMoreRowsException implements Exception {}

class PokemonNotFoundException implements Exception {}
