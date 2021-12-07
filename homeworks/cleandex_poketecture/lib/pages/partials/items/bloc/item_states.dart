import 'package:cleandex_poketecture/domain/item/item_info.dart';

abstract class ItemState {
  const ItemState();
}

class ItemListState extends ItemState {
  final List<ItemInfo> list;
  final bool noMoreResults;

  const ItemListState._(this.list, {this.noMoreResults = false});

  factory ItemListState.empty() => const ItemListState._([]);

  const factory ItemListState.next(
    List<ItemInfo> list, {
    bool noMoreResults,
  }) = ItemListState._;
}

class ItemLoadingState extends ItemState {
  const ItemLoadingState();
}

class ItemFailState extends ItemState {
  const ItemFailState(this.message);

  final String message;
}
