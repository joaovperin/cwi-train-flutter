import 'package:bloc/bloc.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon_data_source.dart';
import 'package:cleandex_poketecture/pages/partials/pokemon/bloc/pokemon_events.dart';
import 'package:cleandex_poketecture/pages/partials/pokemon/bloc/pokemon_states.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(PokemonListState.empty()) {
    on<PokemonLoadRequestEvent>(_onLoadRequestEvent);
  }

  final PokemonDataSource _pokemonDataSource = PokemonDataSource();

  Future<void> _onLoadRequestEvent(
      PokemonLoadRequestEvent event, Emitter<PokemonState> emit) async {
    try {
      final results = await _pokemonDataSource.fetchNextPage();
      emit(PokemonListState.next(event.currentList + results));
    } on NoMoreRowsException catch (_) {
      emit(PokemonListState.next(event.currentList, noMoreResults: true));
    } on Exception catch (e) {
      emit(PokemonFailState(e.toString()));
    }
  }
}
