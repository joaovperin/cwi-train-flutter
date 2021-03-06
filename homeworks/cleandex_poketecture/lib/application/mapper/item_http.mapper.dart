import 'package:cleandex_poketecture/application/infra/abstract_http.mapper.dart';
import 'package:cleandex_poketecture/domain/item/item.dart';

class ItemHttpMapper extends AbstractHttpMapper<Item> {
  const ItemHttpMapper() : super();

  @override
  Map<String, dynamic> toMap(Item entity) {
    return {
      'id': entity.id,
      'name': entity.name,
      'cost': entity.cost,
      'description': entity.description,
      'pictureUrl': entity.pictureUrl,
    };
  }

  @override
  Item fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      name: nameFromList(map['names']),
      slug: map['name'],
      cost: map['cost'],
      pictureUrl: map['sprites']['default'],
      description: descriptionFromRootMap(map),
    );
  }

  String nameFromList(List<dynamic> list) {
    return list
        .firstWhere((element) => element['language']['name'] == 'en')['name'];
  }

  String descriptionFromRootMap(Map<String, dynamic> map) {
    final List<dynamic> list = map['effect_entries'];
    final sb = StringBuffer();

    final elm = list.firstWhere(
        (element) => element['language']['name'] == 'en',
        orElse: () => '');

    return (sb
          ..write(elm['effect'])
          ..write('\n'))
        .toString();
  }
}
