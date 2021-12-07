import 'package:cleandex_poketecture/application/infra/bloc/generic_data_source.dart';
import 'package:cleandex_poketecture/commons/interfaces.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon.repository.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon_details.dart';
import 'package:get_it/get_it.dart';

class PokemonDataSource extends GenericDataSource<Pokemon, PokemonDetails> {
  @override
  ListRepository<Pokemon, PokemonDetails> get repository =>
      GetIt.I.get<PokemonRepository>();

  @override
  int get itemsPerPage => 40;
}
