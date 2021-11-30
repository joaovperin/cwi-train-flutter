import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  static const routeName = '/list';
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'List Page',
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
      ),
    );
  }
}
