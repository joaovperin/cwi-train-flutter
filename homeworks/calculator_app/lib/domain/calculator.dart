import 'dart:async';

import 'package:calculator_app/domain/expression_evaluator.dart';

class Calculator {
  String _result;
  final _controller = StreamController<String>.broadcast();

  Stream<String> get result => _controller.stream;

  Calculator() : _result = "0";

  void btAc() {
    _controller.add(_result = "0");
  }

  void btNumber(num number) {
    if (_result == "0") {
      _controller.add(_result = number.toString());
    } else {
      _controller.add(_result += number.toString());
    }
  }

  void btPlusMinus() {
    _controller.add(
      _result = (_result.startsWith("-") ? _result.substring(1) : "-$_result"),
    );
  }

  void btPercent() {
    _controller.add(
      _result = (_result == "0" ? "0" : (_result + "%")),
    );
  }

  void btDivide() {
    _controller.add(
      _result = (_result == "0" ? "0" : (_result + "/")),
    );
  }

  void btMultiply() {
    _controller.add(
      _result = (_result == "0" ? "0" : (_result + "*")),
    );
  }

  void btMinus() {
    _controller.add(
      _result = (_result == "0" ? "0" : (_result + "-")),
    );
  }

  void btPlus() {
    _controller.add(
      _result = (_result == "0" ? "0" : (_result + "+")),
    );
  }

  void btComma() {
    _controller.add(
      _result = (_result == "0" ? "0" : (_result + ".")),
    );
  }

  void btEqual() {
    _controller.add(
      _result = ExpressionEvaluator(_result).evaluate(),
    );
  }
}
