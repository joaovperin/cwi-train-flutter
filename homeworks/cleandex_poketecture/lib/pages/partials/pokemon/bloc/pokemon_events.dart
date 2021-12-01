import 'package:cleandex_poketecture/domain/pokemon/pokemon.dart';

abstract class PokemonEvent {
  const PokemonEvent();
}

class PokemonLoadRequestEvent extends PokemonEvent {
  const PokemonLoadRequestEvent(this.currentList);
  final List<Pokemon> currentList;
}
