import 'dart:async';

import 'package:colored_rect_app/colors_repository.dart';
import 'package:flutter/material.dart';

class RectanglesPage extends StatefulWidget {
  const RectanglesPage({Key? key}) : super(key: key);

  @override
  _RectanglesPageState createState() => _RectanglesPageState();
}

class _RectanglesPageState extends State<RectanglesPage> {
  Color currentColor = Colors.blue;
  bool isRunning = false;

  @override
  initState() {
    super.initState();

    _generateRandomColor().listen((Color value) {
      setState(() => currentColor = value);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer'),
        backgroundColor: currentColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 10,
              child: AnimatedContainer(
                margin: const EdgeInsets.all(10),
                color: currentColor,
                duration: const Duration(milliseconds: 420),
              ),
            ),
            const SizedBox(height: 20),
            Flexible(
              flex: 2,
              child: SizedBox(
                child: ElevatedButton(
                  child: const Text('Start/Stop', style: TextStyle(fontSize: 20)),
                  style: ElevatedButton.styleFrom(
                    primary: currentColor,
                  ),
                  onPressed: _onPressedChangeBtn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onPressedChangeBtn() async {
    setState(() => isRunning = !isRunning);
  }

  Stream<Color> _generateRandomColor() async* {
    while (true) {
      if (isRunning) {
        yield ColorsRepository.instance.getRandomColor();
      }
      await Future.delayed(const Duration(seconds: 1));
    }
  }
}
