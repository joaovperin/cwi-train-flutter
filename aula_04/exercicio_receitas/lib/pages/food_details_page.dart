import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodDetailsPage extends StatefulWidget {
  static const routeName = '/details';
  const FoodDetailsPage({Key? key}) : super(key: key);

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receitas'),
      ),
      body: Container(
        color: Colors.blue,
      ),
    );
  }
}
