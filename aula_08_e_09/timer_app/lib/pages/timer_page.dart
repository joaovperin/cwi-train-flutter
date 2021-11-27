import 'dart:async';

import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  num timer = 0;
  bool isRunning = false;

  final _controller = StreamController<num>();
  Stream<num> get _stream => _controller.stream;
  StreamSink<num> get _sink => _controller.sink;

  @override
  initState() {
    super.initState();
    _sink.add(timer);

    _stream.listen((num value) {
      setState(() {
        timer = value;
      });
    });
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Timer',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              timer.toString(),
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Start/Stop'),
              onPressed: _onPressedStartStopBtn,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onPressedStartStopBtn() async {
    isRunning = !isRunning;

    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      if (isRunning) {
        _sink.add(timer + 1);
      }
    }
  }
}
