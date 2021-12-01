import 'package:cleandex_poketecture/application/infra/abstract_http.repository.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon.repository.dart';
import 'package:cleandex_poketecture/domain/search_result.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class PokemonRepositoryHttp extends AbstractHttpRepository<Pokemon>
    implements PokemonRepository {
  PokemonRepositoryHttp() : super('pokemon');

  @override
  Future<List<Pokemon>> findAll({int maxRowsLimit = 300}) async {
    final list = <Pokemon>[];
    int pageNumber = 0;
    while (list.length < maxRowsLimit) {
      final page = await findPage(page: pageNumber++, size: 50);
      list.addAll(page.results);
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

  @override
  Pokemon fromMap(Map<String, dynamic> map) {
    final name = formatName(map['name']);
    final id = parseIdFromUrl(map['url']);
    return Pokemon(
      id: id,
      name: name,
      pictureUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png',
    );
  }
}
