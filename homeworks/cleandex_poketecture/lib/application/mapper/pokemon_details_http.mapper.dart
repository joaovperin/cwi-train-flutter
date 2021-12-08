import 'dart:math';

import 'package:cleandex_poketecture/application/infra/abstract_http.mapper.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon_details.dart';

class PokemonDetailsHttpMapper extends AbstractHttpMapper<PokemonDetails> {
  const PokemonDetailsHttpMapper() : super();
  static final expressionsRegexp = RegExp(r'\$([\w\_]+)');

  @override
  Map<String, dynamic> toMap(PokemonDetails entity) {
    return {
      'weaknesses': entity.weaknesses.map((e) => e.toString()).toList(),
      'description': entity.description,
    };
  }

  @override
  PokemonDetails fromMap(Map<String, dynamic> map) {
    return PokemonDetails(
      weaknesses: typesWeakenessesFromRootMap(map),
      description: descriptionFromRootMap(map),
    );
  }

  List<PokeTypeWeakness> typesWeakenessesFromRootMap(Map<String, dynamic> map) {
    final elmList = <String>[
      'bug',
      'dark',
      'dragon',
      'electric',
      'fairy',
      'fighting',
      'fire',
      'flying',
      'ghost',
      'grass',
      'ground',
      'ice',
      'normal',
      'poison',
      'psychic',
      'rock',
      'steel',
      'water'
    ];
    final elementsMap = elmList.asMap().map((key, typeName) {
      return MapEntry<String, PokeTypeWeakness>(
        typeName,
        PokeTypeWeakness(typeName, 1),
      );
    });

    final damageRelations = map['damage_relations'];
    final doubleDamageFrom = damageRelations['double_damage_from'];
    final halfDamageFrom = damageRelations['half_damage_from'];
    final noDamageFrom = damageRelations['no_damage_from'];

    /// Aditional entries:
    /// final doubleDamageTo = damageRelations['double_damage_to'];
    /// final halfDamageTo = damageRelations['half_damage_to'];
    /// final noDamageTo = damageRelations['no_damage_to'];

    for (final element in doubleDamageFrom) {
      final name = element['name'];
      elementsMap[name] = elementsMap[name]!.copyWith(multiplier: 2);
    }
    for (final element in halfDamageFrom) {
      final name = element['name'];
      elementsMap[name] = elementsMap[name]!.copyWith(multiplier: 0.5);
    }
    for (final element in noDamageFrom) {
      final name = element['name'];
      elementsMap[name] = elementsMap[name]!.copyWith(multiplier: 0);
    }

    return elementsMap.values.toList();
  }

  String descriptionFromRootMap(Map<String, dynamic> map) {
    final speciesInfo = map['pokemon_species'];
    final List<dynamic> flavorTextEntries = speciesInfo['flavor_text_entries'];
    final allEnglishFlavorEntries =
        flavorTextEntries.where((e) => e['language']['name'] == 'en').toList();

    final sorted = allEnglishFlavorEntries[Random().nextInt(
      allEnglishFlavorEntries.length,
    )];
    return sorted['flavor_text'];
  }
}
