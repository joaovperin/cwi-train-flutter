import 'package:cleandex_poketecture/application/infra/abstract_http.repository.dart';
import 'package:cleandex_poketecture/domain/move/move.dart';
import 'package:cleandex_poketecture/domain/move/move.repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class MoveRepositoryHttp extends AbstractHttpRepository<Move>
    implements MoveRepository {
  MoveRepositoryHttp() : super('move');

  static const _maxResultCount = 300;

  @override
  Future<List<Move>> findAll() async {
    final http = GetIt.I.get<Dio>();
    final list = <Move>[];

    final response = await http.get('$url?limit=$_maxResultCount');

    var json = response.data;

    List<dynamic>? results = json['results'];
    while (results != null && results.isNotEmpty) {
      list.addAll(results.map((map) => fromMap(map)));

      if (json['next'] != null) {
        json = (await http.get(json['next'])).data;
      } else {
        break;
      }

      if (list.length >= _maxResultCount) {
        break;
      }
    }

    return list;
  }

  @override
  Future<Move?> findById(int id) async {
    final http = GetIt.I.get<Dio>();
    final response = await http.get('$url/$id');
    return fromMap(response.data);
  }

  @override
  Move fromMap(Map<String, dynamic> map) {
    return Move(
      id: parseIdFromUrl(map['url']),
      name: formatName(map['name']),
    );
  }
}
