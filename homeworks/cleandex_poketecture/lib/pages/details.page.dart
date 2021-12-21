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

  String get fmtDescription => description.trim().replaceAll(':', '\n');

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
        colors: AppColors.forElement(elementName).asLightGradient,
        title: title,
        subtitle: SizedBox(
          width: 180,
          child: ElementRectChipWidget(elementName),
        ),
        description: description,
        image:
            AppRoundAssetImage(picturePath, AppColors.forElement(elementName)),
      );

  factory DetailsPageArgs.item({
    required String pictureUrl,
    required String title,
    required String subtitle,
    required String description,
  }) =>
      DetailsPageArgs(
        colors: AppColors.itemDetails.asLightGradient,
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
                      child: _DetailsBottomWidget(widget.args),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.1,
              child: widget.args.image,
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

class _DetailsBottomWidget extends StatelessWidget {
  const _DetailsBottomWidget(
    this.args, {
    Key? key,
  }) : super(key: key);

  final DetailsPageArgs args;

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
                args.title,
                style: const TextStyle(fontSize: 36, color: AppColors.text),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              child: Center(child: args.subtitle),
            ),
            Text(
              args.fmtDescription,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: AppColors.lightText),
            ),
            Container(
              padding: const EdgeInsets.only(top: 32, bottom: 16),
              decoration: const BoxDecoration(color: AppColors.cardColor),
            ),
          ],
        ),
      ),
    );
  }
}
