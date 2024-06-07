import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'images_preview.dart';

@RoutePage(name: "MuiltiUrlImageRoute")
class MuiltiUrlImagePreview extends StatelessWidget {
  final List<String> urls;
  final int initialPage;

  MuiltiUrlImagePreview({
    Key? key,
    required this.urls,
    this.initialPage = 0,
  })  : assert(urls.isNotEmpty),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MuiltiImagePreview(
      images: urls,
      initialPage: initialPage,
    );
  }
}
