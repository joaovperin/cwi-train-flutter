import 'package:cleandex_poketecture/application/widgets/app_loading.widget.dart';
import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:cleandex_poketecture/commons/interfaces.dart';
import 'package:cleandex_poketecture/domain/item/item.dart';
import 'package:cleandex_poketecture/domain/item/item.repository.dart';
import 'package:cleandex_poketecture/pages/details.page.dart';
import 'package:cleandex_poketecture/pages/partials/items/item_tile.widget.dart';
import 'package:cleandex_poketecture/pages/partials/pokemon/bloc/pokemon_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ItemsList extends StatefulWidget with WidgetWithSearchableBlock {
  const ItemsList({Key? key}) : super(key: key);

  @override
  State<ItemsList> createState() => _ItemsListState();

  @override
  SearchableBloc getBloc(BuildContext context) =>
      BlocProvider.of<PokemonBloc>(context);
}

class _ItemsListState extends State<ItemsList> {
  final ItemRepository itemRepository = GetIt.I.get<ItemRepository>();

  List<Item> _list = [];

  @override
  void initState() {
    super.initState();
    itemRepository.findAll().then((value) {
      setState(() => _list = value);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.container,
      child: ListView.separated(
        itemCount: _list.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          if (index < _list.length) {
            return ItemsTitleWidget(
              model: _list[index],
              onDoubleTap: (model) => _showInfoPopup(model),
            );
          }
          return AppLoadingWidget.centered();
        },
      ),
    );
  }

  Future<void> _showInfoPopup(Item model) async {
    Navigator.pushNamed(context, DetailsPage.routeName,
        arguments: DetailsPageArgs.mockItem());
  }
}
