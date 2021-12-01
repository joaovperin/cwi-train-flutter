import 'package:cleandex_poketecture/application/infra/abstract_http.mapper.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon_info.dart';
import 'package:cleandex_poketecture/domain/vo/name_url_pair.dart';

class PokemonInfoHttpMapper extends AbstractHttpMapper<PokemonInfo> {
  const PokemonInfoHttpMapper() : super();

  @override
  Map<String, dynamic> toMap(PokemonInfo entity) {
    return {
      'id': entity.id,
      'name': entity.name,
    };
  }

  @override
  PokemonInfo fromMap(Map<String, dynamic> map) {
    return PokemonInfo(
      id: map['id'],
      order: map['order'],
      name: formatName(map['name']),
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
    // 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png',
    return PokeSprites(
      frontDefault: map['front_default'],
      backDefault: map['back_default'],
      frontShiny: map['front_shiny'],
      backShiny: map['back_shiny'],
    );
  }

  List<PokeStat> pokeStatsFromMap(List<dynamic> list) {
    // stats: List<PokeStat>.from(map['stats']?.map((x) => PokeStat.fromMap(x))),
    // TODO: Unhardcode that
    return [
      const PokeStat(
        baseStat: 28,
        effort: 0,
        stat: NameUrlPair(
          name: 'hp',
          url: 'https://pokeapi.co/api/v2/stat/1/',
        ),
      ),
    ];
  }

  List<PokeType> pokeTypesFromMap(List<dynamic> list) {
    // types: List<PokeType>.from(map['types']?.map((x) => PokeType.fromMap(x))),
    // TODO: Unhardcode that
    return [
      const PokeType(
        slot: 1,
        type: NameUrlPair(
          name: 'normal',
          url: 'https://pokeapi.co/api/v2/type/1/',
        ),
      ),
    ];
  }

  List<PokeMove> pokeMovesFromMap(List<dynamic> list) {
    // moves: List<PokeMove>.from(map['moves']?.map((x) => PokeMove.fromMap(x))),
    // TODO: Unhardcode that
    return [
      const PokeMove(
        move: NameUrlPair(
          name: 'tackle',
          url: 'https://pokeapi.co/api/v2/move/1/',
        ),
      ),
    ];
  }

  List<PokeAbility> pokeAbilitiesFromMap(List<dynamic> list) {
    // abilities: List<PokeAbilitiy>.from(
    //     map['abilities']?.map((x) => PokeAbilitiy.fromMap(x))),
    // TODO: Unhardcode that
    return [
      const PokeAbility(
        slot: 1,
        ability: NameUrlPair(
          name: 'blaze',
          url: 'https://pokeapi.co/api/v2/ability/1/',
        ),
      ),
    ];
  }
}
