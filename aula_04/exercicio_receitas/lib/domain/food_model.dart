import 'package:flutter/widgets.dart';

class FoodCategory {
  const FoodCategory._(this.name);

  static const appetizer = FoodCategory._('Appetizer');
  static const firstDish = FoodCategory._('First Dish');
  static const dessert = FoodCategory._('Dessert');

  final String name;
}

class FoodModel {
  final String name;
  final FoodCategory category;
  final num numberOfLikes;
  final num numberOfComments;
  final String image;

  final Color textColor;

  const FoodModel({
    required this.name,
    required this.category,
    required this.numberOfLikes,
    required this.numberOfComments,
    required this.image,
    required this.textColor,
  });
}
