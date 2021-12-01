import 'package:cleandex_poketecture/pages/main.page.dart';
import 'package:cleandex_poketecture/pages/splash_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  const AppRoutes._();

  static const String initialRoute =
      MainPage.routeName; // TODO: back to SplashPage.routeName;

  static final Map<String, WidgetBuilder> routes = {
    SplashPage.routeName: (context) => const SplashPage(),
    MainPage.routeName: (context) => const MainPage(),
  };
}
