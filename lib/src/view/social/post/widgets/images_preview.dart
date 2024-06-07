import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MuiltiImagePreview extends ConsumerStatefulWidget {
  final List<dynamic> images;
  final int initialPage;
  final Function(int)? onPressed;

  MuiltiImagePreview({
    Key? key,
    required this.images,
    this.initialPage = 0,
    this.onPressed,
  })  : assert(images.isNotEmpty),
        super(key: key);

  @override
  _MuiltiImagePreviewState createState() => _MuiltiImagePreviewState();
}

class _MuiltiImagePreviewState extends ConsumerState<MuiltiImagePreview>
    with SingleTickerProviderStateMixin {
  late TransformationController controller;
  late AnimationController animationController;
  TapDownDetails? tapDownDetails;
  Animation<Matrix4>? animation;
  final PageController _pageController = PageController();

  late int currentIndex;

  @override
  void initState() {
    currentIndex = widget.initialPage;
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => setPage());
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    controller = TransformationController();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..addListener(() {
        controller.value = animation!.value;
      });
  }

  void setPage() {
    _pageController.jumpToPage(currentIndex);
    setState(() {});
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
    bool isUrl = false;

    if(widget.images.isNotEmpty){
       isUrl = widget.images[0].runtimeType == String;
    }
    else{
       isUrl = false;
    }

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        actions: [
          if (!isUrl)
            IconButton(
              onPressed: () {
                if(widget.images.length == 1){
                  widget.onPressed!(currentIndex);
                  context.router.pop();
                }
                else{
                  widget.onPressed!(currentIndex);
                }
                setState(() {});
              },
              icon: const Icon(Icons.delete),
            ),
        ],
      ),
      body: PageView.builder(
          itemCount: widget.images.length,
          controller: _pageController,
          onPageChanged: (index) {
            currentIndex = index;
          },
          itemBuilder: (context, index) {
            if (widget.images.isNotEmpty) {
              return FittedBox(
                child: GestureDetector(
                  onDoubleTapDown: (details) => tapDownDetails = details,
                  onDoubleTap: () {
                    final position = tapDownDetails!.localPosition;

                    const double scale = 3;
                    final x = -position.dx * (scale - 1);
                    final y = -position.dy * (scale - 1);

                    final zoomed = Matrix4.identity()
                      ..translate(x, y)
                      ..scale(scale);
                    final end = controller.value.isIdentity()
                        ? zoomed
                        : Matrix4.identity();

                    animation = Matrix4Tween(
                      begin: controller.value,
                      end: end,
                    ).animate(
                      CurveTween(curve: Curves.easeOut)
                          .animate(animationController),
                    );

                    animationController.forward(from: 0);
                  },
                  child: InteractiveViewer(
                    transformationController: controller,
                    clipBehavior: Clip.none,
                    maxScale: 3.0,
                    child: isUrl
                        ? Image.network(widget.images[index])
                        : Image.file(widget.images[index]),
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          }),
    );
  }
}
