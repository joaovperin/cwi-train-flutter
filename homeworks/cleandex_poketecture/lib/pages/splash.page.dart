import 'package:cleandex_poketecture/commons/app_colors.dart';
import 'package:cleandex_poketecture/pages/main.page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  static const routeName = '/loading';
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _appLoaded = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() => _appLoaded = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Column(
                    children: const [
                      Text(
                        'Welcome to ',
                        style: TextStyle(fontSize: 28, color: AppColors.text),
                      ),
                      SizedBox(height: 24),
                      Text(
                        'Cleandex',
                        style: TextStyle(fontSize: 36, color: AppColors.text),
                      ),
                      Text(
                        'Pokétecture',
                        style: TextStyle(fontSize: 36, color: AppColors.text),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  'assets/app-icon.png',
                  width: 160,
                  height: 160,
                ),
                _StartAppButton(
                  onPressed: _appLoaded ? _goToMainPage : null,
                )
              ],
            ),
          ),
          const Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Created by João Victor A. Perin'),
            ),
          )
        ],
      ),
    );
  }

  void _goToMainPage() {
    Navigator.of(context).pushReplacementNamed(MainPage.routeName);
  }
}

class _StartAppButton extends StatelessWidget {
  const _StartAppButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Padding(
        padding: EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16.0,
        ),
        child: Text(
          'Start',
          style: TextStyle(
            fontSize: 32,
            color: AppColors.startButtonText,
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(primary: AppColors.text),
      onPressed: onPressed,
    );
  }
}
