import 'package:cleandex_poketecture/pages/list_page.dart';
import 'package:cleandex_poketecture/pages/splash_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  const AppRoutes._();

  static const String initialRoute = SplashPage.routeName;

  static final Map<String, WidgetBuilder> routes = {
    SplashPage.routeName: (context) => const SplashPage(),
    ListPage.routeName: (context) => const ListPage(),
  };
}
