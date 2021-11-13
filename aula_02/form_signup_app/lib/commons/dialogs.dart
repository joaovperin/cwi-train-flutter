import 'package:flutter/material.dart';

class AppDialogs {
  const AppDialogs._();

  static Future<dynamic> showMessage(BuildContext context, String message,
      {String title = 'Information'}) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
