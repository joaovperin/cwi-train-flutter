import 'package:cleandex_poketecture/domain/pokemon/pokemon_info.dart';
import 'package:cleandex_poketecture/domain/vo/paginated_search_result.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon.dart';

abstract class PokemonRepository {
  const PokemonRepository._();

  Future<List<Pokemon>> findAll({String? search});

  Future<PokemonInfo?> findInfoById(int id);

  Future<PaginatedSearchResult<Pokemon>> findPage({
    required int page,
    required int size,
  });
}
