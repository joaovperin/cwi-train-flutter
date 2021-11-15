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
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.amber, width: 1),
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
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.amber, width: 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _CalcButton.grey("AC"),
                          _CalcButton.grey("+/-"),
                          _CalcButton.grey("%"),
                          _CalcButton.amber("÷"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _CalcButton.darkGrey("7"),
                          _CalcButton.darkGrey("8"),
                          _CalcButton.darkGrey("9"),
                          _CalcButton.amber("×"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _CalcButton.darkGrey("4"),
                          _CalcButton.darkGrey("5"),
                          _CalcButton.darkGrey("6"),
                          _CalcButton.amber("-"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _CalcButton.darkGrey("1"),
                          _CalcButton.darkGrey("2"),
                          _CalcButton.darkGrey("3"),
                          _CalcButton.amber("+"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _CalcButton.darkGrey("0"),
                          _CalcButton.darkGrey("0"),
                          _CalcButton.darkGrey(","),
                          _CalcButton.amber("="),
                        ],
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class _CalcButton extends StatelessWidget {
  const _CalcButton._({
    Key? key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.onTap,
  }) : super(key: key);

  factory _CalcButton.grey(String text, {required OnTapFunc onTap}) =>
      _CalcButton._(
        backgroundColor: AppColors.lightGrey,
        textColor: AppColors.black,
        text: text,
        onTap: onTap,
      );

  factory _CalcButton.darkGrey(String text, {required OnTapFunc onTap}) =>
      _CalcButton._(
        backgroundColor: AppColors.darkGrey,
        textColor: AppColors.white,
        text: text,
        onTap: onTap,
      );

  factory _CalcButton.amber(String text, {required OnTapFunc onTap}) =>
      _CalcButton._(
        backgroundColor: AppColors.amber,
        textColor: AppColors.white,
        text: text,
        onTap: onTap,
      );

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.width * 0.2,
        width: MediaQuery.of(context).size.width * 0.2,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.amber, width: 1),
          color: backgroundColor,
          shape: BoxShape.circle,
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
