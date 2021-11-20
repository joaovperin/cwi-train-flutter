import 'package:flutter/material.dart';
import 'package:native_resources/commons/colors.dart';

class LocationPage extends StatelessWidget {
  static const routeName = '/location';
  const LocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location'),
      ),
      backgroundColor: AppColors.black,
    );
  }
}
