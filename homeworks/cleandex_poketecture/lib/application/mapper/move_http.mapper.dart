import 'package:cleandex_poketecture/application/infra/abstract_http.mapper.dart';
import 'package:cleandex_poketecture/domain/move/move.dart';
import 'package:cleandex_poketecture/domain/vo/name_url_pair.dart';

class MoveHttpMapper extends AbstractHttpMapper<Move> {
  const MoveHttpMapper() : super();
  static final expressionsRegexp = RegExp(r'\$([\w\_]+)');

  @override
  Map<String, dynamic> toMap(Move entity) {
    return {
      'id': entity.id,
      'name': entity.name,
      'type': entity.type.name,
      'pictureUrl': entity.picturePath,
      'description': entity.description,
      'power': entity.power,
      'pp': entity.pp,
      'accuracy': entity.accuracy,
    };
  }

  @override
  Move fromMap(Map<String, dynamic> map) {
    final type = moveTypeFromMap(map['type']);
    return Move(
      id: map['id'],
      name: moveNameFromList(map['names']),
      slug: map['name'],
      type: type,
      picturePath: 'assets/icons/elements/${type.name}.svg',
      description: moveDescriptionFromRootMap(map),
      power: map['power'] ?? 0,
      accuracy: map['accuracy'] ?? 0,
      pp: map['pp'] ?? 0,
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
      String effect = element['effect'];
      sb
        ..write(effect.replaceAllMapped(
            expressionsRegexp, (match) => map[match.group(1)].toString()))
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
