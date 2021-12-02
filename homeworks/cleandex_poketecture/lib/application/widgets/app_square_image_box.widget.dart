import 'package:cached_network_image/cached_network_image.dart';
import 'package:cleandex_poketecture/application/widgets/app_loading.widget.dart';
import 'package:flutter/material.dart';

class SquareImageBoxWidget extends StatelessWidget {
  const SquareImageBoxWidget(this.imageUrl, {Key? key}) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64,
      height: 64,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => AppLoadingWidget.centered(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
