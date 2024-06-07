import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import '../../../../constants/colors.dart';

@RoutePage<Duration>(name: "FullVideoPlayerRoute")
class FullVideoPlayer extends StatefulWidget {
  const FullVideoPlayer({
    Key? key,
    required this.controller,
    required this.seekTo,
  }) : super(key: key);

  final VideoPlayerController controller;
  final Duration seekTo;

  @override
  State<FullVideoPlayer> createState() => _FullVideoPlayerState();
}

class _FullVideoPlayerState extends State<FullVideoPlayer> {
  late bool _isPlaying;
  late bool _isMuted;
  late double _aspectRatio;

  @override
  void initState() {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.landscapeRight,
    //   DeviceOrientation.portraitUp,
    // ]);
    widget.controller.seekTo(widget.seekTo);
    _isPlaying = widget.controller.value.isPlaying;
    _isMuted = widget.controller.value.volume == 0;
    _aspectRatio = widget.controller.value.aspectRatio;
    setPlayListener();
    super.initState();
  }

  void setPlayListener() {
    widget.controller.addListener(() {
      final bool finished = widget.controller.value.duration
              .compareTo(widget.controller.value.position) ==
          0;
      if (finished) {
        _isPlaying = false;
        setState(() {});
      }
    });
  }

  @override
  void deactivate() {
    if (widget.controller.value.isPlaying) {
      widget.controller.pause();
    }
    super.deactivate();
  }

  @override
  void dispose() {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //     overlays: SystemUiOverlay.values);
    // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          AspectRatio(
            aspectRatio: widget.controller.value.aspectRatio,
            child: VideoPlayer(widget.controller),
          ),
          InkWell(
            onTap: () {
              if (_isPlaying) {
                widget.controller.pause();
                _isPlaying = false;
                debugPrint('pausing....');
              } else {
                widget.controller.play();
                _isPlaying = true;
                debugPrint('playing....');
              }
              setState(() {});
            },
            child: _isPlaying
                ? Container(
                    alignment: Alignment.center,
                    child: AspectRatio(
                      aspectRatio: _aspectRatio,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    if (_isMuted) {
                                      widget.controller.setVolume(1);
                                      _isMuted = false;
                                    } else {
                                      widget.controller.setVolume(0);
                                      _isMuted = true;
                                    }
                                    setState(() {});
                                  },
                                  icon: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black12,
                                    ),
                                    child: Icon(
                                      _isMuted
                                          ? Icons.volume_off_outlined
                                          : Icons.volume_up_outlined,
                                      color: white,
                                    ),
                                  )),
                            ],
                          ),
                          VideoProgressIndicator(
                            widget.controller,
                            allowScrubbing: true,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 3),
                            colors: const VideoProgressColors(
                              playedColor: Colors.red,
                              backgroundColor: Colors.white24,
                              bufferedColor: Colors.white60,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(
                    color: Colors.black12,
                    alignment: Alignment.center,
                    child: AspectRatio(
                      aspectRatio: widget.controller.value.aspectRatio,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    widget.controller.pause();
                                    Navigator.pop(context,
                                        widget.controller.value.position);
                                  },
                                  icon: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black12,
                                    ),
                                    child: const Icon(
                                      Icons.fullscreen_exit_outlined,
                                      color: white,
                                    ),
                                  )),
                              IconButton(
                                  onPressed: () {
                                    if (_isMuted) {
                                      widget.controller.setVolume(1);
                                      _isMuted = false;
                                    } else {
                                      widget.controller.setVolume(0);
                                      _isMuted = true;
                                    }
                                    setState(() {});
                                  },
                                  icon: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black12,
                                    ),
                                    child: Icon(
                                      _isMuted
                                          ? Icons.volume_off_outlined
                                          : Icons.volume_up_outlined,
                                      color: white,
                                    ),
                                  )),
                            ],
                          ),
                          const Icon(
                            Icons.play_arrow,
                            color: white,
                            size: 60,
                          ),
                          VideoProgressIndicator(
                            widget.controller,
                            allowScrubbing: true,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 3),
                            colors: const VideoProgressColors(
                              playedColor: Colors.red,
                              backgroundColor: Colors.white24,
                              bufferedColor: Colors.white60,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
