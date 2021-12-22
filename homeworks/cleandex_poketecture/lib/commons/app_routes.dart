import 'package:cleandex_poketecture/pages/item_details.page.dart';
import 'package:cleandex_poketecture/pages/main.page.dart';
import 'package:cleandex_poketecture/pages/move_details.page.dart';
import 'package:cleandex_poketecture/pages/pokemon_details.page.dart';
import 'package:cleandex_poketecture/pages/splash.page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  const AppRoutes._();

  static const String initialRoute = SplashPage.routeName;
  static const String defaultRoute = MainPage.routeName;

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    final routeName = settings.name;

    if (routeName != null && routeName != defaultRoute) {
      // Handle simple urls ('/:name')
      if (_appRoutes.containsKey(routeName)) {
        return MaterialPageRoute(
            settings: settings,
            builder: (context) =>
                _appRoutes[routeName]!(context, settings, null));
      }

      // Handle urls with slugs ('/:name/:slug')
      final uri = Uri.parse(routeName);
      if (uri.pathSegments.length == 2) {
        final firstPathSegment = uri.pathSegments.first;
        final pathComplement = uri.pathSegments.last;

        final routeKey = '/$firstPathSegment';
        if (_appRoutes.containsKey(routeKey)) {
          return MaterialPageRoute(
              settings: settings,
              builder: (context) =>
                  _appRoutes[routeKey]!(context, settings, pathComplement));
        }
      }
    }

    // Missing or unrecognized route, redirecting to defaultRoute
    return MaterialPageRoute(
      maintainState: true,
      settings: settings.copyWith(name: defaultRoute),
      builder: (context) => _appRoutes[defaultRoute]!(context, settings, null),
    );
  }
}

typedef AppRouteBuilder = Widget Function(
    BuildContext context, RouteSettings settings, String? slug);

final Map<String, AppRouteBuilder> _appRoutes = {
  SplashPage.routeName: (context, settings, _) => const SplashPage(),
  MainPage.routeName: (context, settings, _) => const MainPage(),
  PokemonDetailsPage.routeName: (context, settings, slug) => PokemonDetailsPage(
        routeArgs: settings.arguments as PokemonDetailsPageArgs?,
        slug: slug,
      ),
  ItemDetailsPage.routeName: (context, settings, slug) => ItemDetailsPage(
        routeArgs: settings.arguments as ItemDetailsPageArgs?,
        slug: slug,
      ),
  MoveDetailsPage.routeName: (context, settings, slug) => MoveDetailsPage(
        routeArgs: settings.arguments as MoveDetailsPageArgs?,
        slug: slug,
      ),
};
