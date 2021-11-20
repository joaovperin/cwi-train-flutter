import 'dart:io';

import 'package:flutter/material.dart';

class DisplayPicturePage extends StatelessWidget {
  const DisplayPicturePage({Key? key, required this.path}) : super(key: key);

  final String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Picture'),
      ),
      body: Center(
        child: Image.file(File(path)),
      ),
    );
  }
}
