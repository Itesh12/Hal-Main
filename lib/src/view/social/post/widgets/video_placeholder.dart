import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/app/router/router.gr.dart';
import 'package:kisaan_station/src/controller/post/provider/create_post_page_controller.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';

class VideoPlaceholder extends ConsumerWidget {
  const VideoPlaceholder({Key? key, required this.video}) : super(key: key);

  final File video;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final val = ref.watch(createPostController);
    final videoFuture = val.initializeVideoPlayerFuture;
    final _playerController = val.playerController;

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(9),
          child: Stack(
            children: [
              FutureBuilder(
                  future: videoFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      // If the VideoPlayerController has finished initialization, use
                      // the data it provides to limit the aspect ratio of the video.
                      return SizedBox.expand(
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: SizedBox(
                            width: _playerController.value.size.width,
                            height: _playerController.value.size.height,
                            child: VideoPlayer(_playerController),
                          ),
                        ),
                      );
                    } else {
                      return Shimmer.fromColors(
                        highlightColor: Colors.grey[100]!,
                        baseColor: Colors.grey[300]!,
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Container(color: Colors.grey),
                        ),
                      );
                    }
                  }),
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
                          context.router.push(FullVideoPlayerRoute(
                            controller: _playerController,
                            seekTo: _playerController.value.position,
                          ));
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
                          ref.read(createPostController).removeVideo();
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
      ),
    );
  }
}
