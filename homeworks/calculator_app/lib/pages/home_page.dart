import 'package:calculator_app/commons/app_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  Color _currentColor = _colors[0];

  static const List<Color> _colors = [
    AppColors.primary,
    AppColors.primaryDark,
    AppColors.primaryLight,
    AppColors.primaryLightest,
    AppColors.primaryDarkest,
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter >= _colors.length) {
        _counter = 0;
      }
      _currentColor = _colors[_counter];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
        backgroundColor: _currentColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: [
                Container(
                  color: _currentColor,
                  height: 500,
                  width: 500,
                ),
                Container(
                    color: Colors.white,
                    height: 200,
                    width: 200,
                    child: Text(
                      'You have pushed the button this many times:',
                      style: TextStyle(
                        fontSize: 20,
                        color: _currentColor,
                      ),
                    ),
                  )
              ],
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
        backgroundColor: _currentColor,
      ),
    );
  }
}
