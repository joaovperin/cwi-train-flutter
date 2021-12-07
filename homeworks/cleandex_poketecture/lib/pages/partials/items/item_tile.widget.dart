import 'package:cleandex_poketecture/application/widgets/app_square_image_box.widget.dart';
import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:cleandex_poketecture/commons/interfaces.dart';
import 'package:cleandex_poketecture/domain/item/item.dart';
import 'package:flutter/material.dart';

class ItemsTitleWidget extends StatelessWidget {
  const ItemsTitleWidget({
    Key? key,
    required this.model,
    required this.onDoubleTap,
  }) : super(key: key);

  final Item model;
  final OnTapFn<Item> onDoubleTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.listTileBg,
      child: InkWell(
        onDoubleTap: () => onDoubleTap.call(model),
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
