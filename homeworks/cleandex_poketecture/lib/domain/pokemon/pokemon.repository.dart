import 'package:cleandex_poketecture/domain/pokemon/pokemon_details.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon_info.dart';
import 'package:cleandex_poketecture/domain/vo/paginated_search_result.dart';

abstract class PokemonRepository {
  const PokemonRepository._();

  Future<List<PokemonInfo>> findAll({String? search});

  Future<PokemonInfo> findInfoById(int id);

  Future<PokemonInfo> findInfoByName(String name);

  Future<PaginatedSearchResult<PokemonInfo>> findPage({
    required int page,
    required int size,
  });

  Future<PokemonDetails> findDetailsById(int id);
}
