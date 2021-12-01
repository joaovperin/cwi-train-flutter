import 'package:cleandex_poketecture/application/infra/abstract_http.mapper.dart';
import 'package:cleandex_poketecture/domain/item/item.dart';

class ItemHttpMapper extends AbstractHttpMapper<Item> {
  const ItemHttpMapper() : super();

  @override
  Map<String, dynamic> toMap(Item entity) {
    return {
      'id': entity.id,
      'name': entity.name,
      'pictureUrl': entity.pictureUrl,
    };
  }

  @override
  Item fromMap(Map<String, dynamic> map) {
    final name = map['name'];
    return Item(
      id: parseIdFromUrl(map['url']),
      name: formatName(name),
      pictureUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/$name.png',
    );
  }
}
