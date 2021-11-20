import 'package:flutter/material.dart';

class AppItalicTitle extends StatelessWidget {
  const AppItalicTitle(
    this.text, {
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 34,
          fontStyle: FontStyle.italic,
          fontFamily: 'Lato',
        ),
      ),
    );
  }
}
