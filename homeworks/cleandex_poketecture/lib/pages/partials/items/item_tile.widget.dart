import 'package:cleandex_poketecture/application/widgets/app_square_image_box.widget.dart';
import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:cleandex_poketecture/commons/interfaces.dart';
import 'package:cleandex_poketecture/domain/item/item.dart';
import 'package:flutter/material.dart';

class ItemsTitleWidget extends StatelessWidget {
  const ItemsTitleWidget({
    Key? key,
    required this.model,
    required this.onTap,
  }) : super(key: key);

  final Item model;
  final OnTapFn<Item> onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.listTileBg,
      child: InkWell(
        onTap: () => onTap.call(model),
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                model.name,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
          leading: SquareImageBoxWidget(model.pictureUrl),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                model.fmtCost,
                style: const TextStyle(
                  fontSize: 18,
                  color: AppColors.text,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
