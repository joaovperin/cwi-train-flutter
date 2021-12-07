import 'package:bloc/bloc.dart';
import 'package:cleandex_poketecture/application/infra/bloc/generic_data_source.dart';
import 'package:cleandex_poketecture/application/infra/bloc/generic_list_bloc_events.dart';
import 'package:cleandex_poketecture/application/infra/bloc/generic_list_bloc_states.dart';
import 'package:cleandex_poketecture/commons/interfaces.dart';

abstract class GenericListBloc<MODEL extends Entity<MODEL>, DETAILS>
    extends SearchableBloc<AppBlocEvent<MODEL>, AppBlocState<MODEL>> {
  GenericListBloc() : super(AppBlocLoadingState<MODEL>());

  GenericDataSource<MODEL, DETAILS> get dataSource;

  Future<void> onSearchEvent(
    AppBlocSearchEvent<MODEL> event,
    Emitter<AppBlocState<MODEL>> emit,
  ) async {
    emit(AppBlocLoadingState<MODEL>());
    final results = await dataSource.searchByName(event.search);
    emit(AppBlocListState<MODEL>.next(results, noMoreResults: true));
  }

  Future<void> onFetchPageEvent(
    AppBlocFetchPageEvent<MODEL> event,
    Emitter<AppBlocState<MODEL>> emit,
  ) async {
    try {
      if (event is AppBlocFetchFirstPageEvent<MODEL>) {
        emit(AppBlocLoadingState<MODEL>());
        dataSource.resetCounter();
      }
      final results = await dataSource.fetchNextPage();
      emit(AppBlocListState<MODEL>.next(event.currentList + results));
    } on NoMoreRowsException catch (_) {
      emit(
          AppBlocListState<MODEL>.next(event.currentList, noMoreResults: true));
    } on Exception catch (e) {
      emit(AppBlocFailState<MODEL>(e.toString()));
    }
  }

  @override
  void onSearch(String searchText) {
    if (searchText.isEmpty) {
      add(AppBlocFetchFirstPageEvent<MODEL>());
    } else {
      add(AppBlocSearchEvent<MODEL>(searchText));
    }
  }

  Future<DETAILS> loadDetails(MODEL model) async {
    return dataSource.findDetails(model);
  }

  void resetCounter() {
    dataSource.resetCounter();
  }
}
