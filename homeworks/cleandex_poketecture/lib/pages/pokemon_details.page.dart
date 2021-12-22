import 'package:cleandex_poketecture/application/widgets/app_details.widget.dart';
import 'package:cleandex_poketecture/application/widgets/app_loading.widget.dart';
import 'package:cleandex_poketecture/application/widgets/app_round_chip.widget.dart';
import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:cleandex_poketecture/domain/pokemon/poke_type.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon.repository.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon_details.dart';
import 'package:cleandex_poketecture/pages/partials/pokemon/element_rect_chip.widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class PokemonDetailsPageArgs {
  final Pokemon model;
  final PokemonDetails modelDetails;

  const PokemonDetailsPageArgs({
    required this.model,
    required this.modelDetails,
  });
}

class PokemonDetailsPage extends StatelessWidget {
  static const routeName = '/pokemons';
  const PokemonDetailsPage({
    Key? key,
    required this.slug,
    required this.routeArgs,
  }) : super(key: key);

  final PokemonDetailsPageArgs? routeArgs;
  final String? slug;

  Future<PokemonDetailsPageArgs> _loadArgs(BuildContext context) async {
    if (routeArgs != null) {
      return routeArgs!;
    }

    final repository = GetIt.instance.get<PokemonRepository>();
    final model = await repository.findInfoByName(slug!);
    final modelDetails = await repository.findDetailsById(model.id);
    return PokemonDetailsPageArgs(model: model, modelDetails: modelDetails);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PokemonDetailsPageArgs>(
        future: _loadArgs(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return AppLoadingWidget.centered();
          }

          final args = snapshot.data!;
          return AppDetailsWidget(
            AppDetailsWidgetArgs(
                title: args.model.name,
                colors: _typeColor(args.model.types).asLightGradient,
                description: args.modelDetails.description.trim(),
                image: AppRoundNetworkImage(
                  args.model.bigPictureUrl,
                  containerSize: 180,
                ),
                imagePadding: 0.05,
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: args.model.types
                      .map((e) => ElementRectChipWidget(e.type.name))
                      .toList(),
                ),
                bottom: _PokeStatsWidget(args)),
          );
        });
  }
}

class _PokeStatsWidget extends StatelessWidget {
  const _PokeStatsWidget(this.args, {Key? key}) : super(key: key);

  final PokemonDetailsPageArgs args;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Column(
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              decoration: BoxDecoration(
                color: _typeColor(args.model.types),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Text(
                'STATS',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.elementChipText,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Column(
              children: args.model.stats
                  .map((e) =>
                      _PokeStatItemChipWidget(e, types: args.model.types))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}

class _PokeStatItemChipWidget extends StatelessWidget {
  const _PokeStatItemChipWidget(this.stat, {required this.types, Key? key})
      : super(key: key);

  final List<PokeType> types;
  final PokeStat stat;

  @override
  Widget build(BuildContext context) {
    final _color = _typeColor(types);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 15,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text(
              stat.fmtName,
              style: TextStyle(fontSize: 16, color: _color),
            ),
          ),
        ),
        Flexible(
          flex: 10,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text(
              stat.fmtValue,
              style: const TextStyle(fontSize: 16, color: AppColors.lightText),
            ),
          ),
        ),
        Flexible(
          flex: 50,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: LinearProgressIndicator(
              value: (stat.baseStat / 100),
              backgroundColor: AppColors.lightText,
              valueColor: AlwaysStoppedAnimation<Color>(_color),
            ),
          ),
        ),
      ],
    );
  }
}

Color _typeColor(List<PokeType> types) {
  return AppColors.forElement(types.first.type.name);
}
