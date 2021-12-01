import 'package:cleandex_poketecture/domain/move/move.dart';

abstract class MoveRepository {
  const MoveRepository._();

  Future<List<Move>> findAll();
  Future<Move?> findById(int id);
}
