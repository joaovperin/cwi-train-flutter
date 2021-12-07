import 'package:cleandex_poketecture/domain/pokemon/pokemon.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon.repository.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon_info.dart';
import 'package:cleandex_poketecture/domain/vo/paginated_search_result.dart';

class PokemonRepositoryMock implements PokemonRepository {
  const PokemonRepositoryMock();

  @override
  Future<List<Pokemon>> findAll({String? search}) async {
    return const [
      Pokemon(id: 1, name: 'Bulbasaur', pictureUrl: ''),
      Pokemon(id: 2, name: 'Ivysaur', pictureUrl: ''),
      Pokemon(id: 3, name: 'Venusaur', pictureUrl: ''),
      Pokemon(id: 4, name: 'Charmander', pictureUrl: ''),
      Pokemon(id: 5, name: 'Charmeleon', pictureUrl: ''),
      Pokemon(id: 6, name: 'Charizard', pictureUrl: ''),
      Pokemon(id: 7, name: 'Squirtle', pictureUrl: ''),
      Pokemon(id: 8, name: 'Wartortle', pictureUrl: ''),
      Pokemon(id: 9, name: 'Blastoise', pictureUrl: ''),
      Pokemon(id: 10, name: 'Caterpie', pictureUrl: ''),
      Pokemon(id: 11, name: 'Metapod', pictureUrl: ''),
      Pokemon(id: 12, name: 'Butterfree', pictureUrl: ''),
      Pokemon(id: 13, name: 'Weedle', pictureUrl: ''),
      Pokemon(id: 14, name: 'Kakuna', pictureUrl: ''),
      Pokemon(id: 15, name: 'Beedrill', pictureUrl: ''),
      Pokemon(id: 16, name: 'Pidgey', pictureUrl: ''),
      Pokemon(id: 17, name: 'Pidgeotto', pictureUrl: ''),
      Pokemon(id: 18, name: 'Pidgeot', pictureUrl: ''),
      Pokemon(id: 19, name: 'Rattata', pictureUrl: ''),
      Pokemon(id: 20, name: 'Raticate', pictureUrl: ''),
      Pokemon(id: 21, name: 'Spearow', pictureUrl: ''),
      Pokemon(id: 22, name: 'Fearow', pictureUrl: ''),
      Pokemon(id: 23, name: 'Ekans', pictureUrl: ''),
      Pokemon(id: 24, name: 'Arbok', pictureUrl: ''),
      Pokemon(id: 25, name: 'Pikachu', pictureUrl: ''),
      Pokemon(id: 26, name: 'Raichu', pictureUrl: ''),
      Pokemon(id: 27, name: 'Sandshrew', pictureUrl: ''),
    ];
  }

  @override
  Future<PokemonInfo?> findInfoById(int id) async {
    return null;
  }

  @override
  Future<PaginatedSearchResult<Pokemon>> findPage(
      {int page = 0, int size = 300}) async {
    final results = await findAll();
    return PaginatedSearchResult<Pokemon>(
      count: results.length,
      results: (results).skip(page * size).take(size).toList(),
    );
  }
}
