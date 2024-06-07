import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImageViewScreen extends StatefulWidget {
  final String? url;
  final File? image;

  const ImageViewScreen({Key? key, this.url, this.image}) : super(key: key);

  @override
  _ImageViewScreenState createState() => _ImageViewScreenState();
}

class _ImageViewScreenState extends State<ImageViewScreen>
    with SingleTickerProviderStateMixin {
  late TransformationController controller;
  late AnimationController animationController;
  TapDownDetails? tapDownDetails;
  Animation<Matrix4>? animation;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    controller = TransformationController();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..addListener(() {
        controller.value = animation!.value;
      });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    controller.dispose();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: Center(
        child: GestureDetector(
          onDoubleTapDown: (details) => tapDownDetails = details,
          onDoubleTap: () {
            final position = tapDownDetails!.localPosition;

            const double scale = 5;
            final x = -position.dx * (scale - 1);
            final y = -position.dy * (scale - 1);

            final zoomed = Matrix4.identity()
              ..translate(x, y)
              ..scale(scale);
            final end =
                controller.value.isIdentity() ? zoomed : Matrix4.identity();

            animation = Matrix4Tween(
              begin: controller.value,
              end: end,
            ).animate(
              CurveTween(curve: Curves.easeOut).animate(animationController),
            );

            animationController.forward(from: 0);
          },
          child: InteractiveViewer(
            transformationController: controller,
            clipBehavior: Clip.none,
            maxScale: 5.0,
            child: widget.image != null
                ? Image.file(widget.image!)
                : Image.network(widget.url!),
          ),
        ),
      ),
    );
  }
}
