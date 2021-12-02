import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:cleandex_poketecture/pages/details.page.dart';
import 'package:cleandex_poketecture/pages/main.page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  static const routeName = '/loading';
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(DetailsPage.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Splash Page',
          style: TextStyle(fontSize: 30, color: AppColors.text),
        ),
      ),
    );
  }
}
