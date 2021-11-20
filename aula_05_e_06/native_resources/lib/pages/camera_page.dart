import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:native_resources/pages/display_picture_page.dart';

class CameraPage extends StatefulWidget {
  static const routeName = '/camera';
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late List<CameraDescription> _cameras;
  CameraController? _cameraCtrl;

  @override
  void initState() {
    super.initState();
    _initCameras();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _initCameras() async {
    _cameras = await availableCameras();
    _cameraCtrl = CameraController(_cameras.first, ResolutionPreset.max);
    _cameraCtrl!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera'),
      ),
      body: Container(
        child: _cameraCtrl?.value.isInitialized ?? false
            ? CameraPreview(_cameraCtrl!)
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _takePicture,
        tooltip: 'Take Picture',
        child: const Icon(Icons.camera_alt),
      ),
    );
  }

  Future<void> _takePicture() async {
    if (_cameraCtrl!.value.isTakingPicture) {
      return;
    }
    final pic = await _cameraCtrl!.takePicture();
    print('Picture Taken: ' + pic.toString());
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DisplayPicturePage(
          path: pic.path,
        ),
      ),
    );
  }
}
