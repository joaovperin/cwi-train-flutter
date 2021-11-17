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
        centerTitle: true,
        title: const Text(
          'Delicious',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        backgroundColor: AppColors.regularBackground,
      ),
      body: Container(
        color: AppColors.regularBackground,
        child: Center(
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
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 120,
                        height: 25,
                        child: Center(
                          child: Text(
                            food.category.name,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: food.textColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    food.name,
                    style: TextStyle(color: Colors.white, fontSize: 23),
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



                      // Column(
                      //   children: [
                      //     IconButton(
                      //       icon: const Icon(
                      //         Icons.favorite,
                      //         color: Colors.white,
                      //         size: 24,
                      //       ),
                      //       onPressed: () {},
                      //     ),
                      //     IconButton(
                      //       icon: const Icon(
                      //         Icons.comment,
                      //         color: Colors.white,
                      //         size: 24,
                      //       ),
                      //       onPressed: () {},
                      //     ),
                      //   ],
                      // )