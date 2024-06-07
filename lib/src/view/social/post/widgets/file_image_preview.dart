import 'package:auto_route/auto_route.dart';
import 'dart:io';

import 'package:flutter/material.dart';

import 'images_preview.dart';

@RoutePage(name: "MuiltiFileImageRoute")
class MuiltiFileImagePreview extends StatelessWidget {
  final List<File> images;
  final Function(int)? onPressed;

  MuiltiFileImagePreview({
    Key? key,
    required this.images,
    this.onPressed,
  })  : assert(images.isNotEmpty),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MuiltiImagePreview(
      images: images,
      onPressed: onPressed,
    );
  }
}
