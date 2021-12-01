import 'package:cleandex_poketecture/domain/pokemon/pokemon.dart';

abstract class PokemonEvent {
  const PokemonEvent();
}

class PokemonSearchEvent extends PokemonEvent {
  const PokemonSearchEvent(this.search);
  final String search;
}

class PokemonLoadRequestEvent extends PokemonEvent {
  final String? search;
  final List<Pokemon> currentList;
  const PokemonLoadRequestEvent._(this.currentList, [this.search]);

  factory PokemonLoadRequestEvent.first([String? search]) =>
      PokemonLoadRequestEvent._([], search);

  const factory PokemonLoadRequestEvent.next(
    List<Pokemon> currentList, [
    String? search,
  ]) = PokemonLoadRequestEvent._;
}
