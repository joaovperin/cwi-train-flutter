import 'package:cleandex_poketecture/application/widgets/app_details.widget.dart';
import 'package:cleandex_poketecture/application/widgets/app_round_chip.widget.dart';
import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:cleandex_poketecture/domain/move/move.dart';
import 'package:cleandex_poketecture/pages/partials/pokemon/element_rect_chip.widget.dart';
import 'package:flutter/material.dart';

class MoveDetailsPageArgs {
  final Move model;

  const MoveDetailsPageArgs(this.model);
}

class MoveDetailsPage extends StatelessWidget {
  static const routeName = '/move-details';
  const MoveDetailsPage({Key? key, required this.args}) : super(key: key);
  final MoveDetailsPageArgs args;

  @override
  Widget build(BuildContext context) {
    final elementName = args.model.type.name;
    return AppDetailsWidget(
      AppDetailsWidgetArgs(
        title: args.model.name,
        colors: AppColors.forElement(elementName).asLightGradient,
        description: args.model.description.trim().replaceAll(':', '\n'),
        image: AppRoundAssetImage(
          args.model.picturePath,
          AppColors.forElement(elementName),
        ),
        imagePadding: 0.1,
        subtitle: Center(
          child: SizedBox(
            width: 180,
            child: ElementRectChipWidget(elementName),
          ),
        ),
        bottom: _MoveDetailsBottomWidget(args),
      ),
    );
  }
}

class _MoveDetailsBottomWidget extends StatelessWidget {
  const _MoveDetailsBottomWidget(this.args, {Key? key}) : super(key: key);
  final MoveDetailsPageArgs args;

  @override
  Widget build(BuildContext context) {
    final _color = AppColors.forElement(args.model.type.name);
    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _MoveChipTileWidget(
            'Base Power',
            value: args.model.power.toString(),
            color: _color,
          ),
          Container(width: 1, color: AppColors.lightSeparator),
          _MoveChipTileWidget(
            'Accuracy',
            value: '${args.model.accuracy.toString()}%',
            color: _color,
          ),
          Container(width: 1, color: AppColors.lightSeparator),
          _MoveChipTileWidget(
            'PP',
            value: args.model.pp.toString(),
            color: _color,
          ),
        ],
      ),
    );
  }
}

class _MoveChipTileWidget extends StatelessWidget {
  const _MoveChipTileWidget(
    this.title, {
    required this.value,
    required this.color,
    Key? key,
  }) : super(key: key);

  final String title;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: color,
          ),
        ),
        SizedBox(
          height: 40,
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              color: AppColors.lightText,
            ),
          ),
        ),
      ],
    );
  }
}
