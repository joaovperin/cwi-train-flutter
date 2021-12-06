import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppRoundChipWidget extends StatelessWidget {
  const AppRoundChipWidget(
    this.picturePath, {
    required this.color,
    Key? key,
    this.semanticsLabel,
  }) : super(key: key);

  final Color color;
  final String picturePath;
  final String? semanticsLabel;
  final double containerSize = 36;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerSize,
      height: containerSize,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        picturePath,
        semanticsLabel: semanticsLabel,
      ),
    );
  }
}

class AppRoundAssetImage extends StatelessWidget {
  const AppRoundAssetImage(this.path, this.color, {Key? key}) : super(key: key);

  final String path;
  final Color color;
  final double containerSize = 128;
  final double imageSize = 64;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerSize,
      height: containerSize,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        boxShadow: const [
          BoxShadow(
            color: AppColors.containerShadow,
            blurRadius: 6,
            offset: Offset(0, -2),
          ),
        ],
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        path,
        fit: BoxFit.fill,
        width: imageSize,
        height: imageSize,
        color: AppColors.container,
      ),
    );
  }
}

class AppRoundNetworkImage extends StatelessWidget {
  const AppRoundNetworkImage(this.url, {Key? key}) : super(key: key);

  final String url;
  final double containerSize = 128;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerSize,
      height: containerSize,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
