import 'package:cleandex_poketecture/application/infra/abstract_http.repository.dart';
import 'package:cleandex_poketecture/commons/interfaces.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon.repository.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon_info.dart';
import 'package:cleandex_poketecture/domain/vo/paginated_search_result.dart';
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
  Future<PokemonInfo?> findInfoById(int id) async {
    final http = GetIt.I.get<Dio>();
    final response = await http.get('$url/$id');
    if (response.data != null) {
      return _pokemonInfoFromMap(response.data);
    }
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
      results: [...json['results'].map((map) => _pokemonFromMap(map))],
      next: json['next'],
      previous: json['previous'],
    );
  }

  Pokemon _pokemonFromMap(Map<String, dynamic> map) {
    return GetIt.I.get<MappableMapper<Pokemon>>().fromMap(map);
  }

  PokemonInfo _pokemonInfoFromMap(Map<String, dynamic> map) {
    return GetIt.I.get<MappableMapper<PokemonInfo>>().fromMap(map);
  }
}
