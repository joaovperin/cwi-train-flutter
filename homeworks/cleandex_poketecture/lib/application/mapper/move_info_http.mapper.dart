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
      'pictureUrl': entity.picturePath,
      'description': entity.description,
      'power': entity.power,
      'pp': entity.pp,
      'accuracy': entity.accuracy,
    };
  }

  @override
  MoveInfo fromMap(Map<String, dynamic> map) {
    final type = moveTypeFromMap(map['type']);
    return MoveInfo(
      id: map['id'],
      name: moveNameFromList(map['names']),
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
      final regexpExpressions = RegExp(r'\$([\w\_]+)');
      regexpExpressions.allMatches(effect).forEach((match) {
        final name = match.group(1);
        if (name != null && map[name] != null) {
          effect = effect.replaceAll('\$$name', map[name].toString());
        }
      });
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
