import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:cleandex_poketecture/commons/interfaces.dart';
import 'package:cleandex_poketecture/domain/move/move_info.dart';
import 'package:flutter/material.dart';

class MoveTileWidget extends StatelessWidget {
  const MoveTileWidget({
    Key? key,
    required this.model,
    required this.onDoubleTap,
  }) : super(key: key);

  final MoveInfo model;
  final OnTapFn<MoveInfo> onDoubleTap;

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
        ),
      ),
    );
  }
}
