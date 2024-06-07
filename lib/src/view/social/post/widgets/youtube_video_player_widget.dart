import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kisaan_station/src/app/router/router.gr.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeOnScreen extends StatefulWidget {
  final String videoURL;

  const YoutubeOnScreen({Key? key, required this.videoURL}) : super(key: key);

  @override
  _YoutubeOnScreenState createState() => _YoutubeOnScreenState();
}

class _YoutubeOnScreenState extends State<YoutubeOnScreen> {
  late YoutubePlayerController _thisController;
  late String _videoID;
  late bool _isPlaying;

  @override
  void initState() {
    _videoID = YoutubePlayer.convertUrlToId(widget.videoURL)!;
    _thisController = YoutubePlayerController(
      initialVideoId: _videoID,
      flags: const YoutubePlayerFlags(
        // autoPlay: false,
        disableDragSeek: true,
        enableCaption: false,
      ),
    );
    super.initState();
  }

  @override
  void deactivate() {
    _thisController.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _thisController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.black,
      child: FittedBox(
        child: VisibilityDetector(
          key: Key("${_thisController.hashCode}_key"),
          onVisibilityChanged: (info) {
            final bool isPlaying = _thisController.value.isPlaying;
            final bool initialized = _thisController.value.isReady;
            if (info.visibleFraction < 0.8) {
              if (initialized && isPlaying) {
                _thisController.pause();
              }
            }
          },
          child: YoutubePlayer(
            controller: _thisController,
            showVideoProgressIndicator: true,
            progressColors: const ProgressBarColors(
              playedColor: Colors.red,
              backgroundColor: Colors.white24,
              bufferedColor: Colors.white60,
            ),
            bottomActions: [
              CurrentPosition(),
              const SizedBox(width: 10.0),
              ProgressBar(
                isExpanded: true,
                colors: const ProgressBarColors(
                  playedColor: Colors.red,
                  handleColor: Colors.red,
                  backgroundColor: Colors.white24,
                  bufferedColor: Colors.white60,
                ),
              ),
              const SizedBox(width: 10.0),
              RemainingDuration(),
              IconButton(
                icon: const Icon(
                  Icons.fullscreen,
                  color: Colors.white,
                ),
                onPressed: () {
                  _isPlaying = _thisController.value.isPlaying;
                  // _thisController.pause();
                  context.router
                      .push<int>(
                    FullYoutubePlayerRoute(
                      videoURL: widget.videoURL,
                      seekTo: _thisController.value.position.inSeconds,
                      isPlaying: _isPlaying,
                    ),
                  )
                      .then((position) {
                    _thisController.seekTo(Duration(milliseconds: position!));
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

@RoutePage<int>(name: "FullYoutubePlayerRoute")
class FullYoutubeScreen extends StatefulWidget {
  final int seekTo;
  final String videoURL;
  final bool isPlaying;

  const FullYoutubeScreen(
      {Key? key,
      required this.seekTo,
      required this.videoURL,
      required this.isPlaying})
      : super(key: key);

  @override
  _FullYoutubeScreenState createState() => _FullYoutubeScreenState();
}

class _FullYoutubeScreenState extends State<FullYoutubeScreen> {
  late YoutubePlayerController _fullController;
  late String _videoID;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    _videoID = YoutubePlayer.convertUrlToId(widget.videoURL)!;
    _fullController = YoutubePlayerController(
      initialVideoId: _videoID,
      flags: YoutubePlayerFlags(
        autoPlay: widget.isPlaying,
        disableDragSeek: true,
        enableCaption: false,
        startAt: widget.seekTo,
      ),
    );
    super.initState();
  }

  @override
  void deactivate() {
    _fullController.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    _fullController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YoutubePlayer(
        controller: _fullController,
        showVideoProgressIndicator: true,
        progressColors: const ProgressBarColors(
          playedColor: Colors.red,
          backgroundColor: Colors.white24,
          bufferedColor: Colors.white60,
        ),
        bottomActions: [
          CurrentPosition(),
          const SizedBox(width: 10.0),
          ProgressBar(
            isExpanded: true,
            colors: const ProgressBarColors(
              playedColor: Colors.red,
              handleColor: Colors.red,
              backgroundColor: Colors.white24,
              bufferedColor: Colors.white60,
            ),
          ),
          const SizedBox(width: 10.0),
          RemainingDuration(),
          IconButton(
            icon: const Icon(
              Icons.fullscreen_exit,
              color: Colors.white,
            ),
            onPressed: () {
              // _fullController.pause();
              context.router.pop(_fullController.value.position.inMilliseconds);
            },
          ),
        ],
      ),
    );
  }
}
