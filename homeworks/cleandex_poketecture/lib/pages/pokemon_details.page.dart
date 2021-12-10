import 'package:cleandex_poketecture/application/widgets/app_round_chip.widget.dart';
import 'package:cleandex_poketecture/commons/app_colors.dart';
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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: AppColors.detailsPagePokeGradient,
          ),
        ),
        child: Column(
          children: [
            Flexible(
              flex: 12,
              child: _PokeDetailsTopWidget(widget.args),
            ),
            Expanded(
              flex: 33,
              child: _PokeDetailsBottomWidget(widget.args),
            ),
          ],
        ),
      ),
    );
  }
}

class _PokeDetailsTopWidget extends StatelessWidget {
  const _PokeDetailsTopWidget(
    this.args, {
    Key? key,
  }) : super(key: key);

  final PokemonDetailsPageArgs args;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Flexible(flex: 4, child: Container()),
            Expanded(
              child: Container(
                height: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.cardColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(48),
                    topRight: Radius.circular(48),
                  ),
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: AppRoundNetworkImage(args.model.bigPictureUrl),
          ),
        ),
      ],
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
      decoration: const BoxDecoration(color: AppColors.cardColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            flex: 1,
            child: Text(
              args.model.name,
              style: const TextStyle(fontSize: 36, color: AppColors.text),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: args.model.types
                  .map((e) => ElementRectChipWidget(e.type.name))
                  .toList(),
            ),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildDetailsFromText(args.modelDetails.description),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: const BoxDecoration(color: AppColors.cardColor),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildDetailsFromText(String text) {
  final _list = <Widget>[];
  final input = text.replaceAll(':', '\n').split('\n');
  for (final _line in input) {
    if (_line.isNotEmpty) {
      _list.add(FittedBox(
        child: Text(
          _line.trim(),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16, color: AppColors.lightText),
        ),
      ));
    } else {
      _list.add(const SizedBox(height: 4));
    }
  }
  return Column(
    children: _list,
  );
}
