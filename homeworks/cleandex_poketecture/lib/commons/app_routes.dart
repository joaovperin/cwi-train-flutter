import 'package:cleandex_poketecture/pages/list_page_no_app_bar.dart';
import 'package:cleandex_poketecture/pages/list_page_with_flutter_app_bar.dart';
import 'package:cleandex_poketecture/pages/splash_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  const AppRoutes._();

  static const String initialRoute =
      ListPageNoAppBar.routeName; // TODO: back to SplashPage.routeName;

  static final Map<String, WidgetBuilder> routes = {
    SplashPage.routeName: (context) => const SplashPage(),
    ListPageWithFlutterAppBar.routeName: (context) =>
        const ListPageWithFlutterAppBar(),
    ListPageNoAppBar.routeName: (context) => const ListPageNoAppBar(),
  };
}
