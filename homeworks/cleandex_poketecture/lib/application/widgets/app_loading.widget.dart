import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget._({required this.centered, Key? key})
      : super(key: key);

  factory AppLoadingWidget.centered() =>
      const AppLoadingWidget._(centered: true);

  final bool centered;

  @override
  Widget build(BuildContext context) {
    if (centered) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return const CircularProgressIndicator();
  }
}
