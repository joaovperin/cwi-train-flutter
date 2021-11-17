import 'package:exercicio_receitas/commons/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodListPage extends StatefulWidget {
  static const routeName = '/foods';
  const FoodListPage({Key? key}) : super(key: key);

  @override
  State<FoodListPage> createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Receitas'),
          backgroundColor: AppColors.regularBackground),
      body: Container(
        color: AppColors.regularBackground,
        child: Center(
          child: CupertinoButton(
            child: const Text(
              'Go to second page',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            onPressed: _onPressedButton,
          ),
        ),
      ),
    );
  }

  void _onPressedButton() {
    Navigator.pushNamed(context, '/second');
  }
}
