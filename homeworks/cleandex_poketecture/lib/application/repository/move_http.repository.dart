import 'package:cleandex_poketecture/application/infra/abstract_http.repository.dart';
import 'package:cleandex_poketecture/commons/interfaces.dart';
import 'package:cleandex_poketecture/domain/move/move.repository.dart';
import 'package:cleandex_poketecture/domain/move/move_details.dart';
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
  Future<Move> findInfoById(int id) async {
    final http = GetIt.I.get<Dio>();
    final response = await http.get('$url/$id');
    return _fromMap(response.data);
  }

  @override
  Future<Move> findInfoByName(String name) async {
    final http = GetIt.I.get<Dio>();
    final response = await http.get('$url/$name');
    return _fromMap(response.data);
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
      results: await _promoteAndSort(json['results']),
      next: json['next'],
      previous: json['previous'],
    );
  }

  @override
  Future<MoveDetails> findDetailsById(int id) async {
    final http = GetIt.I.get<Dio>();
    final response = await http.get('$url/$id');
    return _detailsFromMap(response.data);
  }

  Future<List<Move>> _promoteAndSort(List<dynamic> list) async {
    final result = (await Stream.fromFutures(
      list.map((p) {
        return findInfoByName(p['name']);
      }),
    ).toList());
    result.sort((a, b) => a.id.compareTo(b.id));
    return result;
  }

  MoveDetails _detailsFromMap(Map<String, dynamic> map) {
    return GetIt.I.get<EntityMapper<MoveDetails>>().fromMap(map);
  }

  Move _fromMap(Map<String, dynamic> map) {
    return GetIt.I.get<EntityMapper<Move>>().fromMap(map);
  }
}
