import 'package:cleandex_poketecture/domain/pokemon/pokemon.dart';

abstract class PokemonState {
  const PokemonState();
}

class PokemonListState extends PokemonState {
  final List<Pokemon> list;
  final bool noMoreResults;

  const PokemonListState._(this.list, {this.noMoreResults = false});

  factory PokemonListState.empty() => const PokemonListState._([]);

  const factory PokemonListState.next(
    List<Pokemon> list, {
    bool noMoreResults,
  }) = PokemonListState._;
}

class PokemonFailState extends PokemonState {
  const PokemonFailState(this.message);

  final String message;
}
