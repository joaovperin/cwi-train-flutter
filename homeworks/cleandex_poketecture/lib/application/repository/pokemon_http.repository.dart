import 'package:cleandex_poketecture/application/infra/abstract_http.repository.dart';
import 'package:cleandex_poketecture/commons/interfaces.dart';
import 'package:cleandex_poketecture/domain/pokemon/poke_type.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon.repository.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon_details.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon_info.dart';
import 'package:cleandex_poketecture/domain/vo/name_url_pair.dart';
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

  @override
  Future<PokemonDetails> findDetailsById(int id) async {
    // TODO: unmock
    final info = await findInfoById(id);
    assert(info != null);
    return PokemonDetails(
      id: id,
      name: info!.name,
      pictureUrl: info.pictureUrl,
      types: [
        const PokeType(slot: 1, type: NameUrlPair(name: 'fire', url: 'blabla'))
      ],
      weaknesses: const [
        PokeTypeWeakness('bug', 1),
        PokeTypeWeakness('dark', 1),
        PokeTypeWeakness('dragon', 1),
        PokeTypeWeakness('electric', 2),
        PokeTypeWeakness('fairy', 1),
        PokeTypeWeakness('fighting', 1),
        PokeTypeWeakness('fire', 0.5),
        PokeTypeWeakness('flying', 1),
        PokeTypeWeakness('ghost', 1),
        PokeTypeWeakness('grass', 2),
        PokeTypeWeakness('ground', 1),
        PokeTypeWeakness('ice', 0.5),
        PokeTypeWeakness('normal', 1),
        PokeTypeWeakness('poison', 1),
        PokeTypeWeakness('psychic', 1),
        PokeTypeWeakness('rock', 1),
        PokeTypeWeakness('steel', 0.5),
        PokeTypeWeakness('water', 0.5),
      ],
    );
  }

  Pokemon _pokemonFromMap(Map<String, dynamic> map) {
    return GetIt.I.get<EntityMapper<Pokemon>>().fromMap(map);
  }

  // PokeTypeWeakness _weaknessFromMap(Map<String, dynamic> map) {
  //   return PokeTypeWeakness(map['name'], map['multiplier']);
  //   // return GetIt.I.get<EntityMapper<Pokemon>>().fromMap(map);
  // }

  PokemonInfo _pokemonInfoFromMap(Map<String, dynamic> map) {
    return GetIt.I.get<EntityMapper<PokemonInfo>>().fromMap(map);
  }
}
