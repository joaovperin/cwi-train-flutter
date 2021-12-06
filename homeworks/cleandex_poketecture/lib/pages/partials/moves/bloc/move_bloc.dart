import 'package:bloc/bloc.dart';
import 'package:cleandex_poketecture/commons/interfaces.dart';
import 'package:cleandex_poketecture/domain/move/move_data_source.dart';
import 'package:cleandex_poketecture/pages/partials/moves/bloc/move_events.dart';
import 'package:cleandex_poketecture/pages/partials/moves/bloc/move_states.dart';

class MoveBloc extends SearchableBloc<MoveEvent, MoveState> {
  MoveBloc() : super(const MoveLoadingState()) {
    on<MoveFetchPageEvent>(_onFetchPageEvent);
    on<MoveSearchEvent>(_onSearchEvent);
  }

  final MoveDataSource _dataSource = MoveDataSource();

  Future<void> _onSearchEvent(
    MoveSearchEvent event,
    Emitter<MoveState> emit,
  ) async {
    emit(const MoveLoadingState());
    final results = await _dataSource.searchByName(event.search);
    emit(MoveListState.next(results, noMoreResults: true));
  }

  Future<void> _onFetchPageEvent(
    MoveFetchPageEvent event,
    Emitter<MoveState> emit,
  ) async {
    try {
      final results = await _dataSource.fetchNextPage();
      emit(MoveListState.next(event.currentList + results));
    } on NoMoreRowsException catch (_) {
      emit(MoveListState.next(event.currentList, noMoreResults: true));
    } on Exception catch (e) {
      emit(MoveFailState(e.toString()));
    }
  }

  @override
  void onSearch(String searchText) {
    add(MoveSearchEvent(searchText));
  }

  void resetCounter() {
    _dataSource.resetCounter();
  }
}
