import 'package:cleandex_poketecture/domain/pokemon/poke_type.dart';

class PokemonDetails {
  final int id;
  final String name;
  final String pictureUrl;
  final List<PokeType> types;
  final List<PokeTypeWeakness> weaknesses;

  String get fmtId {
    return '#${id.toString().padLeft(3, "0")}';
  }

  const PokemonDetails({
    required this.id,
    required this.name,
    required this.pictureUrl,
    required this.types,
    required this.weaknesses,
  });
}

class PokeTypeWeakness {
  final String name;
  final double multiplier;

  String get value {
    if (multiplier > 0 && multiplier < 1) {
      return '1/${(1 / multiplier).floor()}x';
    }
    return '${multiplier.floor()}x';
  }

  const PokeTypeWeakness(this.name, this.multiplier);
}
