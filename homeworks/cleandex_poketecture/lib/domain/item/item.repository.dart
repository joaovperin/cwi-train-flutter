import 'package:cleandex_poketecture/commons/interfaces.dart';
import 'package:cleandex_poketecture/domain/item/item_details.dart';
import 'package:cleandex_poketecture/domain/item/item.dart';
import 'package:cleandex_poketecture/domain/vo/paginated_search_result.dart';

abstract class ItemRepository implements ListRepository<Item, ItemDetails> {
  const ItemRepository._();

  @override
  Future<List<Item>> findAll({String? search});

  @override
  Future<Item> findInfoById(int id);

  @override
  Future<Item> findInfoByName(String name);

  @override
  Future<PaginatedSearchResult<Item>> findPage({
    required int page,
    required int size,
  });

  @override
  Future<ItemDetails> findDetailsById(int id);
}
