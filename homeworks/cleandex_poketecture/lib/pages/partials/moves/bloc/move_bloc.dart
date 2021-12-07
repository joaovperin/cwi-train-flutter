import 'package:cleandex_poketecture/application/infra/bloc/generic_list_bloc.dart';
import 'package:cleandex_poketecture/application/infra/bloc/generic_list_bloc_events.dart';
import 'package:cleandex_poketecture/domain/move/move.dart';
import 'package:cleandex_poketecture/domain/move/move_data_source.dart';
import 'package:cleandex_poketecture/domain/move/move_details.dart';

class MoveBloc extends GenericListBloc<Move, MoveDetails> {
  MoveBloc() : super() {
    on<AppBlocFetchPageEvent<Move>>(onFetchPageEvent);
    on<AppBlocSearchEvent<Move>>(onSearchEvent);
  }

  @override
  final MoveDataSource dataSource = MoveDataSource();
}
