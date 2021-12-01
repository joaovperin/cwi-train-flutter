import 'package:cleandex_poketecture/domain/pokemon/pokemon.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon.repository.dart';

class PokemonRepositoryMock implements PokemonRepository {
  const PokemonRepositoryMock();

  @override
  Future<List<Pokemon>> findAll() async {
    return const [
      Pokemon(id: 1, name: 'Bulbasaur'),
      Pokemon(id: 2, name: 'Ivysaur'),
      Pokemon(id: 3, name: 'Venusaur'),
      Pokemon(id: 4, name: 'Charmander'),
      Pokemon(id: 5, name: 'Charmeleon'),
      Pokemon(id: 6, name: 'Charizard'),
      Pokemon(id: 7, name: 'Squirtle'),
      Pokemon(id: 8, name: 'Wartortle'),
      Pokemon(id: 9, name: 'Blastoise'),
      Pokemon(id: 10, name: 'Caterpie'),
      Pokemon(id: 11, name: 'Metapod'),
      Pokemon(id: 12, name: 'Butterfree'),
      Pokemon(id: 13, name: 'Weedle'),
      Pokemon(id: 14, name: 'Kakuna'),
      Pokemon(id: 15, name: 'Beedrill'),
      Pokemon(id: 16, name: 'Pidgey'),
      Pokemon(id: 17, name: 'Pidgeotto'),
      Pokemon(id: 18, name: 'Pidgeot'),
      Pokemon(id: 19, name: 'Rattata'),
      Pokemon(id: 20, name: 'Raticate'),
      Pokemon(id: 21, name: 'Spearow'),
      Pokemon(id: 22, name: 'Fearow'),
      Pokemon(id: 23, name: 'Ekans'),
      Pokemon(id: 24, name: 'Arbok'),
      Pokemon(id: 25, name: 'Pikachu'),
      Pokemon(id: 26, name: 'Raichu'),
      Pokemon(id: 27, name: 'Sandshrew'),
    ];
  }

  @override
  Future<Pokemon?> findById(int id) async {
    return (await findAll()).firstWhere((pokemon) => pokemon.id == id);
  }
}
