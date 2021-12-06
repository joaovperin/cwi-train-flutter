import 'package:cleandex_poketecture/domain/move/move_info.dart';

abstract class MoveEvent {
  const MoveEvent();
}

class MoveSearchEvent extends MoveEvent {
  const MoveSearchEvent(this.search);
  final String search;
}

class MoveFetchPageEvent extends MoveEvent {
  final List<MoveInfo> currentList;
  const MoveFetchPageEvent._(this.currentList);

  factory MoveFetchPageEvent.first() => const MoveFetchPageEvent._([]);

  const factory MoveFetchPageEvent.next(List<MoveInfo> currentList) =
      MoveFetchPageEvent._;
}
