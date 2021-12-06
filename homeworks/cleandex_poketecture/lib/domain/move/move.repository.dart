import 'package:cleandex_poketecture/domain/move/move.dart';
import 'package:cleandex_poketecture/domain/move/move_info.dart';

abstract class MoveRepository {
  const MoveRepository._();

  Future<List<Move>> findAll({String? search});

  Future<MoveInfo?> findInfoById(int id);

  Future<Move?> findById(int id);
}
