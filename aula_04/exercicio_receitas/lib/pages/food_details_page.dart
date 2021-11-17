import 'package:exercicio_receitas/commons/app_colors.dart';
import 'package:exercicio_receitas/domain/food_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodDetailsPageArguments {
  final FoodModel model;
  final int index;

  const FoodDetailsPageArguments(
    this.model, {
    required this.index,
  });
}

class FoodDetailsPage extends StatefulWidget {
  static const routeName = '/details';
  const FoodDetailsPage({
    Key? key,
    required this.args,
  }) : super(key: key);

  final FoodDetailsPageArguments args;

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final model = widget.args.model;
    return Scaffold(
      appBar: AppBar(
        title: Text('Receitas'),
      ),
      body: Container(
        height: double.infinity,
        alignment: Alignment.topCenter,
        color: AppColors.regularBackground,
        child: Column(
          children: [
            Hero(
              tag: 'food_details_animation_${widget.args.index}',
              child: Image.asset(
                'assets/images/position_${widget.args.index + 1}_img.png',
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            ),
            Text(
              model.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              'Author: John Smith',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 50),
            _IngredientItemView('oie'),
          ],
        ),
      ),
    );
  }
}

class _IngredientItemView extends StatefulWidget {
  const _IngredientItemView(
    this.ingredientName, {
    Key? key,
  }) : super(key: key);
  final String ingredientName;

  @override
  _IngredientItemViewState createState() => _IngredientItemViewState();
}

class _IngredientItemViewState extends State<_IngredientItemView> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 55,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.ingredientName,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          Checkbox(
            value: _checked,
            activeColor: Colors.white,
            checkColor: Colors.orange,
            onChanged: (value) {
              setState(() => _checked = value ?? false);
            },
          ),
        ],
      ),
    );
  }
}
