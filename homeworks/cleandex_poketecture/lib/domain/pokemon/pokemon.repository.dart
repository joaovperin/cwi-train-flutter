import 'package:cleandex_poketecture/domain/pokemon/pokemon.dart';

abstract class PokemonRepository {
  const PokemonRepository._();

  Future<List<Pokemon>> findAll();
  Future<Pokemon?> findById(int id);
}
