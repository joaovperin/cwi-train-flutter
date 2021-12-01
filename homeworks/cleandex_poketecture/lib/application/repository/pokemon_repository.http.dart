import 'package:cleandex_poketecture/domain/pokemon/pokemon.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon.repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class PokemonRepositoryHttp implements PokemonRepository {
  const PokemonRepositoryHttp();

  static const _maxResultCount = 300;

  @override
  Future<List<Pokemon>> findAll() async {
    final http = GetIt.I.get<Dio>();
    final list = <Pokemon>[];

    final response = await http
        .get('https://pokeapi.co/api/v2/pokemon?limit=$_maxResultCount');

    var json = response.data;

    List<dynamic>? results = json['results'];
    while (results != null && results.isNotEmpty) {
      list.addAll(results.map((map) => _fromMap(map)));

      if (json['next'] != null) {
        json = (await http.get(json['next'])).data;
      } else {
        break;
      }

      if (list.length >= _maxResultCount) {
        break;
      }
    }

    return list;
  }

  @override
  Future<Pokemon?> findById(int id) async {
    final http = GetIt.I.get<Dio>();
    final response = await http.get('https://pokeapi.co/api/v2/pokemon/$id');
    return _fromMap(response.data);
  }

  static final _regex = RegExp(r'.*\/pokemon\/(\d+)\/?');
  static Pokemon _fromMap(Map<String, dynamic> map) {
    final name = _formatName(map['name']);
    final id = int.parse(_regex.firstMatch(map['url'])?.group(1) ?? '0');
    return Pokemon(
      id: id,
      name: name,
      avatarUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png',
    );
  }

  static String _formatName(String name) {
    return name
        .split('-')
        .map((e) => e[0].toUpperCase() + e.substring(1))
        .join(' ');
  }
}
