import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisaan_station/src/controller/video/video_controller.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../app/router/router.gr.dart';
import '../../../../constants/colors.dart';

final videoContollerProvider = StateNotifierProvider.family<VideoPlayerNotifier,
    AsyncValue<VideoPlayerController>, String>((ref, url) {
  return VideoPlayerNotifier(url);
});

class KVideoPlayer extends StatefulWidget {
  final String url;

  const KVideoPlayer({Key? key, required this.url}) : super(key: key);

  @override
  _KVideoPlayerState createState() => _KVideoPlayerState();
}

class _KVideoPlayerState extends State<KVideoPlayer> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer(builder: (context, ref, child) {
      final res = ref.watch(videoContollerProvider(widget.url));
      return res.when(
        data: (_playerController) {
          return OutVideoPlayer(
            controller: _playerController,
            url: widget.url,
          );
        },
        error: (error, st) {
          return SizedBox(
            height: 40,
            width: size.width,
            child: const Center(
                child: Text(
              "Can't load the video !",
              style: TextStyle(
                color: redError,
              ),
            )),
          );
        },
        loading: () {
          return SizedBox(
            height: size.width,
            width: size.width,
            child: Shimmer.fromColors(
              highlightColor: Colors.grey[100]!,
              baseColor: Colors.grey[300]!,
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Container(color: Colors.grey),
              ),
            ),
          );
        },
      );
      // return FutureBuilder(
      //   future: _initializeVideoPlayerFuture,
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       return OutVideoPlayer(
      //         controller: _playerController,
      //         url: widget.url,
      //       );
      //     } else {
      //       debugPrint(snapshot.connectionState);
      //       return SizedBox(
      //         height: size.width,
      //         width: size.width,
      //         child: Shimmer.fromColors(
      //           highlightColor: Colors.grey[100]!,
      //           baseColor: Colors.grey[300]!,
      //           child: AspectRatio(
      //             aspectRatio: 1 / 1,
      //             child: Container(color: Colors.grey),
      //           ),
      //         ),
      //       );
      //     }
      //   },
      // );
    });
  }
}

class OutVideoPlayer extends StatefulWidget {
  const OutVideoPlayer({Key? key, required this.controller, required this.url})
      : super(key: key);

  final VideoPlayerController controller;
  final String url;

  @override
  State<OutVideoPlayer> createState() => _OutVideoPlayerState();
}

class _OutVideoPlayerState extends State<OutVideoPlayer> {
  int playedCount = 0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
      final finished = widget.controller.value.duration
              .compareTo(widget.controller.value.position) ==
          0;
      if (finished) {
        playedCount++;
        setState(() {});
      }
    });
  }

  Future<void> onVisibilityChanged(VisibilityInfo info) async {
    final bool isPlaying = widget.controller.value.isPlaying;
    if (info.visibleFraction < 0.8) {
      if (isPlaying) {
        widget.controller.pause();
      }
    } else {
      // if (!isPlaying && playedCount == 0) {
      //   widget.controller.play();
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double _aspectRatio = widget.controller.value.aspectRatio;
    final bool _isMuted = widget.controller.value.volume == 0;
    final bool _isPlaying = widget.controller.value.isPlaying;
    final bool _isLonger = widget.controller.value.aspectRatio < 3 / 4;

    final rTime = widget.controller.value.duration.inMinutes < 60
        ? (widget.controller.value.duration - widget.controller.value.position)
            .toString()
            .substring(2, 7)
        : (widget.controller.value.duration - widget.controller.value.position)
            .toString()
            .substring(0, 7);

    return VisibilityDetector(
      key: ObjectKey(widget.url),
      onVisibilityChanged: (info) {
        onVisibilityChanged(info);
      },
      child: AspectRatio(
        aspectRatio: _isLonger ? 3 / 4 : _aspectRatio,
        child: SizedBox(
          height: _isLonger ? size.width * (4 / 3) : null,
          child: ClipRect(
            child: Stack(
              alignment: Alignment.center,
              children: [
                AspectRatio(
                  aspectRatio: _isLonger ? 3 / 4 : _aspectRatio,
                  child: SizedBox.expand(
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: widget.controller.value.size.width,
                        height: widget.controller.value.size.height,
                        child: VideoPlayer(widget.controller),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (_isPlaying) {
                      widget.controller.pause();
                      playedCount = 1;
                      setState(() {});
                    } else {
                      widget.controller.play();
                      playedCount = 0;
                      setState(() {});
                    }
                  },
                  child: _isPlaying
                      ? AspectRatio(
                          aspectRatio: _isLonger ? 3 / 4 : _aspectRatio,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () => _isMuted
                                          ? widget.controller.setVolume(1)
                                          : widget.controller.setVolume(0),
                                      icon: Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: blackSplash,
                                        ),
                                        child: Icon(
                                          _isMuted
                                              ? Icons.volume_off_outlined
                                              : Icons.volume_up_outlined,
                                          color: Colors.white,
                                        ),
                                      )),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2),
                                      margin: const EdgeInsets.only(
                                          bottom: 8, right: 8),
                                      decoration: BoxDecoration(
                                          color: iconColor,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Text(
                                        rTime,
                                        style: const TextStyle(
                                            color: whitePrimary),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        )
                      : Container(
                          // width: _isPortrait ? size.width : null,
                          // height: size.width * (4 / 3),
                          color: blackSplash,
                          alignment: Alignment.center,
                          child: AspectRatio(
                            aspectRatio: _isLonger
                                ? 3 / 4
                                : widget.controller.value.aspectRatio,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          // _isPlaying = _thisController.value.isPlaying;
                                          // _thisController.pause();


                                          // context.router.push(FullScreenPostVideoPlayer());

                                          context.router
                                              .push<Duration>(
                                                  FullVideoPlayerRoute(
                                            controller: widget.controller,
                                            seekTo: widget
                                                .controller.value.position,
                                          ))
                                              .then((position) {
                                                if(position!=null){
                                                  widget.controller.seekTo(position);
                                                }
                                          });
                                        },
                                        icon: Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: blackSplash,
                                          ),
                                          child: const Icon(
                                            Icons.fullscreen_outlined,
                                            color: Colors.white,
                                          ),
                                        )),
                                    IconButton(
                                        onPressed: () => _isMuted
                                            ? widget.controller.setVolume(1)
                                            : widget.controller.setVolume(0),
                                        icon: Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: blackSplash,
                                          ),
                                          child: Icon(
                                            _isMuted
                                                ? Icons.volume_off_outlined
                                                : Icons.volume_up_outlined,
                                            color: Colors.white,
                                          ),
                                        )),
                                  ],
                                ),
                                const Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                  size: 60,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2),
                                        margin: const EdgeInsets.only(
                                            bottom: 8, right: 8),
                                        decoration: BoxDecoration(
                                            color: iconColor,
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: Text(
                                          rTime,
                                          style: const TextStyle(
                                              color: Colors.white),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
