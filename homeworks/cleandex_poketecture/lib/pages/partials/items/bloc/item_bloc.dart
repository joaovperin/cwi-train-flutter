import 'package:bloc/bloc.dart';
import 'package:cleandex_poketecture/commons/interfaces.dart';
import 'package:cleandex_poketecture/domain/item/item_data_source.dart';
import 'package:cleandex_poketecture/pages/partials/items/bloc/item_events.dart';
import 'package:cleandex_poketecture/pages/partials/items/bloc/item_states.dart';

class ItemBloc extends SearchableBloc<ItemEvent, ItemState> {
  ItemBloc() : super(const ItemLoadingState()) {
    on<ItemFetchPageEvent>(_onFetchPageEvent);
    on<ItemSearchEvent>(_onSearchEvent);
  }

  final ItemDataSource _dataSource = ItemDataSource();

  Future<void> _onSearchEvent(
    ItemSearchEvent event,
    Emitter<ItemState> emit,
  ) async {
    emit(const ItemLoadingState());
    final results = await _dataSource.searchByName(event.search);
    emit(ItemListState.next(results, noMoreResults: true));
  }

  Future<void> _onFetchPageEvent(
    ItemFetchPageEvent event,
    Emitter<ItemState> emit,
  ) async {
    try {
      if (event is ItemFetchFirstPageEvent) {
        emit(const ItemLoadingState());
        _dataSource.resetCounter();
      }
      final results = await _dataSource.fetchNextPage();
      emit(ItemListState.next(event.currentList + results));
    } on NoMoreRowsException catch (_) {
      emit(ItemListState.next(event.currentList, noMoreResults: true));
    } on Exception catch (e) {
      emit(ItemFailState(e.toString()));
    }
  }

  @override
  void onSearch(String searchText) {
    if (searchText.isEmpty) {
      _dataSource.resetCounter();
      add(const ItemFetchFirstPageEvent());
    } else {
      add(ItemSearchEvent(searchText));
    }
  }

  void resetCounter() {
    _dataSource.resetCounter();
  }
}
