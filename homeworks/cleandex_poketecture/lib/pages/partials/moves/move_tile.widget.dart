import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:cleandex_poketecture/commons/interfaces.dart';
import 'package:cleandex_poketecture/domain/move/move.dart';
import 'package:cleandex_poketecture/pages/partials/pokemon/element_round_chip.widget.dart';
import 'package:flutter/material.dart';

class MoveTileWidget extends StatelessWidget {
  const MoveTileWidget({
    Key? key,
    required this.model,
    required this.onTap,
  }) : super(key: key);

  final Move model;
  final OnTapFn<Move> onTap;

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
              Text(model.name),
              const Spacer(),
              ElementRoundWidget(model.type.name),
            ],
          ),
        ),
      ),
    );
  }
}
