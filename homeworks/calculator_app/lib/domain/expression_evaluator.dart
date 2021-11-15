import 'dart:math';

class ExpressionEvaluator {
  final String expression;

  ExpressionEvaluator(this.expression);

  String evaluate() {
    // TODO: implemnet
    return (Random().nextInt(100) - Random().nextInt(30)).toString();
  }
}
