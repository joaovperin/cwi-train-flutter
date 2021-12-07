import 'package:cleandex_poketecture/application/infra/bloc/generic_list_bloc.dart';
import 'package:cleandex_poketecture/application/infra/bloc/generic_list_bloc_events.dart';
import 'package:cleandex_poketecture/domain/item/item_data_source.dart';
import 'package:cleandex_poketecture/domain/item/item_details.dart';
import 'package:cleandex_poketecture/domain/item/item.dart';

class ItemBloc extends GenericListBloc<Item, ItemDetails> {
  ItemBloc() : super() {
    on<AppBlocFetchPageEvent<Item>>(onFetchPageEvent);
    on<AppBlocSearchEvent<Item>>(onSearchEvent);
  }

  @override
  final ItemDataSource dataSource = ItemDataSource();
}
