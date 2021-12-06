import 'package:cleandex_poketecture/application/infra/abstract_http.mapper.dart';
import 'package:cleandex_poketecture/domain/move/move_info.dart';
import 'package:cleandex_poketecture/domain/vo/name_url_pair.dart';

class MoveInfoHttpMapper extends AbstractHttpMapper<MoveInfo> {
  const MoveInfoHttpMapper() : super();

  @override
  Map<String, dynamic> toMap(MoveInfo entity) {
    return {
      'id': entity.id,
      'name': entity.name,
      'type': entity.type.name,
      'pictureUrl': entity.pictureUrl,
      'description': entity.description,
      'power': entity.power,
      'pp': entity.pp,
      'accuracy': entity.accuracy,
    };
  }

  @override
  MoveInfo fromMap(Map<String, dynamic> map) {
    return MoveInfo(
      id: map['id'],
      name: moveNameFromList(map['names']),
      type: moveTypeFromMap(map['type']),
      pictureUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/ultra-ball.png',
      description: moveDescriptionFromRootMap(map),
      power: map['power'],
      accuracy: map['accuracy'],
      pp: map['pp'],
    );
  }

  String moveNameFromList(List<dynamic> list) {
    return list
        .firstWhere((element) => element['language']['name'] == 'en')['name'];
  }

  String moveDescriptionFromRootMap(Map<String, dynamic> map) {
    final List<dynamic> list = map['effect_entries'];
    final sb = StringBuffer();
    for (final element in list) {
      if (element['language']['name'] != 'en') {
        continue;
      }
      final effect = element['effect'];
      sb
        ..write(effect) // TODO: expand tags ($effect_chance%)
        ..write('\n');
    }

    return sb.toString();
  }

  NameUrlPair moveTypeFromMap(Map<String, dynamic> map) {
    return NameUrlPair(
      name: map['name'],
      url: map['url'],
    );
  }
}
