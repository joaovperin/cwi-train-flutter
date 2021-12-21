import 'package:cleandex_poketecture/application/widgets/app_round_chip.widget.dart';
import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:cleandex_poketecture/pages/partials/pokemon/element_rect_chip.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailsPageArgs {
  final Widget image;
  final List<Color> colors;
  final String title;
  final Widget subtitle;
  final String description;

  const DetailsPageArgs({
    required this.image,
    required this.colors,
    required this.title,
    required this.subtitle,
    required this.description,
  });

  factory DetailsPageArgs.move({
    required String picturePath,
    required String title,
    required String elementName,
    required String description,
  }) =>
      DetailsPageArgs(
        colors: AppColors.detailsPageItemsGradient,
        title: title,
        subtitle: SizedBox(
          width: 180,
          child: ElementRectChipWidget(elementName),
        ),
        description: description,
        image: AppRoundAssetImage(picturePath, AppColors.dragon),
      );

  factory DetailsPageArgs.item({
    required String pictureUrl,
    required String title,
    required String subtitle,
    required String description,
  }) =>
      DetailsPageArgs(
        colors: AppColors.detailsPageItemsGradient,
        title: title,
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 20, color: AppColors.lightText),
        ),
        description: description,
        image: AppRoundNetworkImage(pictureUrl),
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
              child: _DetailsTopWidget(widget.args),
            ),
            Expanded(
              flex: 33,
              child: _DetailsBottomWidget(widget.args),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailsTopWidget extends StatelessWidget {
  const _DetailsTopWidget(
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

class _DetailsBottomWidget extends StatelessWidget {
  const _DetailsBottomWidget(
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
          Flexible(flex: 1, child: args.subtitle),
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildDetailsFromText(args.description),
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
