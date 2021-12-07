import 'package:cleandex_poketecture/domain/item/item.dart';
import 'package:cleandex_poketecture/domain/item/item_info.dart';
import 'package:cleandex_poketecture/domain/vo/paginated_search_result.dart';

abstract class ItemRepository {
  const ItemRepository._();

  Future<List<Item>> findAll({String? search});

  Future<ItemInfo?> findInfoById(int id);

  Future<PaginatedSearchResult<Item>> findPage({
    required int page,
    required int size,
  });
}
