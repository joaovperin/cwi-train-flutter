import 'package:cleandex_poketecture/application/widgets/app_square_image_box.widget.dart';
import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:cleandex_poketecture/commons/interfaces.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon.dart';
import 'package:cleandex_poketecture/pages/partials/pokemon/element_round_chip.widget.dart';
import 'package:flutter/material.dart';

class PokemonTileWidget extends StatelessWidget {
  const PokemonTileWidget(
    this.model, {
    Key? key,
    required this.onSingleTap,
    required this.onDoubleTap,
  }) : super(key: key);

  final Pokemon model;
  final OnTapFn<Pokemon> onSingleTap;
  final OnTapFn<Pokemon> onDoubleTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.listTileBg,
      child: InkWell(
        splashColor: AppColors.splash,
        onTap: () => onSingleTap.call(model),
        onDoubleTap: () => onDoubleTap.call(model),
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                model.name,
                style: const TextStyle(fontSize: 20),
              ),
              const Spacer(),
              ...model.types
                  .map((e) => ElementRoundWidget(e.type.name))
                  .toList(),
            ],
          ),
          subtitle: Text(
            model.fmtId,
            style: const TextStyle(fontSize: 16),
          ),
          leading: SquareImageBoxWidget(model.thumbnailPictureUrl),
        ),
      ),
    );
  }
}
