import 'package:bloc/bloc.dart';
import 'package:cleandex_poketecture/commons/interfaces.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon_data_source.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon_details.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon_info.dart';
import 'package:cleandex_poketecture/pages/partials/pokemon/bloc/pokemon_events.dart';
import 'package:cleandex_poketecture/pages/partials/pokemon/bloc/pokemon_states.dart';

class PokemonBloc extends SearchableBloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(const PokemonLoadingState()) {
    on<PokemonFetchPageEvent>(_onFetchPageEvent);
    on<PokemonSearchEvent>(_onSearchEvent);
  }

  final PokemonDataSource _dataSource = PokemonDataSource();

  Future<void> _onSearchEvent(
    PokemonSearchEvent event,
    Emitter<PokemonState> emit,
  ) async {
    emit(const PokemonLoadingState());
    final results = await _dataSource.searchByName(event.search);
    emit(PokemonListState.next(results, noMoreResults: true));
  }

  Future<void> _onFetchPageEvent(
    PokemonFetchPageEvent event,
    Emitter<PokemonState> emit,
  ) async {
    try {
      if (event is PokemonFetchFirstPageEvent) {
        emit(const PokemonLoadingState());
        _dataSource.resetCounter();
      }
      final results = await _dataSource.fetchNextPage();
      emit(PokemonListState.next(event.currentList + results));
    } on NoMoreRowsException catch (_) {
      emit(PokemonListState.next(event.currentList, noMoreResults: true));
    } on Exception catch (e) {
      emit(PokemonFailState(e.toString()));
    }
  }

  @override
  void onSearch(String searchText) {
    if (searchText.isEmpty) {
      add(const PokemonFetchFirstPageEvent());
    } else {
      add(PokemonSearchEvent(searchText));
    }
  }

  Future<PokemonDetails> loadPokemonDetails(PokemonInfo model) async {
    return _dataSource.findDetails(model);
  }

  void resetCounter() {
    _dataSource.resetCounter();
  }
}
