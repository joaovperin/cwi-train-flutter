import 'package:flutter/material.dart';
import 'package:native_resources/commons/colors.dart';

class CameraPage extends StatefulWidget {
  static const routeName = '/camera';
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  // List<CameraDescription> _cameras;
  // CameraController _cameraCtrl;

  @override
  void initState() {
    super.initState();
    // _getCameras();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _getCameras() async {
    // _cameras = await availableCameras();
    // _controller = CameraController(_cameras.first, ResolutionPreset.max);
    // _controller.initialize().then((_) {
    //   if (!mounted) {
    //     return;
    //   }
    //   setState((){});
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera'),
      ),
      backgroundColor: AppColors.green,
    );
  }
}
