import 'package:cleandex_poketecture/domain/item/item.dart';
import 'package:cleandex_poketecture/domain/item/item.repository.dart';
import 'package:cleandex_poketecture/domain/item/item_info.dart';
import 'package:get_it/get_it.dart';

class ItemDataSource {
  static const itemsPerPage = 60;

  final ItemRepository _repository = GetIt.I.get<ItemRepository>();
  int currentPage;
  int rowsCount;

  ItemDataSource()
      : currentPage = 0,
        rowsCount = 0;

  Future<List<ItemInfo>> searchByName(String search) async {
    final results = await _repository.findAll(search: search);
    return _promoteSorting(results);
  }

  Future<ItemInfo> findInfo(Item model) async {
    final info = await _repository.findInfoById(model.id);
    if (info == null) {
      throw ItemNotFoundException();
    }
    return info;
  }

  Future<List<ItemInfo>> fetchNextPage() async {
    final page = await _repository.findPage(
      page: currentPage++,
      size: itemsPerPage,
    );

    if (page.isLastPage) {
      throw NoMoreRowsException();
    }

    rowsCount = page.count;
    return _promoteSorting(page.results);
  }

  void resetCounter() {
    currentPage = 0;
    rowsCount = 0;
  }

  Future<List<ItemInfo>> _promoteSorting(List<Item> list) async {
    final result = (await Stream.fromFutures(
      list.map((p) => findInfo(p)),
    ).toList());
    result.sort((a, b) => a.id.compareTo(b.id));
    return result;
  }
}

class NoMoreRowsException implements Exception {}

class ItemNotFoundException implements Exception {}
