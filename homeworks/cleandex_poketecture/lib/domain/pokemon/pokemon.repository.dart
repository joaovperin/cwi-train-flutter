import 'package:cleandex_poketecture/domain/pokemon/pokemon_details.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon.dart';
import 'package:cleandex_poketecture/domain/vo/paginated_search_result.dart';

abstract class PokemonRepository {
  const PokemonRepository._();

  Future<List<Pokemon>> findAll({String? search});

  Future<Pokemon> findInfoById(int id);

  Future<Pokemon> findInfoByName(String name);

  Future<PaginatedSearchResult<Pokemon>> findPage({
    required int page,
    required int size,
  });

  Future<PokemonDetails> findDetailsById(int id);
}
