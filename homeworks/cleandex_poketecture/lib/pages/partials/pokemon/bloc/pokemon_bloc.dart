import 'package:bloc/bloc.dart';
import 'package:cleandex_poketecture/pages/partials/pokemon/bloc/pokemon_data_source.dart';
import 'package:cleandex_poketecture/pages/partials/pokemon/bloc/pokemon_events.dart';
import 'package:cleandex_poketecture/pages/partials/pokemon/bloc/pokemon_states.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(const PokemonListState([])) {
    on<PokemonLoadRequestEvent>(_onLoadRequestEvent);
  }

  final PokemonDataSource pokemonDataSource = PokemonDataSource();

  Future<void> _onLoadRequestEvent(
      PokemonLoadRequestEvent event, Emitter<PokemonState> emit) async {
    try {
      final results = await pokemonDataSource.fetchNextPage();
      emit(PokemonListState(event.currentList + results));
    } on NoMoreRowsException catch (_) {
      emit(PokemonListState(event.currentList, noMoreResults: true));
    } on Exception catch (e) {
      emit(PokemonFailState(e.toString()));
    }
  }
}
