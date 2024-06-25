import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/controller/post/provider/create_post_page_controller.dart';

import '../../../../util/image_picker/image_picker.dart';
import 'create_post_bottom_options.dart';

class CreatePostBottom extends ConsumerWidget {
  const CreatePostBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final val = ref.watch(createPostController);
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
      child: Column(
        children: [
          CreatePostBottomOption(
            icon: 'assets/images/camerapost.svg',
            label: 'Add photo',
            onTap: () async {
              final bool? isCamera =
                  await ref.read(mediaProvider).chooseSource(context);

              if (isCamera != null) {
                if (isCamera) {
                  ref
                      .read(createPostController)
                      .chooseImage(isCamera: isCamera);
                } else {
                  final length = 10 - val.pickedImages.length;
                  ref
                      .read(createPostController)
                      .chooseMultiImage(count: length, context: context);
                }
              }
            },
          ),
          const Divider(height: 1),
          CreatePostBottomOption(
            icon: 'assets/images/Video.svg',
            label: 'Add video',
            onTap: () async {
              final isCamera =
                  await ref.read(mediaProvider).chooseSource(context);

              if (isCamera != null) {
                ref.read(createPostController).chooseVideo(isCamera: isCamera);
              }
            },
          ),
          const Divider(height: 2),
          CreatePostBottomOption(
            icon: 'assets/images/Video.svg',
            label: 'Add Reels',
            onTap: () async {
              final isCamera =
                  await ref.read(mediaProvider).chooseSource(context);

              if (isCamera != null) {
                ref.read(createPostController).chooseVideo(isCamera: isCamera);
              }
            },
          ),
          const Divider(height: 2),
          CreatePostBottomOption(
            icon: 'assets/images/youtube.svg',
            label: 'Add youtube',
            onTap: () {
              ref.read(createPostController).showYoutubeDialog(context);
            },
          ),
        ],
      ),
    );
  }
}
