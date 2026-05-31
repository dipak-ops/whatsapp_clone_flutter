import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? controller;

  @override
  void initState() {
    super.initState();
    initCamera(); // 1. Trigger camera initialization when the screen loads
  }

  @override
  void dispose() {
    controller?.dispose(); // 2. Always dispose of heavy resources like cameras
    super.dispose();
  }

  Future<void> initCamera() async {
    try {
      final cameras = await availableCameras();

      if (cameras.isEmpty) {
        print("No cameras available on this device.");
        return;
      }

      print("Cameras Found: ${cameras.length}");

      controller = CameraController(
        cameras.first,
        ResolutionPreset.high,
        enableAudio: false,
      );

      await controller!.initialize();
      print("Camera Initialized");

      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      print("Camera Error: $e");
    }
  }

  // 3. Implemented the takePhoto method
  Future<void> takePhoto() async {
    if (controller == null || !controller!.value.isInitialized) {
      print("Error: Camera is not ready.");
      return;
    }

    if (controller!.value.isTakingPicture) {
      // A picture is already being taken, wait for it to finish
      return;
    }

    try {
      final XFile file = await controller!.takePicture();
      print("Photo saved to: ${file.path}");

      // Do something with the image file here (e.g., navigate to a preview screen)

    } catch (e) {
      print("Error capturing photo: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller!.value.isInitialized) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    // 4. Wrapped in a Scaffold for better structural handling
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: CameraPreview(controller!),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: takePhoto, // Successfully bound to the method above
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 5,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}