import 'package:cleandex_poketecture/domain/pokemon/pokemon_info.dart';

abstract class PokemonState {
  const PokemonState();
}

class PokemonListState extends PokemonState {
  final List<PokemonInfo> list;
  final bool noMoreResults;

  const PokemonListState._(this.list, {this.noMoreResults = false});

  factory PokemonListState.empty() => const PokemonListState._([]);

  const factory PokemonListState.next(
    List<PokemonInfo> list, {
    bool noMoreResults,
  }) = PokemonListState._;
}

class PokemonLoadingState extends PokemonState {
  const PokemonLoadingState();
}

class PokemonFailState extends PokemonState {
  const PokemonFailState(this.message);

  final String message;
}
