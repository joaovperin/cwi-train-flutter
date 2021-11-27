import 'dart:math';

import 'package:flutter/material.dart';

class ColorsRepository {
  const ColorsRepository._();

  static const instance = ColorsRepository._();

  Color getRandomColor() {
    final list = findAll();
    return list[Random().nextInt(list.length)];
  }

  List<Color> findAll() {
    return [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.amber,
      Colors.black,
      Colors.brown,
      Colors.cyan,
      Colors.deepOrange,
      Colors.deepPurple,
      Colors.grey,
      Colors.indigo,
      Colors.lightBlue,
      Colors.lime,
      Colors.orange,
      Colors.pink,
      Colors.purple,
      Colors.indigoAccent,
      Colors.blueGrey,
      Colors.teal,
      Colors.lightGreen,
      Colors.yellow,
      Colors.lightBlue,
      Colors.lightBlueAccent,
      Colors.blueAccent,
    ];
  }
}
