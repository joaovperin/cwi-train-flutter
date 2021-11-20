import 'package:flutter/material.dart';
import 'package:native_resources/pages/camera_page.dart';
import 'package:native_resources/pages/location_page.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Navigation',
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Camera'),
              onPressed: () {
                Navigator.of(context).pushNamed(CameraPage.routeName);
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Location'),
              onPressed: () {
                Navigator.of(context).pushNamed(LocationPage.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
