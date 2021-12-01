import 'package:cleandex_poketecture/domain/pokemon/pokemon.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon.repository.dart';

class PokemonRepositoryMock implements PokemonRepository {
  const PokemonRepositoryMock();

  @override
  Future<List<Pokemon>> findAll() async {
    return const [
      Pokemon(id: 1, name: 'Bulbasaur', avatarUrl: ''),
      Pokemon(id: 2, name: 'Ivysaur', avatarUrl: ''),
      Pokemon(id: 3, name: 'Venusaur', avatarUrl: ''),
      Pokemon(id: 4, name: 'Charmander', avatarUrl: ''),
      Pokemon(id: 5, name: 'Charmeleon', avatarUrl: ''),
      Pokemon(id: 6, name: 'Charizard', avatarUrl: ''),
      Pokemon(id: 7, name: 'Squirtle', avatarUrl: ''),
      Pokemon(id: 8, name: 'Wartortle', avatarUrl: ''),
      Pokemon(id: 9, name: 'Blastoise', avatarUrl: ''),
      Pokemon(id: 10, name: 'Caterpie', avatarUrl: ''),
      Pokemon(id: 11, name: 'Metapod', avatarUrl: ''),
      Pokemon(id: 12, name: 'Butterfree', avatarUrl: ''),
      Pokemon(id: 13, name: 'Weedle', avatarUrl: ''),
      Pokemon(id: 14, name: 'Kakuna', avatarUrl: ''),
      Pokemon(id: 15, name: 'Beedrill', avatarUrl: ''),
      Pokemon(id: 16, name: 'Pidgey', avatarUrl: ''),
      Pokemon(id: 17, name: 'Pidgeotto', avatarUrl: ''),
      Pokemon(id: 18, name: 'Pidgeot', avatarUrl: ''),
      Pokemon(id: 19, name: 'Rattata', avatarUrl: ''),
      Pokemon(id: 20, name: 'Raticate', avatarUrl: ''),
      Pokemon(id: 21, name: 'Spearow', avatarUrl: ''),
      Pokemon(id: 22, name: 'Fearow', avatarUrl: ''),
      Pokemon(id: 23, name: 'Ekans', avatarUrl: ''),
      Pokemon(id: 24, name: 'Arbok', avatarUrl: ''),
      Pokemon(id: 25, name: 'Pikachu', avatarUrl: ''),
      Pokemon(id: 26, name: 'Raichu', avatarUrl: ''),
      Pokemon(id: 27, name: 'Sandshrew', avatarUrl: ''),
    ];
  }

  @override
  Future<Pokemon?> findById(int id) async {
    return (await findAll()).firstWhere((pokemon) => pokemon.id == id);
  }
}
