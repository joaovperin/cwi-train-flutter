import 'package:cleandex_poketecture/application/infra/abstract_http.mapper.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon.dart';

class PokemonHttpMapper extends AbstractHttpMapper<Pokemon> {
  const PokemonHttpMapper() : super();

  @override
  Map<String, dynamic> toMap(Pokemon entity) {
    return {
      'id': entity.id,
      'name': entity.name,
      'pictureUrl': entity.pictureUrl,
    };
  }

  @override
  Pokemon fromMap(Map<String, dynamic> map) {
    final name = formatName(map['name']);
    final id = parseIdFromUrl(map['url']);
    return Pokemon(
      id: id,
      name: name,
      pictureUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png',
    );
  }
}
