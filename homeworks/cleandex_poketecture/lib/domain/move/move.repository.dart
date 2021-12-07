import 'package:cleandex_poketecture/commons/interfaces.dart';
import 'package:cleandex_poketecture/domain/move/move_details.dart';
import 'package:cleandex_poketecture/domain/move/move_info.dart';
import 'package:cleandex_poketecture/domain/vo/paginated_search_result.dart';

abstract class MoveRepository implements ListRepository<Move, MoveDetails> {
  const MoveRepository._();

  @override
  Future<List<Move>> findAll({String? search});

  @override
  Future<Move> findInfoById(int id);

  @override
  Future<Move> findInfoByName(String name);

  @override
  Future<PaginatedSearchResult<Move>> findPage({
    required int page,
    required int size,
  });

  @override
  Future<MoveDetails> findDetailsById(int id);
}
