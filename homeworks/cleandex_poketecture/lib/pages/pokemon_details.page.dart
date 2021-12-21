import 'package:cleandex_poketecture/application/widgets/app_round_chip.widget.dart';
import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:cleandex_poketecture/domain/pokemon/poke_type.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon.dart';
import 'package:cleandex_poketecture/domain/pokemon/pokemon_details.dart';
import 'package:cleandex_poketecture/pages/partials/pokemon/element_rect_chip.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PokemonDetailsPageArgs {
  final Pokemon model;
  final PokemonDetails modelDetails;

  const PokemonDetailsPageArgs({
    required this.model,
    required this.modelDetails,
  });
}

class PokemonDetailsPage extends StatefulWidget {
  static const routeName = '/poke-details';
  const PokemonDetailsPage({Key? key, required this.args}) : super(key: key);
  final PokemonDetailsPageArgs args;

  @override
  State<PokemonDetailsPage> createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: AppColors.statusBar,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: _typeColor(widget.args.model.types).asLightGradient,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Flexible(flex: 1, child: Container()),
                Flexible(
                  flex: 4,
                  child: _TopRoundMarginCt(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 48.0,
                        left: 16.0,
                        right: 16.0,
                      ),
                      child: _PokeDetailsBottomWidget(widget.args),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.1,
              child: AppRoundNetworkImage(widget.args.model.bigPictureUrl),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopRoundMarginCt extends StatelessWidget {
  const _TopRoundMarginCt({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(48),
          topRight: Radius.circular(48),
        ),
      ),
      child: child,
    );
  }
}

class _PokeDetailsBottomWidget extends StatelessWidget {
  const _PokeDetailsBottomWidget(
    this.args, {
    Key? key,
  }) : super(key: key);

  final PokemonDetailsPageArgs args;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(color: AppColors.cardColor),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: Text(
                args.model.name,
                style: const TextStyle(fontSize: 36, color: AppColors.text),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: args.model.types
                    .map((e) => ElementRectChipWidget(e.type.name))
                    .toList(),
              ),
            ),
            Text(
              args.modelDetails.description.trim(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: AppColors.lightText),
            ),
            Container(
              padding: const EdgeInsets.only(top: 32, bottom: 16),
              decoration: const BoxDecoration(color: AppColors.cardColor),
              child: _PokeStatsWidget(args),
            ),
          ],
        ),
      ),
    );
  }
}

class _PokeStatsWidget extends StatelessWidget {
  const _PokeStatsWidget(this.args, {Key? key}) : super(key: key);

  final PokemonDetailsPageArgs args;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                .map((e) => _PokeStatWidget(e, types: args.model.types))
                .toList(),
          ),
        )
      ],
    );
  }
}

class _PokeStatWidget extends StatelessWidget {
  const _PokeStatWidget(this.stat, {required this.types, Key? key})
      : super(key: key);

  final List<PokeType> types;
  final PokeStat stat;

  @override
  Widget build(BuildContext context) {
    final _color = _typeColor(types);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.15,
          child: Text(
            stat.fmtName,
            style: TextStyle(
              fontSize: 16,
              color: _color,
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.1,
          child: Text(
            stat.fmtValue,
            style: const TextStyle(fontSize: 16, color: AppColors.lightText),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: LinearProgressIndicator(
            value: (stat.baseStat / 100),
            backgroundColor: AppColors.lightText,
            valueColor: AlwaysStoppedAnimation<Color>(_color),
          ),
        ),
      ],
    );
  }
}

Color _typeColor(List<PokeType> types) {
  return AppColors.forElement(types.first.type.name);
}
