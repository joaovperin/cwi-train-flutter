import 'package:exercicio_receitas/pages/food_details_page.dart';
import 'package:exercicio_receitas/pages/food_list_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: FoodListPage.routeName,
      routes: {
        FoodListPage.routeName: (context) => const FoodListPage(),
        FoodDetailsPage.routeName: (context) => FoodDetailsPage(
              args: ModalRoute.of(context)?.settings.arguments
                  as FoodDetailsPageArguments,
            ),
      },
    );
  }
}
