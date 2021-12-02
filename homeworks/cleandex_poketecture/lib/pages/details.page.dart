import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:flutter/material.dart';

class DetailsPageArgs {
  final String imageUrl;
  final List<Color> colors;
  final String title;
  final String subtitle;
  final String description;

  const DetailsPageArgs({
    required this.imageUrl,
    required this.colors,
    required this.title,
    required this.subtitle,
    required this.description,
  });

  factory DetailsPageArgs.mockItem() => const DetailsPageArgs(
        imageUrl:
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/ultra-ball.png',
        colors: AppColors.detailsPageItemsGradient,
        title: 'Ultra Ball',
        subtitle: '1200 ¥',
        description: '''Used in Battle\n
Attempts to catch a wild Pokémon, using a catch rate of 2x.
If used in a trainer battle, nothing happens and the ball is lost.''',
      );

  factory DetailsPageArgs.mockMove() => const DetailsPageArgs(
        imageUrl:
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/ultra-ball.png',
        colors: AppColors.detailsPagePokeGradient,
        title: 'Bubble',
        subtitle: 'WATER',
        description: '''Inflicts regular damage. Has a 10% chance to
lower the target's Speed by one stage.''',
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
              flex: 10,
              child: DetailsTopWidget(widget.args),
            ),
            Expanded(
              flex: 31,
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
            Flexible(
              child: Container(
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
          child: Container(
            width: 128,
            height: 128,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(args.imageUrl),
                fit: BoxFit.fill,
              ),
            ),
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
