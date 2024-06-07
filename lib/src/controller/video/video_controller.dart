import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerNotifier
    extends StateNotifier<AsyncValue<VideoPlayerController>> {
  VideoPlayerNotifier(this.url) : super(const AsyncValue.loading()) {
    initState();
  }

  final String url;

  void initState() {
    final v = VideoPlayerController.network(url)
      ..initialize()
      ..setVolume(0);
    state = AsyncValue.data(v);
  }

  @override
  void dispose() {
    state.value?.dispose();
    debugPrint("player disposed");
    super.dispose();
  }
}
