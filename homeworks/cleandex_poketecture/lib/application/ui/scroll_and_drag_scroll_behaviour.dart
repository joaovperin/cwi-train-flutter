import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ScrollAndDragScrollBehavior extends MaterialScrollBehavior {
  const ScrollAndDragScrollBehavior() : super();

  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
