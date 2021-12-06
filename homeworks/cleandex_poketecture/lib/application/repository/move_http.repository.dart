import 'package:cleandex_poketecture/application/infra/abstract_http.repository.dart';
import 'package:cleandex_poketecture/commons/interfaces.dart';
import 'package:cleandex_poketecture/domain/move/move.dart';
import 'package:cleandex_poketecture/domain/move/move.repository.dart';
import 'package:cleandex_poketecture/domain/move/move_info.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class MoveRepositoryHttp extends AbstractHttpRepository<Move>
    implements MoveRepository {
  MoveRepositoryHttp() : super('move');

  static const maxResultCount = 420;

  @override
  Future<List<Move>> findAll({String? search}) async {
    final http = GetIt.I.get<Dio>();
    final list = <Move>[];

    final response = await http.get('$url?limit=$maxResultCount');

    var json = response.data;

    List<dynamic>? results = json['results'];
    while (results != null && results.isNotEmpty) {
      list.addAll(results.map((map) => _moveFromMap(map)));

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
  Future<MoveInfo?> findInfoById(int id) async {
    final http = GetIt.I.get<Dio>();
    final response = await http.get('$url/$id');
    if (response.data != null) {
      return _moveInfoFromMap(response.data);
    }
  }

  @override
  Future<Move?> findById(int id) async {
    final http = GetIt.I.get<Dio>();
    final response = await http.get('$url/$id');
    return _moveFromMap(response.data);
  }

  Move _moveFromMap(Map<String, dynamic> map) {
    return GetIt.I.get<MappableMapper<Move>>().fromMap(map);
  }

  MoveInfo _moveInfoFromMap(Map<String, dynamic> map) {
    return GetIt.I.get<MappableMapper<MoveInfo>>().fromMap(map);
  }
}
