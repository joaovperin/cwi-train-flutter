import 'dart:math';

class Person {
  final String name;
  final int age;
  final num weight;
  final num height;

  const Person({
    required this.name,
    required this.age,
    required this.weight,
    required this.height,
  });

  String get description {
    return '$name is $age years old, weighs ${weight}kg and is ${height}m tall';
  }

  double get imc {
    if (height <= 0) throw Exception('Height cannot be 0');
    if (weight <= 0) throw Exception('Weight cannot be 0');
    final result = weight * 100 / pow(height, 2);
    return result.roundToDouble() / 100;
  }

  bool get isOlderAge {
    return age > 18;
  }
}
