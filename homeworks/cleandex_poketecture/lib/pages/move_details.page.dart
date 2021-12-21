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
            args.model.picturePath, AppColors.forElement(elementName)),
        subtitle: Center(
          child: SizedBox(
            width: 180,
            child: ElementRectChipWidget(elementName),
          ),
        ),
      ),
    );
  }
}
