import 'package:cleandex_poketecture/application/widgets/app_square_image_box.widget.dart';
import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:flutter/material.dart';

const bgGradientColors = AppColors.detailsPageGradient;
const imageUrl =
    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png';

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
            colors: bgGradientColors,
          ),
        ),
        child: Column(
          children: [
            Flexible(
              flex: 10,
              child: Stack(
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
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 128,
                      height: 128,
                      child: SquareImageBoxWidget(imageUrl),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 31,
              child: Container(
                decoration: const BoxDecoration(color: AppColors.cardColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
