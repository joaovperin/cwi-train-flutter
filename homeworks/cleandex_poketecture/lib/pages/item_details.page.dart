import 'package:cleandex_poketecture/application/widgets/app_details.widget.dart';
import 'package:cleandex_poketecture/application/widgets/app_round_chip.widget.dart';
import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:cleandex_poketecture/domain/item/item.dart';
import 'package:flutter/material.dart';

class ItemDetailsPageArgs {
  final Item model;

  const ItemDetailsPageArgs(this.model);
}

class ItemDetailsPage extends StatelessWidget {
  static const routeName = '/item-details';
  const ItemDetailsPage({Key? key, required this.args}) : super(key: key);
  final ItemDetailsPageArgs args;

  @override
  Widget build(BuildContext context) {
    return AppDetailsWidget(
      AppDetailsWidgetArgs(
        title: args.model.name,
        colors: AppColors.itemDetails.asLightGradient,
        description: args.model.description.trim().replaceAll(':', '\n'),
        image: AppRoundNetworkImage(args.model.pictureUrl),
        imagePadding: 0.12,
        subtitle: Center(
          child: Text(
            args.model.fmtCost,
            style: const TextStyle(fontSize: 20, color: AppColors.lightText),
          ),
        ),
      ),
    );
  }
}
