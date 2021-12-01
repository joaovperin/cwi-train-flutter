import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:cleandex_poketecture/domain/item/item.dart';
import 'package:cleandex_poketecture/domain/item/item.repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ItemsList extends StatefulWidget {
  const ItemsList({Key? key}) : super(key: key);

  @override
  State<ItemsList> createState() => _ItemsListState();
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
          final model = _list[index];
          return InkWell(
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(model.name),
                ],
              ),
              subtitle: Text(model.fmtId),
              leading: SizedBox(
                width: 64,
                height: 64,
                child: Image.network(model.pictureUrl),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.keyboard_arrow_right),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
