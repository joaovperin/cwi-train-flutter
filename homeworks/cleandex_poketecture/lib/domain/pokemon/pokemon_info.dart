import 'package:cleandex_poketecture/domain/vo/name_url_pair.dart';

class PokemonInfo {
  final int id;
  final int order;
  final String name;
  final int height;
  final int weight;
  final int baseExperience;

  final PokeSprites sprites;
  final List<PokeStat> stats;
  final List<PokeType> types;
  final List<PokeMove> moves;
  final List<PokeAbility> abilities;

  const PokemonInfo({
    required this.id,
    required this.order,
    required this.name,
    required this.height,
    required this.weight,
    required this.stats,
    required this.types,
    required this.moves,
    required this.sprites,
    required this.baseExperience,
    required this.abilities,
  });
}

class PokeSprites {
  final String? frontDefault;
  final String? backDefault;
  final String? frontShiny;
  final String? backShiny;

  const PokeSprites({
    required this.backDefault,
    required this.backShiny,
    required this.frontDefault,
    required this.frontShiny,
  });

  factory PokeSprites.empty() => const PokeSprites(
        backDefault: null,
        backShiny: null,
        frontDefault: null,
        frontShiny: null,
      );
}

class PokeStat {
  final int effort;
  final int baseStat;
  final NameUrlPair stat;

  const PokeStat({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });
}

class PokeType {
  final int slot;
  final NameUrlPair type;

  const PokeType({
    required this.slot,
    required this.type,
  });
}

class PokeMove {
  final NameUrlPair move;

  const PokeMove({
    required this.move,
  });
}

class PokeAbility {
  final int slot;
  final NameUrlPair ability;

  const PokeAbility({
    required this.ability,
    required this.slot,
  });
}
