import 'package:exercicio_receitas/commons/app_colors.dart';
import 'package:exercicio_receitas/domain/food_model.dart';

class FoodRepository {
  const FoodRepository._();

  static const List<FoodModel> list = [
    FoodModel(
      name: 'Spinach & chicken Salad',
      category: FoodCategory.appetizer,
      numberOfComments: 21,
      numberOfLikes: 201,
      textColor: AppColors.position1TextColor,
    ),
    FoodModel(
      name: 'Crackers with salmon',
      category: FoodCategory.firstDish,
      numberOfComments: 19,
      numberOfLikes: 601,
      textColor: AppColors.position2TextColor,
    ),
    FoodModel(
      name: 'Chocolate cake',
      category: FoodCategory.dessert,
      numberOfComments: 121,
      numberOfLikes: 5400,
      textColor: AppColors.position3TextColor,
    ),
  ];
}
