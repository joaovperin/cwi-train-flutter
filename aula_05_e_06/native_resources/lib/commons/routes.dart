import 'package:flutter/material.dart';
import 'package:native_resources/pages/camera_page.dart';
import 'package:native_resources/pages/home_page.dart';
import 'package:native_resources/pages/location_page.dart';

class AppRoutes {
  const AppRoutes._();

  // static const String initialRoute = SearchUserPage.routeName;
  static const String initialRoute = HomePage.routeName;

  static final Map<String, WidgetBuilder> routes = {
    HomePage.routeName: (context) => const HomePage(),
    CameraPage.routeName: (context) => const CameraPage(),
    LocationPage.routeName: (context) => const LocationPage(),
  };
}
