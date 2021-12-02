import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  static const routeName = '/details';
  const DetailsPage({Key? key}) : super(key: key);

  final bgGradientColors = AppColors.detailsPageGradient;

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
            colors: widget.bgGradientColors,
          ),
        ),
        child: Column(
          children: [
            const Spacer(),
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(48),
                  topRight: Radius.circular(48),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
