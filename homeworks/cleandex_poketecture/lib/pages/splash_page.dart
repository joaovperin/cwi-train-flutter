import 'package:cleandex_poketecture/pages/list_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  static const routeName = '/';
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(ListPage.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Splash Page',
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
      ),
    );
  }
}
