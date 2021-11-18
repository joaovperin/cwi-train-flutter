import 'package:exercicio_receitas/commons/app_colors.dart';
import 'package:exercicio_receitas/domain/food_model.dart';
import 'package:exercicio_receitas/domain/food_repository.dart';
import 'package:exercicio_receitas/pages/food_details_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodListPage extends StatefulWidget {
  static const routeName = '/foods';
  const FoodListPage({Key? key}) : super(key: key);

  @override
  State<FoodListPage> createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  static const List<FoodModel> foodModelList = FoodRepository.list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Delicious',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.regularBackground,
      ),
      body: Container(
        color: AppColors.regularBackground,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ListView.builder(
            itemCount: foodModelList.length,
            itemBuilder: (context, index) {
              final FoodModel foodModel = foodModelList[index];
              return _FoodItemView(food: foodModel, idx: index);
            },
          ),
        ),
      ),
    );
  }
}

class _FoodItemView extends StatelessWidget {
  const _FoodItemView({
    required this.food,
    Key? key,
    required this.idx,
  }) : super(key: key);

  final FoodModel food;
  final int idx;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _goToDetailsPage(context),
      child: Container(
        height: 160,
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        width: double.infinity,
        color: Colors.grey,
        child: Stack(
          children: [
            Hero(
              tag: 'food_details_animation_$idx',
              child: Image.asset(
                'assets/images/position_${idx + 1}_img.png',
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 6,
                        ),
                        child: Text(
                          food.category.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: food.textColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          _TextIconView(
                            Icons.favorite,
                            '${food.numberOfLikes}',
                          ),
                          _TextIconView(
                            Icons.wb_cloudy,
                            '${food.numberOfComments}',
                          ),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 110,
                    child: Text(
                      food.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _goToDetailsPage(BuildContext context) {
    Navigator.of(context).pushNamed(FoodDetailsPage.routeName,
        arguments: FoodDetailsPageArguments(food, index: idx));
  }
}

class _TextIconView extends StatelessWidget {
  const _TextIconView(
    this.icon,
    this.text, {
    Key? key,
  }) : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 4),
        Icon(
          icon,
          size: 16,
          color: Colors.white,
        )
      ],
    );
  }
}
