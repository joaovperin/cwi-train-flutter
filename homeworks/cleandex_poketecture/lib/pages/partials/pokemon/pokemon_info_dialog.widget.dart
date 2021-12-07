import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:cleandex_poketecture/commons/utils/list_utils.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon_details.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon.dart';
import 'package:cleandex_poketecture/pages/partials/pokemon/element_round_chip.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PokemonInfoDialog extends StatelessWidget {
  const PokemonInfoDialog(
    this.model,
    this.details, {
    Key? key,
  }) : super(key: key);

  final Pokemon model;
  final PokemonDetails details;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      title: SizedBox(
        height: 80,
        width: 420,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(model.pictureUrl, fit: BoxFit.fill),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name,
                  style: const TextStyle(
                    fontSize: 18,
                    color: AppColors.text,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  model.fmtId,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.fadedText,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...model.types
                      .map((e) => ElementRoundWidget(e.type.name))
                      .toList()
                ],
              ),
            ),
          ],
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        child: Wrap(
          spacing: 20,
          runSpacing: 8,
          children: [
            const Divider(),
            ...splitListInChunks(details.weaknesses, 3).map((list) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [...list.map((e) => _buildChip(e))],
              );
            }),
          ],
          // ),
        ),
      ),
    );
  }

  Widget _buildChip(PokeTypeWeakness weakness) {
    return SizedBox(
      width: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ElementRoundWidget(weakness.name),
          Center(
            child: Text(
              weakness.value,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.fadedText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
