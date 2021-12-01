import 'package:cleandex_poketecture/application/infra/abstract_http.mapper.dart';
import 'package:cleandex_poketecture/application/infra/abstract_http.repository.dart';
import 'package:cleandex_poketecture/domain/paginated_search_result.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon.repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class PokemonRepositoryHttp extends AbstractHttpRepository<Pokemon>
    implements PokemonRepository {
  PokemonRepositoryHttp() : super('pokemon');

  bool searchMatches(Pokemon e, String search) =>
      e.name.toLowerCase().contains(search);

  @override
  Future<List<Pokemon>> findAll({String? search}) async {
    final list = <Pokemon>[];
    int pageNumber = 0;
    while (true) {
      final page = await findPage(page: pageNumber++, size: 150);
      // Search
      if (search != null && search.trim().isNotEmpty) {
        final searchTerm = search.trim().toLowerCase();
        list.addAll(page.results.where((e) => searchMatches(e, searchTerm)));
      } else {
        list.addAll(page.results);
      }
      if (page.isLastPage) {
        break;
      }
    }
    return list;
  }

  @override
  Future<Pokemon?> findById(int id) async {
    final http = GetIt.I.get<Dio>();
    final response = await http.get('$url/$id');
    return fromMap(response.data);
  }

  @override
  Future<PaginatedSearchResult<Pokemon>> findPage({
    required int page,
    required int size,
  }) async {
    final http = GetIt.I.get<Dio>();
    final response = await http.get('$url?offset=${page * size}&limit=$size');

    final json = response.data;
    return PaginatedSearchResult<Pokemon>(
      count: json['count'],
      results: [...json['results'].map((map) => fromMap(map))],
      next: json['next'],
      previous: json['previous'],
    );
  }

  Pokemon fromMap(Map<String, dynamic> map) {
    return GetIt.I.get<AbstractHttpMapper<Pokemon>>().fromMap(map);
  }
}
