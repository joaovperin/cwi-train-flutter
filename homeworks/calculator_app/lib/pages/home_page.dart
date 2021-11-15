import 'package:calculator_app/commons/app_colors.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

typedef CalcOperator = num Function(num, num);
typedef OnTapFunc = void Function();

class _CalculatorPageState extends State<CalculatorPage> {
  String result = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
        backgroundColor: AppColors.black,
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        color: AppColors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(right: 8.0),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.white,
                    width: 1.0,
                  ),
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    result,
                    style: const TextStyle(
                      fontSize: 80,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _RoundButton.grey("AC", onTap: () {}),
                      _RoundButton.grey("+/-", onTap: () {}),
                      _RoundButton.grey("%", onTap: () {}),
                      _RoundButton.amber("÷", onTap: () {}),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _RoundButton.darkGrey("7", onTap: () {}),
                      _RoundButton.darkGrey("8", onTap: () {}),
                      _RoundButton.darkGrey("9", onTap: () {}),
                      _RoundButton.amber("×", onTap: () {}),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _RoundButton.darkGrey("4", onTap: () {}),
                      _RoundButton.darkGrey("5", onTap: () {}),
                      _RoundButton.darkGrey("6", onTap: () {}),
                      _RoundButton.amber("-", onTap: () {}),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _RoundButton.darkGrey("1", onTap: () {}),
                      _RoundButton.darkGrey("2", onTap: () {}),
                      _RoundButton.darkGrey("3", onTap: () {}),
                      _RoundButton.amber("+", onTap: () {}),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _RoundButton.darkGrey("0",
                          onTap: () {}, widthMultiplier: 0.4),
                      _RoundButton.darkGrey(",", onTap: () {}),
                      _RoundButton.amber("=", onTap: () {}),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _RoundButton extends StatelessWidget {
  const _RoundButton._({
    Key? key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.onTap,
    this.widthMultiplier = 0.2,
    this.heigthMultiplier = 0.2,
  }) : super(key: key);

  factory _RoundButton.grey(String text, {required OnTapFunc onTap}) =>
      _RoundButton._(
        backgroundColor: AppColors.lightGrey,
        textColor: AppColors.black,
        text: text,
        onTap: onTap,
      );

  factory _RoundButton.darkGrey(
    String text, {
    required OnTapFunc onTap,
    num widthMultiplier = 0.2,
  }) =>
      _RoundButton._(
        backgroundColor: AppColors.darkGrey,
        textColor: AppColors.white,
        text: text,
        onTap: onTap,
        widthMultiplier: widthMultiplier,
      );

  factory _RoundButton.amber(String text, {required OnTapFunc onTap}) =>
      _RoundButton._(
        backgroundColor: AppColors.amber,
        textColor: AppColors.white,
        text: text,
        onTap: onTap,
      );

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final OnTapFunc onTap;
  final num heigthMultiplier;
  final num widthMultiplier;

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: _width * heigthMultiplier,
        width: _width * widthMultiplier,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(_width * 0.1),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
