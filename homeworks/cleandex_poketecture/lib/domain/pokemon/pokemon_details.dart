class PokemonDetails {
  final List<PokeTypeWeakness> weaknesses;
  const PokemonDetails({
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

  PokeTypeWeakness copyWith({
    String? name,
    double? multiplier,
  }) {
    return PokeTypeWeakness(
      name ?? this.name,
      multiplier ?? this.multiplier,
    );
  }
}
