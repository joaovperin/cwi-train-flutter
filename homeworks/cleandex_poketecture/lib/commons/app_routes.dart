import 'package:cleandex_poketecture/pages/item_details.page.dart';
import 'package:cleandex_poketecture/pages/main.page.dart';
import 'package:cleandex_poketecture/pages/move_details.page.dart';
import 'package:cleandex_poketecture/pages/pokemon_details.page.dart';
import 'package:cleandex_poketecture/pages/splash.page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  const AppRoutes._();

  static const String initialRoute = SplashPage.routeName;

  static final Map<String, WidgetBuilder> routes = {
    SplashPage.routeName: (context) => const SplashPage(),
    MainPage.routeName: (context) => const MainPage(),
    PokemonDetailsPage.routeName: (context) => PokemonDetailsPage(
          args: ModalRoute.of(context)!.settings.arguments!
              as PokemonDetailsPageArgs,
        ),
    ItemDetailsPage.routeName: (context) => ItemDetailsPage(
          args: ModalRoute.of(context)!.settings.arguments!
              as ItemDetailsPageArgs,
        ),
    MoveDetailsPage.routeName: (context) => MoveDetailsPage(
          args: ModalRoute.of(context)!.settings.arguments!
              as MoveDetailsPageArgs,
        ),
  };
}
