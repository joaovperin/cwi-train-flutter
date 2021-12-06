import 'package:cleandex_poketecture/domain/move/move.dart';
import 'package:cleandex_poketecture/domain/move/move.repository.dart';
import 'package:cleandex_poketecture/domain/move/move_info.dart';
import 'package:get_it/get_it.dart';

class MoveDataSource {
  static const itemsPerPage = 60;

  final MoveRepository _moveRepository = GetIt.I.get<MoveRepository>();
  int currentPage;
  int rowsCount;

  MoveDataSource()
      : currentPage = 0,
        rowsCount = 0;

  Future<List<MoveInfo>> searchByName(String search) async {
    resetCounter();
    final results = await _moveRepository.findAll(search: search);
    return _promoteSorting(results);
  }

  Future<MoveInfo> findInfo(Move model) async {
    final info = await _moveRepository.findInfoById(model.id);
    if (info == null) {
      throw MoveNotFoundException();
    }
    return info;
  }

  Future<List<MoveInfo>> fetchNextPage() async {
    final page = await _moveRepository.findPage(
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

  Future<List<MoveInfo>> _promoteSorting(List<Move> list) async {
    final result = (await Stream.fromFutures(
      list.map((p) => findInfo(p)),
    ).toList());
    result.sort((a, b) => a.id.compareTo(b.id));
    return result;
  }
}

class NoMoreRowsException implements Exception {}

class MoveNotFoundException implements Exception {}
