import 'package:cleandex_poketecture/domain/move/move.dart';
import 'package:cleandex_poketecture/domain/move/move_info.dart';
import 'package:cleandex_poketecture/domain/vo/paginated_search_result.dart';

abstract class MoveRepository {
  const MoveRepository._();

  Future<List<Move>> findAll({String? search});

  Future<MoveInfo?> findInfoById(int id);

  Future<PaginatedSearchResult<Move>> findPage({
    required int page,
    required int size,
  });
}
