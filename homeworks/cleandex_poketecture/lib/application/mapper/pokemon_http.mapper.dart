import 'package:cleandex_poketecture/application/infra/abstract_http.mapper.dart';
import 'package:cleandex_poketecture/commons/utils/string_utils.dart';
import 'package:cleandex_poketecture/domain/pokemon/poke_type.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon.dart';
import 'package:cleandex_poketecture/domain/vo/name_url_pair.dart';

class PokemonHttpMapper extends AbstractHttpMapper<Pokemon> {
  const PokemonHttpMapper() : super();

  @override
  Map<String, dynamic> toMap(Pokemon entity) {
    return {
      'id': entity.id,
      'order': entity.order,
      'name': entity.name,
      'height': entity.height,
      'weight': entity.weight,
      'base_experience': entity.baseExperience,
      // TODO: implement toMap
    };
  }

  @override
  Pokemon fromMap(Map<String, dynamic> map) {
    return Pokemon(
      id: map['id'],
      order: map['order'],
      name: splitWordsCapitalizing(map['name']),
      slug: map['name'],
      height: map['height'],
      weight: map['weight'],
      baseExperience: map['base_experience'],
      species: NameUrlPair(
        name: map['species']['name'],
        url: map['species']['url'],
      ),
      bigPictureUrl:
          map['sprites']?['other']?['official-artwork']?['front_default'] ?? '',
      thumbnailPictureUrl: map['sprites']?['front_default'] ?? '',
      stats: pokeStatsFromMap(map['stats']),
      types: pokeTypesFromMap(map['types']),
      moves: pokeMovesFromMap(map['moves']),
      abilities: pokeAbilitiesFromMap(map['abilities']),
    );
  }

  List<PokeStat> pokeStatsFromMap(List<dynamic> list) {
    return List<PokeStat>.from(list.map((map) {
      final statName = map['stat']['name'];
      return PokeStat(
        baseStat: map['base_stat'],
        effort: map['effort'],
        alias: _pokeStatAliases[statName] ?? 'XXX',
        stat: NameUrlPair(
          name: statName,
          url: map['stat']['url'],
        ),
      );
    }));
  }

  List<PokeType> pokeTypesFromMap(List<dynamic> list) {
    return List<PokeType>.from(list.map((map) => PokeType(
          slot: map['slot'],
          type: NameUrlPair(
            name: map['type']['name'],
            url: map['type']['url'],
          ),
        )));
  }

  List<PokeMove> pokeMovesFromMap(List<dynamic> list) {
    return List<PokeMove>.from(list.map((map) => PokeMove(
          move: NameUrlPair(
            name: map['move']['name'],
            url: map['move']['url'],
          ),
        )));
  }

  List<PokeAbility> pokeAbilitiesFromMap(List<dynamic> list) {
    return List<PokeAbility>.from(list.map((map) => PokeAbility(
          slot: map['slot'],
          ability: NameUrlPair(
            name: map['ability']['name'],
            url: map['ability']['url'],
          ),
        )));
  }
}

const _pokeStatAliases = {
  'hp': 'HP',
  'attack': 'ATK',
  'defense': 'DEF',
  'special-attack': 'SATK',
  'special-defense': 'SDE',
  'speed': 'SPD',
};
