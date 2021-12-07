import 'package:cleandex_poketecture/application/infra/abstract_http.repository.dart';
import 'package:cleandex_poketecture/commons/interfaces.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon.repository.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon_details.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon_info.dart';
import 'package:cleandex_poketecture/domain/vo/paginated_search_result.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class PokemonRepositoryHttp extends AbstractHttpRepository<PokemonInfo>
    implements PokemonRepository {
  PokemonRepositoryHttp() : super('pokemon');

  bool searchMatches(PokemonInfo e, String search) =>
      e.name.toLowerCase().contains(search);

  @override
  Future<List<PokemonInfo>> findAll({String? search}) async {
    final list = <PokemonInfo>[];
    var pageNumber = 0;
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
  Future<PokemonInfo> findInfoById(int id) async {
    final http = GetIt.I.get<Dio>();
    final response = await http.get('$url/$id');
    return _pokemonInfoFromMap(response.data);
  }

  @override
  Future<PokemonInfo> findInfoByName(String name) async {
    final http = GetIt.I.get<Dio>();
    final response = await http.get('$url/$name');
    return _pokemonInfoFromMap(response.data);
  }

  @override
  Future<PaginatedSearchResult<PokemonInfo>> findPage({
    required int page,
    required int size,
  }) async {
    final http = GetIt.I.get<Dio>();
    final response = await http.get('$url?offset=${page * size}&limit=$size');

    final json = response.data;
    return PaginatedSearchResult<PokemonInfo>(
      count: json['count'],
      results: await _promoteAndSort(json['results']),
      next: json['next'],
      previous: json['previous'],
    );
  }

  @override
  Future<PokemonDetails> findDetailsById(int id) async {
    final http = GetIt.I.get<Dio>();
    final info = await findInfoById(id);

    final pokeType = info.types.first;
    final response = await http.get(
      '$baseUrl/type/${pokeType.type.name}',
    );

    return _detailsFromMap(response.data);
  }

  Future<List<PokemonInfo>> _promoteAndSort(List<dynamic> list) async {
    final result = (await Stream.fromFutures(
      list.map((p) {
        return findInfoByName(p['name']);
      }),
    ).toList());
    result.sort((a, b) => a.id.compareTo(b.id));
    return result;
  }

  PokemonDetails _detailsFromMap(Map<String, dynamic> map) {
    return GetIt.I.get<EntityMapper<PokemonDetails>>().fromMap(map);
  }

  PokemonInfo _pokemonInfoFromMap(Map<String, dynamic> map) {
    return GetIt.I.get<EntityMapper<PokemonInfo>>().fromMap(map);
  }
}
