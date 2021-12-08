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
      'name': entity.name,
      'name_slug': entity.nameSlug,
      // TODO: implement toMap
    };
  }

  @override
  Pokemon fromMap(Map<String, dynamic> map) {
    return Pokemon(
      id: map['id'],
      order: map['order'],
      name: splitWordsCapitalizing(map['name']),
      nameSlug: map['name'],
      height: map['height'],
      weight: map['weight'],
      baseExperience: map['base_experience'],
      sprites: pokeSpritesFromMap(map['sprites']),
      stats: pokeStatsFromMap(map['stats']),
      types: pokeTypesFromMap(map['types']),
      moves: pokeMovesFromMap(map['moves']),
      abilities: pokeAbilitiesFromMap(map['abilities']),
    );
  }

  PokeSprites pokeSpritesFromMap(Map<String, dynamic> map) {
    return PokeSprites(
      frontDefault: map['front_default'],
      backDefault: map['back_default'],
      frontShiny: map['front_shiny'],
      backShiny: map['back_shiny'],
    );
  }

  List<PokeStat> pokeStatsFromMap(List<dynamic> list) {
    return List<PokeStat>.from(list.map((map) => PokeStat(
          baseStat: map['base_stat'],
          effort: map['effort'],
          stat: NameUrlPair(
            name: map['stat']['name'],
            url: map['stat']['url'],
          ),
        )));
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
