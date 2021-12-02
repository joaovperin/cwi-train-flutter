import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:cleandex_poketecture/commons/interfaces.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon_info.dart';
import 'package:cleandex_poketecture/pages/partials/pokemon/element_round_chip.widget.dart';
import 'package:cleandex_poketecture/application/widgets/app_square_image_box.widget.dart';
import 'package:flutter/material.dart';

class PokemonTileWidget extends StatelessWidget {
  const PokemonTileWidget({
    Key? key,
    required this.model,
    required this.onDoubleTap,
  }) : super(key: key);

  final PokemonInfo model;
  final OnTapFn<PokemonInfo> onDoubleTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.listTileBg,
      child: InkWell(
        splashColor: AppColors.splash,
        onDoubleTap: () => onDoubleTap.call(model),
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(model.name),
              const Spacer(),
              ...model.types
                  .map((e) => ElementRoundWidget(e.type.name))
                  .toList(),
            ],
          ),
          subtitle: Text(model.fmtId),
          leading: SquareImageBoxWidget(model.pictureUrl),
        ),
      ),
    );
  }
}
