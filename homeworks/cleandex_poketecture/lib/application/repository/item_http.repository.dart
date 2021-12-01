import 'package:cleandex_poketecture/application/infra/abstract_http.mapper.dart';
import 'package:cleandex_poketecture/application/infra/abstract_http.repository.dart';
import 'package:cleandex_poketecture/domain/item/item.dart';
import 'package:cleandex_poketecture/domain/item/item.repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class ItemRepositoryHttp extends AbstractHttpRepository<Item>
    implements ItemRepository {
  ItemRepositoryHttp() : super('item');

  static const maxResultCount = 300;

  @override
  Future<List<Item>> findAll() async {
    final http = GetIt.I.get<Dio>();
    final list = <Item>[];

    final response = await http.get('$url?limit=$maxResultCount');

    var json = response.data;

    List<dynamic>? results = json['results'];
    while (results != null && results.isNotEmpty) {
      list.addAll(results.map((map) => fromMap(map)));

      if (json['next'] != null) {
        json = (await http.get(json['next'])).data;
      } else {
        break;
      }

      if (list.length >= maxResultCount) {
        break;
      }
    }

    return list;
  }

  @override
  Future<Item?> findById(int id) async {
    final http = GetIt.I.get<Dio>();
    final response = await http.get('$url/$id');
    return fromMap(response.data);
  }

  Item fromMap(Map<String, dynamic> map) {
    return GetIt.I.get<AbstractHttpMapper<Item>>().fromMap(map);
  }
}
