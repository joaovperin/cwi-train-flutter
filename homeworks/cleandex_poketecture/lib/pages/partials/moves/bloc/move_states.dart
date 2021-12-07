import 'package:cleandex_poketecture/domain/move/move_info.dart';

abstract class MoveState {
  const MoveState();
}

class MoveListState extends MoveState {
  final List<MoveInfo> list;
  final bool noMoreResults;

  const MoveListState._(this.list, {this.noMoreResults = false});

  factory MoveListState.empty() => const MoveListState._([]);

  const factory MoveListState.next(
    List<MoveInfo> list, {
    bool noMoreResults,
  }) = MoveListState._;
}

class MoveLoadingState extends MoveState {
  const MoveLoadingState();
}

class MoveFailState extends MoveState {
  const MoveFailState(this.message);

  final String message;
}
