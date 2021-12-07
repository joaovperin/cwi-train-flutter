import 'package:cleandex_poketecture/commons/interfaces.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon_details.dart';
import 'package:cleandex_poketecture/domain/vo/paginated_search_result.dart';

abstract class PokemonRepository
    implements ListRepository<Pokemon, PokemonDetails> {
  const PokemonRepository._();

  @override
  Future<List<Pokemon>> findAll({String? search});

  @override
  Future<Pokemon> findInfoById(int id);

  @override
  Future<Pokemon> findInfoByName(String name);

  @override
  Future<PaginatedSearchResult<Pokemon>> findPage({
    required int page,
    required int size,
  });

  @override
  Future<PokemonDetails> findDetailsById(int id);
}
