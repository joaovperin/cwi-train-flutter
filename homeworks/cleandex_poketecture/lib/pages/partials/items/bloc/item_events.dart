import 'package:cleandex_poketecture/domain/item/item_info.dart';

abstract class ItemEvent {
  const ItemEvent();
}

class ItemSearchEvent extends ItemEvent {
  const ItemSearchEvent(this.search);
  final String search;
}

class ItemFetchFirstPageEvent extends ItemFetchPageEvent {
  const ItemFetchFirstPageEvent() : super._(const []);
}

class ItemFetchPageEvent extends ItemEvent {
  final List<ItemInfo> currentList;
  const ItemFetchPageEvent._(this.currentList);

  const factory ItemFetchPageEvent.next(List<ItemInfo> currentList) =
      ItemFetchPageEvent._;
}
