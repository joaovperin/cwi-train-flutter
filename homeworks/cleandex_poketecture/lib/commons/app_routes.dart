import 'package:cleandex_poketecture/pages/details.page.dart';
import 'package:cleandex_poketecture/pages/main.page.dart';
import 'package:cleandex_poketecture/pages/pokemon_details.page.dart';
import 'package:cleandex_poketecture/pages/splash.page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  const AppRoutes._();

  static const String initialRoute =
      MainPage.routeName; // TODO: back to SplashPage.routeName;

  static final Map<String, WidgetBuilder> routes = {
    SplashPage.routeName: (context) => const SplashPage(),
    MainPage.routeName: (context) => const MainPage(),
    DetailsPage.routeName: (context) => DetailsPage(
          args: ModalRoute.of(context)!.settings.arguments! as DetailsPageArgs,
        ),
    PokemonDetailsPage.routeName: (context) => PokemonDetailsPage(
          args: ModalRoute.of(context)!.settings.arguments!
              as PokemonDetailsPageArgs,
        ),
  };
}
