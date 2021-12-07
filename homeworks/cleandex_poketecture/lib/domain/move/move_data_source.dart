import 'package:cleandex_poketecture/application/infra/bloc/generic_data_source.dart';
import 'package:cleandex_poketecture/commons/interfaces.dart';
import 'package:cleandex_poketecture/domain/move/move.repository.dart';
import 'package:cleandex_poketecture/domain/move/move_details.dart';
import 'package:cleandex_poketecture/domain/move/move_info.dart';
import 'package:get_it/get_it.dart';

class MoveDataSource extends GenericDataSource<Move, MoveDetails> {
  @override
  ListRepository<Move, MoveDetails> get repository =>
      GetIt.I.get<MoveRepository>();

  @override
  int get itemsPerPage => 60;
}
