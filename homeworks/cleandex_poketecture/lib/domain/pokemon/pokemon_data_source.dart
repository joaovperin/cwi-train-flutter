import 'package:cleandex_poketecture/domain/pokemon/pokemon.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon.repository.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon_details.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon_info.dart';
import 'package:get_it/get_it.dart';

class PokemonDataSource {
  static const itemsPerPage = 60;

  final PokemonRepository _pokemonRepository = GetIt.I.get<PokemonRepository>();
  int currentPage;
  int rowsCount;

  PokemonDataSource()
      : currentPage = 0,
        rowsCount = 0;

  Future<List<PokemonInfo>> searchByName(String search) async {
    resetCounter();
    final results = await _pokemonRepository.findAll(search: search);
    return _promoteSorting(results);
  }

  Future<PokemonInfo> findInfo(Pokemon model) async {
    final info = await _pokemonRepository.findInfoById(model.id);
    if (info == null) {
      throw PokemonNotFoundException();
    }
    return info;
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
    return _promoteSorting(page.results);
  }

  void resetCounter() {
    currentPage = 0;
    rowsCount = 0;
  }

  Future<List<PokemonInfo>> _promoteSorting(List<Pokemon> list) async {
    final result = (await Stream.fromFutures(
      list.map((p) => findInfo(p)),
    ).toList());
    result.sort((a, b) => a.id.compareTo(b.id));
    return result;
  }
}

class NoMoreRowsException implements Exception {}

class PokemonNotFoundException implements Exception {}
