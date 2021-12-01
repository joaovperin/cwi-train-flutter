import 'package:cleandex_poketecture/domain/pokemon/pokemon.dart';

abstract class PokemonState {
  const PokemonState();
}

class PokemonListState extends PokemonState {
  final List<Pokemon> list;
  final bool noMoreResults;

  const PokemonListState(this.list, {this.noMoreResults = false});
}

class PokemonFailState extends PokemonState {
  const PokemonFailState(this.message);

  final String message;
}
