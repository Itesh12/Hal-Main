import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/router/router.gr.dart';
import '../../../../controller/post/provider/create_post_page_controller.dart';

class ImagePlaceholder extends ConsumerWidget {
  const ImagePlaceholder({Key? key, required this.images}) : super(key: key);

  final List<File> images;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width - 52;
    final List<File> images = ref.watch(createPostController).pickedImages;

    return Container(
      width: width,
      height: images.length == 1 ? width * 0.6 : width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(9),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: FileImage(
                                images[0],
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      if (images.length == 2 || images.length > 4)
                        Container(
                          width: 1,
                          color: Colors.white,
                        ),
                      if (images.length == 2 || images.length > 4)
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: FileImage(
                                  images[1],
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                if (images.length > 2)
                  const Divider(
                    height: 1,
                    color: Colors.white,
                  ),
                if (images.length > 2)
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: FileImage(
                                  images.length == 4 || images.length == 3
                                      ? images[1]
                                      : images[2],
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        if (images.length > 2)
                          Container(
                            width: 1,
                            color: Colors.white,
                          ),
                        if (images.length > 2)
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: FileImage(
                                    images.length == 4 || images.length == 3
                                        ? images[2]
                                        : images[3],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        if (images.length > 3)
                          Container(
                            width: 1,
                            color: Colors.white,
                          ),
                        if (images.length > 3)
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: FileImage(
                                        images.length == 4
                                            ? images[3]
                                            : images[4],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                if (images.length > 5)
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.black54,
                                    ),
                                    child: Center(
                                        child: Text(
                                      "+${images.length - 5}",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    )),
                                  ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
              ],
            ),
            Positioned(
              right: 8,
              top: 8,
              child: Row(
                children: [
                  Container(
                    height: 20,
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(12)),
                    child: InkWell(
                      onTap: () {
                        context.router.push(MuiltiFileImageRoute(
                          images: images,
                          onPressed: (index) {
                            ref
                                .read(createPostController)
                                .removePerticularImage(images[index]);
                          },
                        ));
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => MuiltiFileImagePreview(
                        //       images: images,
                        //       onPressed: (index) {
                        //         ref
                        //             .read(createPostController)
                        //             .removePerticularImage(images[index]);
                        //       },
                        //     ),
                        //   ),
                        // );
                      },
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.visibility_outlined,
                                color: Colors.white,
                                size: 14,
                              ),
                              6.horizontalSpace,
                              const Text(
                                "View",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  8.horizontalSpace,
                  Container(
                    height: 18,
                    width: 18,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black54),
                    child: InkWell(
                      onTap: () {
                        ref.read(createPostController).removeAllImages();
                      },
                      child: const Center(
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
