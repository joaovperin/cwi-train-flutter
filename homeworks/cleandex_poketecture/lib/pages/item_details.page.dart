import 'package:cleandex_poketecture/application/widgets/app_details.widget.dart';
import 'package:cleandex_poketecture/application/widgets/app_loading.widget.dart';
import 'package:cleandex_poketecture/application/widgets/app_round_chip.widget.dart';
import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:cleandex_poketecture/domain/item/item.dart';
import 'package:cleandex_poketecture/domain/item/item.repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ItemDetailsPageArgs {
  final Item model;

  const ItemDetailsPageArgs(this.model);
}

class ItemDetailsPage extends StatelessWidget {
  static const routeName = '/items';
  const ItemDetailsPage({
    Key? key,
    required this.slug,
    required this.routeArgs,
  }) : super(key: key);

  final ItemDetailsPageArgs? routeArgs;
  final String? slug;

  Future<ItemDetailsPageArgs> _loadArgs(BuildContext context) async {
    if (routeArgs != null) {
      return routeArgs!;
    }

    final repository = GetIt.instance.get<ItemRepository>();
    final model = await repository.findInfoByName(slug!);
    return ItemDetailsPageArgs(model);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ItemDetailsPageArgs>(
        future: _loadArgs(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return AppLoadingWidget.centered();
          }

          final args = snapshot.data!;
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
                  style:
                      const TextStyle(fontSize: 20, color: AppColors.lightText),
                ),
              ),
            ),
          );
        });
  }
}
