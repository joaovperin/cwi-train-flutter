import 'package:bloc/bloc.dart';
import 'package:cleandex_poketecture/commons/interfaces.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon_data_source.dart';
import 'package:cleandex_poketecture/pages/partials/pokemon/bloc/pokemon_events.dart';
import 'package:cleandex_poketecture/pages/partials/pokemon/bloc/pokemon_states.dart';

class PokemonBloc extends SearchableBloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(const PokemonReloadingState()) {
    on<PokemonLoadRequestEvent>(_onLoadRequestEvent);
    on<PokemonSearchEvent>(_onSearchEvent);
  }

  final PokemonDataSource _pokemonDataSource = PokemonDataSource();

  Future<void> _onSearchEvent(
    PokemonSearchEvent event,
    Emitter<PokemonState> emit,
  ) async {
    emit(const PokemonReloadingState());
    final results = await _pokemonDataSource.searchByName(event.search);
    emit(PokemonListState.next(results, noMoreResults: true));
  }

  Future<void> _onLoadRequestEvent(
    PokemonLoadRequestEvent event,
    Emitter<PokemonState> emit,
  ) async {
    try {
      final search = event.search;
      if (search != null) {
        emit(const PokemonReloadingState());
        final results = await _pokemonDataSource.searchByName(search);
        emit(PokemonListState.next(results, noMoreResults: true));
      } else {
        final results = await _pokemonDataSource.fetchNextPage();
        emit(PokemonListState.next(event.currentList + results));
      }
    } on NoMoreRowsException catch (_) {
      emit(PokemonListState.next(event.currentList, noMoreResults: true));
    } on Exception catch (e) {
      emit(PokemonFailState(e.toString()));
    }
  }

  @override
  void onSearch(String searchText) {
    add(PokemonLoadRequestEvent.first(searchText));
  }
}
