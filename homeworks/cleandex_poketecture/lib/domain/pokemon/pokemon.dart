import 'package:cleandex_poketecture/commons/interfaces.dart';
import 'package:cleandex_poketecture/domain/pokemon/poke_type.dart';
import 'package:cleandex_poketecture/domain/vo/name_url_pair.dart';

class Pokemon implements Entity<Pokemon> {
  @override
  final int id;
  final int order;
  final String name;
  final int height;
  final int weight;
  final int baseExperience;

  final NameUrlPair species;
  final List<PokeStat> stats;
  final List<PokeType> types;
  final List<PokeMove> moves;
  final List<PokeAbility> abilities;

  final String thumbnailPictureUrl;
  final String bigPictureUrl;

  String get fmtId {
    return '#${id.toString().padLeft(3, "0")}';
  }

  const Pokemon({
    required this.id,
    required this.order,
    required this.name,
    required this.height,
    required this.weight,
    required this.stats,
    required this.types,
    required this.moves,
    required this.species,
    required this.baseExperience,
    required this.abilities,
    required this.thumbnailPictureUrl,
    required this.bigPictureUrl,
  });
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
