import 'package:cleandex_poketecture/application/infra/abstract_http.repository.dart';
import 'package:cleandex_poketecture/commons/interfaces.dart';
import 'package:cleandex_poketecture/domain/item/item.repository.dart';
import 'package:cleandex_poketecture/domain/item/item_details.dart';
import 'package:cleandex_poketecture/domain/item/item.dart';
import 'package:cleandex_poketecture/domain/vo/paginated_search_result.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class ItemRepositoryHttp extends AbstractHttpRepository<Item>
    implements ItemRepository {
  ItemRepositoryHttp() : super('item');

  bool searchMatches(Item e, String search) =>
      e.name.toLowerCase().contains(search);

  @override
  Future<List<Item>> findAll({String? search}) async {
    final list = <Item>[];
    var pageNumber = 0;
    while (true) {
      final page = await findPage(page: pageNumber++, size: 150);
      if (search != null && search.trim().isNotEmpty) {
        final searchTerm = search.trim().toLowerCase();
        list.addAll(page.results.where((e) => searchMatches(e, searchTerm)));
      } else {
        list.addAll(page.results);
      }
      if (page.isLastPage) {
        break;
      }
    }
    return list;
  }

  @override
  Future<Item> findInfoById(int id) async {
    final http = GetIt.I.get<Dio>();
    final response = await http.get('$url/$id');
    return _fromMap(response.data);
  }

  @override
  Future<Item> findInfoByName(String name) async {
    final http = GetIt.I.get<Dio>();
    final response = await http.get('$url/$name');
    return _fromMap(response.data);
  }

  @override
  Future<PaginatedSearchResult<Item>> findPage({
    required int page,
    required int size,
  }) async {
    final http = GetIt.I.get<Dio>();
    final response = await http.get('$url?offset=${page * size}&limit=$size');

    final json = response.data;
    return PaginatedSearchResult<Item>(
      count: json['count'],
      results: await _promoteAndSort(json['results']),
      next: json['next'],
      previous: json['previous'],
    );
  }

  @override
  Future<ItemDetails> findDetailsById(int id) async {
    final http = GetIt.I.get<Dio>();
    final response = await http.get('$url/$id');
    return _detailsFromMap(response.data);
  }

  Future<List<Item>> _promoteAndSort(List<dynamic> list) async {
    final result = (await Stream.fromFutures(
      list.map((p) {
        return findInfoByName(p['name']);
      }),
    ).toList());
    result.sort((a, b) => a.id.compareTo(b.id));
    return result;
  }

  ItemDetails _detailsFromMap(Map<String, dynamic> map) {
    return GetIt.I.get<EntityMapper<ItemDetails>>().fromMap(map);
  }

  Item _fromMap(Map<String, dynamic> map) {
    return GetIt.I.get<EntityMapper<Item>>().fromMap(map);
  }
}
