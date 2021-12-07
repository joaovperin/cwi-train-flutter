import 'package:cleandex_poketecture/application/widgets/app_round_chip.widget.dart';
import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailsPageArgs {
  final Widget image;
  final List<Color> colors;
  final String title;
  final String subtitle;
  final String description;

  const DetailsPageArgs({
    required this.image,
    required this.colors,
    required this.title,
    required this.subtitle,
    required this.description,
  });

  factory DetailsPageArgs.mockItem() => const DetailsPageArgs(
        colors: AppColors.detailsPageItemsGradient,
        title: 'Ultra Ball',
        subtitle: '1200 ¥',
        description: '''Used in Battle\n
Attempts to catch a wild Pokémon, using a catch rate of 2x.
If used in a trainer battle, nothing happens and the ball is lost.''',
        image: AppRoundNetworkImage(
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/ultra-ball.png'),
      );

  factory DetailsPageArgs.mockMove() => const DetailsPageArgs(
        colors: AppColors.detailsPagePokeGradient,
        title: 'Bubble',
        subtitle: 'WATER',
        description: '''Inflicts regular damage. Has a 10% chance to
lower the target's Speed by one stage.''',
        image: AppRoundNetworkImage(
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/ultra-ball.png'),
      );

  factory DetailsPageArgs.move({
    required String picturePath,
    required String title,
    required String subtitle,
    required String description,
  }) =>
      DetailsPageArgs(
        colors: AppColors.detailsPagePokeGradient,
        title: title,
        subtitle: subtitle,
        description: description,
        image: AppRoundAssetImage(picturePath, AppColors.dragon),
      );
}

class DetailsPage extends StatefulWidget {
  static const routeName = '/details';
  const DetailsPage({Key? key, required this.args}) : super(key: key);
  final DetailsPageArgs args;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
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
            colors: widget.args.colors,
          ),
        ),
        child: Column(
          children: [
            Flexible(
              flex: 12,
              child: DetailsTopWidget(widget.args),
            ),
            Expanded(
              flex: 33,
              child: DetailsBottomWidget(widget.args),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsTopWidget extends StatelessWidget {
  const DetailsTopWidget(
    this.args, {
    Key? key,
  }) : super(key: key);

  final DetailsPageArgs args;

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
            child: args.image,
          ),
          // child: SquareImageBoxWidget(imageUrl),
        ),
      ],
    );
  }
}

class DetailsBottomWidget extends StatelessWidget {
  const DetailsBottomWidget(
    this.args, {
    Key? key,
  }) : super(key: key);

  final DetailsPageArgs args;

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
              args.title,
              style: const TextStyle(fontSize: 36, color: AppColors.text),
            ),
          ),
          Flexible(
            flex: 1,
            child: Text(
              args.subtitle,
              style: const TextStyle(fontSize: 20, color: AppColors.lightText),
            ),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: _buildDetailsFromText(args.description),
              ),
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

List<Widget> _buildDetailsFromText(String text) {
  final _list = <Widget>[];
  for (final _line in text.split('\n')) {
    if (_line.isEmpty) {
      _list.add(const SizedBox(height: 32));
      continue;
    }
    _list.add(Text(
      _line,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 16, color: AppColors.lightText),
    ));
  }
  return _list;
}
