import 'package:cleandex_poketecture/application/widgets/app_loading.widget.dart';
import 'package:cleandex_poketecture/application/widgets/app_square_image_box.widget.dart';
import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:cleandex_poketecture/commons/interfaces.dart';
import 'package:cleandex_poketecture/domain/item/item.dart';
import 'package:cleandex_poketecture/domain/item/item.repository.dart';
import 'package:cleandex_poketecture/pages/details.page.dart';
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
            return _ItemsTitleWidget(model: _list[index]);
          }
          return AppLoadingWidget.centered();
        },
      ),
    );
  }
}

class _ItemsTitleWidget extends StatelessWidget {
  const _ItemsTitleWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final Item model;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.listTileBg,
      child: InkWell(
        onDoubleTap: () {
          Navigator.pushNamed(context, DetailsPage.routeName,
              arguments: DetailsPageArgs.mockItem());
        },
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(model.name),
            ],
          ),
          subtitle: Text(model.fmtId),
          leading: SquareImageBoxWidget(model.pictureUrl),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.keyboard_arrow_right),
            ],
          ),
        ),
      ),
    );
  }
}
