import 'package:cleandex_poketecture/domain/pokemon/pokemon.dart';
import 'package:cleandex_poketecture/domain/paginated_search_result.dart';

abstract class PokemonRepository {
  const PokemonRepository._();

  Future<List<Pokemon>> findAll();

  Future<Pokemon?> findById(int id);

  Future<PaginatedSearchResult<Pokemon>> findPage({
    required int page,
    required int size,
  });
}
