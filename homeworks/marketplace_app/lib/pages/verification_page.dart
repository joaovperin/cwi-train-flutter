import 'package:flutter/material.dart';
import 'package:marketplace_app/commons/colors.dart';
import 'package:marketplace_app/widgets/app_big_button.dart';
import 'package:marketplace_app/widgets/app_italic_title.dart';

class VerificationPage extends StatelessWidget {
  static const routeName = '/verification';
  const VerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppItalicTitle('Verification'),
              Text(
                'a four digit verification code has been sent to your mobile number',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 160),
              AppBigButton('Verify', onTap: () {}),
              const SizedBox(height: 20),
              Center(
                child: TextButton(
                  child: const Text(
                    "Resend",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.red,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
