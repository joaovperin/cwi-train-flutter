import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:cleandex_poketecture/pages/list_page_no_app_bar.dart';
import 'package:cleandex_poketecture/pages/list_page_with_flutter_app_bar.dart';
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
      Navigator.of(context).pushReplacementNamed(ListPageWithFlutterAppBar.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Splash Page',
          style: TextStyle(fontSize: 30, color: AppColors.textColor),
        ),
      ),
    );
  }
}
