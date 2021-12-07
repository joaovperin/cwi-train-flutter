import 'package:cleandex_poketecture/application/infra/bloc/generic_data_source.dart';
import 'package:cleandex_poketecture/commons/interfaces.dart';
import 'package:cleandex_poketecture/domain/item/item.repository.dart';
import 'package:cleandex_poketecture/domain/item/item_details.dart';
import 'package:cleandex_poketecture/domain/item/item.dart';
import 'package:get_it/get_it.dart';

class ItemDataSource extends GenericDataSource<Item, ItemDetails> {
  @override
  ListRepository<Item, ItemDetails> get repository =>
      GetIt.I.get<ItemRepository>();

  @override
  int get itemsPerPage => 60;
}
