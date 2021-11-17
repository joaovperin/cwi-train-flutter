import 'package:exercicio_receitas/commons/app_colors.dart';
import 'package:exercicio_receitas/domain/food_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodListPage extends StatefulWidget {
  static const routeName = '/foods';
  const FoodListPage({Key? key}) : super(key: key);

  @override
  State<FoodListPage> createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  static const List<FoodModel> foodModelList = [
    FoodModel(
      name: 'Spinach & chicken Salad',
      category: FoodCategory.appetizer,
      numberOfComments: 21,
      numberOfLikes: 201,
      image: 'position_1_img.png',
      textColor: AppColors.position1TextColor,
    ),
    FoodModel(
      name: 'Crackers with salmon',
      category: FoodCategory.firstDish,
      numberOfComments: 19,
      numberOfLikes: 601,
      image: 'position_2_img.png',
      textColor: AppColors.position2TextColor,
    ),
    FoodModel(
      name: 'Chocolate cake',
      category: FoodCategory.dessert,
      numberOfComments: 121,
      numberOfLikes: 5400,
      image: 'position_3_img.png',
      textColor: AppColors.position3TextColor,
    ),
  ];

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
              return _FoodItemView(
                food: foodModel,
              );
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
  }) : super(key: key);

  final FoodModel food;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: double.infinity,
      color: Colors.grey,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/${food.image}',
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          Container(
            padding: const EdgeInsets.all(12),
            // color: Colors.black.withOpacity(0.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
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
                    Text(
                      food.name,
                      style: TextStyle(color: Colors.white, fontSize: 23),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.favorite_border),
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
