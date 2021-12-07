import 'package:cleandex_poketecture/application/infra/abstract_http.mapper.dart';
import 'package:cleandex_poketecture/domain/item/item_details.dart';

class ItemDetailsHttpMapper extends AbstractHttpMapper<ItemDetails> {
  const ItemDetailsHttpMapper() : super();

  @override
  Map<String, dynamic> toMap(ItemDetails entity) {
    return {
      'id': entity.id,
      'name': entity.name,
    };
  }

  @override
  ItemDetails fromMap(Map<String, dynamic> map) {
    return ItemDetails(
      id: map['id'],
      name: map['name'],
    );
  }
}
