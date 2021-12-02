import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:flutter/material.dart';

const _bgGradientColorsPoke = AppColors.detailsPagePokeGradient;
const _bgGradientColorsItems = AppColors.detailsPageItemsGradient;
const _imageUrlPoke =
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png';
const _imageUrlItem =
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/ultra-ball.png';

class DetailsPage extends StatefulWidget {
  static const routeName = '/details';
  const DetailsPage({Key? key}) : super(key: key);

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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            // colors: _bgGradientColorsPoke,
            colors: _bgGradientColorsItems,
          ),
        ),
        child: Column(
          children: const [
            Flexible(
              flex: 10,
              // child: DetailsTopWidget(_imageUrlPoke),
              child: DetailsTopWidget(_imageUrlItem),
            ),
            Expanded(
              flex: 31,
              child: DetailsBottomWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsTopWidget extends StatelessWidget {
  const DetailsTopWidget(
    this.imageUrl, {
    Key? key,
  }) : super(key: key);

  final String imageUrl;

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
                image: NetworkImage(imageUrl),
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

class DetailsInfoTitle extends StatelessWidget {
  const DetailsInfoTitle(
    this.title, {
    required this.size,
    Key? key,
  }) : super(key: key);

  final String title;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: size,
        // fontWeight: FontWeight.bold,
        color: AppColors.text,
      ),
    );
  }
}

// class DetailsPageArgs {
//   // final String imageUrl;
//   final Widget title;
//   final Widget subtitle;
//   final TextSpan description;
//   final Widget? child;
// }

// var _myArgs = DEt

class DetailsBottomWidget extends StatelessWidget {
  const DetailsBottomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.cardColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Flexible(
            flex: 1,
            child: Text(
              'Ultra Ball',
              style: TextStyle(fontSize: 36, color: AppColors.text),
            ),
          ),
          const Flexible(
            flex: 1,
            child: Text(
              '1200 ¥',
              style: TextStyle(fontSize: 20, color: AppColors.lightText),
            ),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: const [
                  Text(
                    'Used in Battle',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: AppColors.lightText),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Attempts to catch a wild Pokémon, using a catch rate of 2x.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: AppColors.lightText),
                  ),
                  Text(
                    'If used in a trainer battle, nothing happens and the ball is lost.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: AppColors.lightText),
                  ),
                ],
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
