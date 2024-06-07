import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kisaan_station/src/app/router/router.gr.dart';
import 'package:kisaan_station/src/constants/colors.dart';

import '../../../../model/user/media_model.dart';

class PostImagePreview extends StatefulWidget {
  const PostImagePreview({Key? key, required this.images}) : super(key: key);

  final List<Media> images;

  @override
  State<PostImagePreview> createState() => _PostImagePreviewState();
}

class _PostImagePreviewState extends State<PostImagePreview> {
  int activePage = 0;
  bool visibility = false;
  Size imageSize = const Size(0, 0);
  bool isLandscape = false;

  final PageController _pageController = PageController();

  void _getImageDimension(String imageURL) {
    final Image image = Image.network(imageURL);
    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener(
        (ImageInfo image, bool synchronousCall) {
          final myImage = image.image;
          if (mounted) {
            setState(() {
              imageSize =
                  Size(myImage.width.toDouble(), myImage.height.toDouble());
              isLandscape = imageSize.aspectRatio > 1;
            });
          }
        },
      ),
    );
  }

  @override
  void initState() {
    _getImageDimension(widget.images[0].mediaUrl);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.images.length == 1
          ? AspectRatio(
              aspectRatio: isLandscape ? imageSize.aspectRatio : 1 / 1,
              child: GestureDetector(
                onTap: () {
                  context.router.push(PostImagePreviewerRoute(urls: [widget.images[0].mediaUrl],
                    initialPage: activePage,));


                  // context.router.push(MuiltiUrlImageRoute(
                  //   urls: [widget.images[0].mediaUrl],
                  //   initialPage: activePage,
                  // ));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffb2b6b9),
                    image: DecorationImage(
                      image: NetworkImage(widget.images[0].mediaUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            )
          : Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.width,
                        width: double.infinity,
                        child: PageView.builder(
                          controller: _pageController,
                          onPageChanged: (page) {
                            setState(() {
                              activePage = page;
                              visibility = true;
                            });
                            _pageController
                                .animateToPage(activePage,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeOut)
                                .whenComplete(() async {
                              await Future.delayed(
                                const Duration(seconds: 4),
                                () {
                                  setState(() {
                                    visibility = false;
                                  });
                                },
                              );
                            });
                          },
                          itemCount: widget.images.length,
                          itemBuilder: (context, i) => GestureDetector(
                            onTap: () {
                              final List<String> links = [];
                              for (final media in widget.images) {
                                links.add(media.mediaUrl);
                              }
                              context.router.push(PostImagePreviewerRoute(urls: links, initialPage: activePage));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xffb2b6b9),
                                image: DecorationImage(
                                  image:
                                      NetworkImage(widget.images[i].mediaUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        )),
                    Positioned(
                        right: 5,
                        top: 5,
                        child: Visibility(
                          visible: visibility,
                          child: Container(
                            height: 20,
                            width: 30,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.black26),
                            child: Center(
                              child: Text(
                                '${activePage + 1}/${widget.images.length}',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(
                      widget.images.length,
                      (index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: 7,
                          height: 7,
                          decoration: BoxDecoration(
                            color: activePage == index ? primary : lightGrey,
                            shape: BoxShape.circle,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
