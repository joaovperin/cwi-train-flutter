import 'package:cleandex_poketecture/application/infra/abstract_http.repository.dart';
import 'package:cleandex_poketecture/commons/interfaces.dart';
import 'package:cleandex_poketecture/domain/move/move.dart';
import 'package:cleandex_poketecture/domain/move/move.repository.dart';
import 'package:cleandex_poketecture/domain/move/move_info.dart';
import 'package:cleandex_poketecture/domain/vo/paginated_search_result.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class MoveRepositoryHttp extends AbstractHttpRepository<Move>
    implements MoveRepository {
  MoveRepositoryHttp() : super('move');

  bool searchMatches(Move e, String search) =>
      e.name.toLowerCase().contains(search);

  @override
  Future<List<Move>> findAll({String? search}) async {
    final list = <Move>[];
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
  Future<MoveInfo?> findInfoById(int id) async {
    final http = GetIt.I.get<Dio>();
    final response = await http.get('$url/$id');
    if (response.data != null) {
      return _moveInfoFromMap(response.data);
    }
  }

  @override
  Future<PaginatedSearchResult<Move>> findPage({
    required int page,
    required int size,
  }) async {
    final http = GetIt.I.get<Dio>();
    final response = await http.get('$url?offset=${page * size}&limit=$size');

    final json = response.data;
    return PaginatedSearchResult<Move>(
      count: json['count'],
      results: [...json['results'].map((map) => _moveFromMap(map))],
      next: json['next'],
      previous: json['previous'],
    );
  }

  Move _moveFromMap(Map<String, dynamic> map) {
    return GetIt.I.get<EntityMapper<Move>>().fromMap(map);
  }

  MoveInfo _moveInfoFromMap(Map<String, dynamic> map) {
    return GetIt.I.get<EntityMapper<MoveInfo>>().fromMap(map);
  }
}
