import 'package:cached_network_image/cached_network_image.dart';
import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:cleandex_poketecture/commons/interfaces.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              ...model.types.map((e) {
                final type = e.type.name;
                return Container(
                  width: 36,
                  height: 36,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.element[type] ?? AppColors.unknown,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/elements/$type.svg',
                    semanticsLabel: type,
                  ),
                );
              }).toList(),
            ],
          ),
          subtitle: Text(model.fmtId),
          leading: SizedBox(
            width: 64,
            height: 64,
            child: CachedNetworkImage(
              imageUrl: model.pictureUrl,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
      ),
    );
  }
}
