import 'package:cleandex_poketecture/domain/paginated_search_result.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon.dart';

abstract class PokemonRepository {
  const PokemonRepository._();

  Future<List<Pokemon>> findAll({String? search});

  Future<Pokemon?> findById(int id);

  Future<PaginatedSearchResult<Pokemon>> findPage({
    required int page,
    required int size,
  });
}
