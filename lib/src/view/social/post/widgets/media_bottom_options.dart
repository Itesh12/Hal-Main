import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kisaan_station/src/controller/post/provider/create_post_page_controller.dart';

import '../../../../constants/colors.dart';
import '../../../../util/image_picker/image_picker.dart';

class MediaBottomOption extends ConsumerWidget {
  const MediaBottomOption({Key? key, required this.cntxt}) : super(key: key);

  final BuildContext cntxt;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final val = ref.watch(createPostController);
    final bool imageDisable = val.youtubeUrl.isNotEmpty ||
        val.pickedVideo != null ||
        val.pickedImages.length == 10;

    final bool videoDisable = val.youtubeUrl.isNotEmpty ||
        val.pickedVideo != null ||
        val.pickedImages.isNotEmpty;

    final bool hasMedia = val.youtubeUrl.isNotEmpty ||
        val.pickedVideo != null ||
        val.pickedImages.isNotEmpty;

    return MediaQuery.of(cntxt).viewInsets.bottom != 0 || hasMedia
        ? Container(
            height: 44.h,
            width: double.maxFinite,
            color: Colors.white,
            child: Material(
              child: Row(
                children: [
                  IconButton(
                    onPressed: imageDisable
                        ? null
                        : () async {
                            final isCamera = await ref
                                .read(mediaProvider)
                                .chooseSource(context);

                            if (isCamera != null) {
                              if (isCamera) {
                                ref
                                    .read(createPostController)
                                    .chooseImage(isCamera: isCamera);
                              } else {
                                final length = 10 - val.pickedImages.length;
                                ref.read(createPostController).chooseMultiImage(
                                    count: length, context: context);
                              }
                            }
                          },
                    icon: SvgPicture.asset(
                      'assets/images/camerapost.svg',
                      color: imageDisable ? Colors.grey : primary,
                    ),
                  ),
                  IconButton(
                    onPressed: videoDisable
                        ? null
                        : () async {
                            final isCamera = await ref
                                .read(mediaProvider)
                                .chooseSource(context);

                            if (isCamera != null) {
                              ref
                                  .read(createPostController)
                                  .chooseVideo(isCamera: isCamera);
                            }
                          },
                    icon: SvgPicture.asset(
                      'assets/images/Video.svg',
                      color: videoDisable ? Colors.grey : primary,
                    ),
                  ),
                  IconButton(
                    onPressed: videoDisable
                        ? null
                        : () {
                            ref
                                .read(createPostController)
                                .showYoutubeDialog(context);
                          },
                    icon: SvgPicture.asset(
                      'assets/images/youtube.svg',
                      color: videoDisable ? Colors.grey : primary,
                    ),
                  ),
                ],
              ),
            ),
          )
        : const SizedBox();
  }
}
