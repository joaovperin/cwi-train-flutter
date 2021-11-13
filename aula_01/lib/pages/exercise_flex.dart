import 'package:flutter/material.dart';

class ExerciseFlexPage extends StatelessWidget {
  const ExerciseFlexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Expanded(child: Container(color: Colors.purple[300])),
              Expanded(child: Container(color: Colors.purple[500])),
              Expanded(child: Container(color: Colors.purple[700])),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Row(
            children: [
              Expanded(child: Container(color: Colors.red[100])),
              Expanded(child: Container(color: Colors.red[300])),
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Row(
            children: [
              Expanded(child: Container(color: Colors.green[200])),
              Expanded(child: Container(color: Colors.green[400])),
              Expanded(child: Container(color: Colors.green[600])),
              Expanded(child: Container(color: Colors.green[800])),
            ],
          ),
        ),
      ],
    );
  }
}
