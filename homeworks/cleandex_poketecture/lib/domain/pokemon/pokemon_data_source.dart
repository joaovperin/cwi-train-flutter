import 'package:cleandex_poketecture/domain/pokemon/pokemon.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon.repository.dart';
import 'package:get_it/get_it.dart';

class PokemonDataSource {
  static const itemsPerPage = 60;

  final PokemonRepository _pokemonRepository = GetIt.I.get<PokemonRepository>();
  int currentPage;
  int rowsCount;

  PokemonDataSource()
      : currentPage = 0,
        rowsCount = 0;

  Future<List<Pokemon>> searchByName(String search) async {
    _resetCounter();
    return _pokemonRepository.findAll(search: search);
  }

  Future<List<Pokemon>> fetchNextPage() async {
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

  void _resetCounter() {
    currentPage = 0;
    rowsCount = 0;
  }
}

class NoMoreRowsException implements Exception {}
