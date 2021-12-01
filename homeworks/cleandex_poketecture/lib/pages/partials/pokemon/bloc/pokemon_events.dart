import 'package:cleandex_poketecture/domain/pokemon/pokemon.dart';

abstract class PokemonEvent {
  const PokemonEvent();
}

class PokemonSearchEvent extends PokemonEvent {
  const PokemonSearchEvent(this.search);
  final String search;
}

class PokemonFetchPageEvent extends PokemonEvent {
  final List<Pokemon> currentList;
  const PokemonFetchPageEvent._(this.currentList);

  factory PokemonFetchPageEvent.first() => const PokemonFetchPageEvent._([]);

  const factory PokemonFetchPageEvent.next(List<Pokemon> currentList) =
      PokemonFetchPageEvent._;
}
