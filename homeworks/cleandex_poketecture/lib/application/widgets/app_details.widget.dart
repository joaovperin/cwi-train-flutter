import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppDetailsWidgetArgs {
  final Widget image;
  final List<Color> colors;
  final String title;
  final Widget subtitle;
  final String description;
  final Widget? bottom;
  final double imagePadding;

  const AppDetailsWidgetArgs({
    required this.image,
    required this.imagePadding,
    required this.colors,
    required this.title,
    required this.subtitle,
    required this.description,
    this.bottom,
  });
}

class AppDetailsWidget extends StatelessWidget {
  const AppDetailsWidget(this.args, {Key? key}) : super(key: key);
  final AppDetailsWidgetArgs args;

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
            colors: args.colors,
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
                      child: _DetailsBottomWidget(args),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * args.imagePadding,
              child: args.image,
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

  final AppDetailsWidgetArgs args;

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
              child: args.subtitle,
            ),
            Text(
              args.description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: AppColors.lightText),
            ),
            Container(
              padding: const EdgeInsets.only(top: 32, bottom: 16),
              decoration: const BoxDecoration(color: AppColors.cardColor),
              child: args.bottom,
            ),
          ],
        ),
      ),
    );
  }
}
