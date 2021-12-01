import 'package:cleandex_poketecture/domain/pokemon/pokemon.dart';

abstract class PokemonEvent {
  const PokemonEvent();
}

class PokemonLoadRequestEvent extends PokemonEvent {
  final List<Pokemon> currentList;
  const PokemonLoadRequestEvent._(this.currentList);

  factory PokemonLoadRequestEvent.first() =>
      const PokemonLoadRequestEvent._([]);

  const factory PokemonLoadRequestEvent.list(
    List<Pokemon> currentList,
  ) = PokemonLoadRequestEvent._;
}
