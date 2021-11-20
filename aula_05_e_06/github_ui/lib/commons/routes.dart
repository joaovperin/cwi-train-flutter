import 'package:flutter/material.dart';
import 'package:github_ui/pages/seach_user_page.dart';
import 'package:github_ui/pages/user_details_page.dart';

class AppRoutes {
  const AppRoutes._();

  static const String initialRoute = SearchUserPage.routeName;

  static final Map<String, WidgetBuilder> routes = {
    SearchUserPage.routeName: (context) => const SearchUserPage(),
    UserDetailsPage.routeName: (context) => UserDetailsPage(
          ModalRoute.of(context)!.settings.arguments! as UserDetailsPageArgs,
        ),
  };
}
