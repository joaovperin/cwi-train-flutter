import 'package:cleandex_poketecture/application/infra/bloc/generic_list_bloc.dart';
import 'package:cleandex_poketecture/application/infra/bloc/generic_list_bloc_events.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon_data_source.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon_details.dart';

class PokemonBloc extends GenericListBloc<Pokemon, PokemonDetails> {
  PokemonBloc() : super() {
    on<AppBlocFetchPageEvent<Pokemon>>(onFetchPageEvent);
    on<AppBlocSearchEvent<Pokemon>>(onSearchEvent);
  }

  @override
  final PokemonDataSource dataSource = PokemonDataSource();
}
