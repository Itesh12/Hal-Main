import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisaan_station/global_providers.dart';
import 'package:kisaan_station/src/util/services/shared_preferences.dart';
import 'package:kisaan_station/src/view/widget/dialogs/fail_dialog.dart';
import 'package:kisaan_station/src/view/widget/dialogs/loading_dialog.dart';
import 'package:kisaan_station/src/view/widget/dialogs/success_dialog.dart';
import 'package:video_player/video_player.dart';

import '../../../util/image_picker/image_picker.dart';
import '../../../view/widget/youtube_url_dailog.dart';

final createPostController =
    ChangeNotifierProvider.autoDispose<CreatePostNotifier>((ref) {
  return CreatePostNotifier(ref);
});

class CreatePostNotifier extends ChangeNotifier {
  CreatePostNotifier(this.ref);

  final Ref ref;

  File? _pickedVideo;

  File? get pickedVideo => _pickedVideo;

  final List<File> _pickedImages = [];

  List<File> get pickedImages => _pickedImages;

  String _description = "";
  String get description => _description;

  String _youtubeUrl = "";
  String get youtubeUrl => _youtubeUrl;

  late VideoPlayerController _playerController;

  VideoPlayerController get playerController => _playerController;

  late Future<void> _initializeVideoPlayerFuture;

  Future<void> get initializeVideoPlayerFuture => _initializeVideoPlayerFuture;

  void changeDescription(String value) {
    _description = value;
    notifyListeners();
  }

  Future<void> showYoutubeDialog(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (context) {
          return YoutubeURLDialog();
        }).then((value) {
      if (value != null) {
        _youtubeUrl = value;
        notifyListeners();
      }
    });
  }

  void removeYoutube() {
    _youtubeUrl = "";
    notifyListeners();
  }

  void removeAllImages() {
    _pickedImages.clear();
    notifyListeners();
  }

  void reorderImage(int old, int newi) {
    final _reorderedImage = _pickedImages.removeAt(old);
    _pickedImages.insert(newi, _reorderedImage);
    notifyListeners();
  }

  void removePerticularImage(File image) {
    _pickedImages.remove(image);
    notifyListeners();
  }

  void removeVideo() {
    _pickedVideo = null;
    notifyListeners();
  }

  void initializeVideo(File file) {
    _playerController = VideoPlayerController.file(file)
      ..addListener(() {
        // notifyListeners();
      });

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _playerController.initialize();

    _playerController.addListener(() {
      final bool finished = _playerController.value.duration
              .compareTo(_playerController.value.position) ==
          0;
      if (finished) {
        _playerController.seekTo(const Duration());
      }
      // notifyListeners();
    });
  }

  Future<void> chooseImage({required bool isCamera}) async {
    File? pickedFile;
    if (isCamera) {
      pickedFile = await ref.read(mediaProvider).captureMedia();
    } else {
      pickedFile = await ref.read(mediaProvider).pickImage();
    }
    if (pickedFile != null) {
      _pickedImages.add(pickedFile);
      notifyListeners();
    }
  }

  Future<void> chooseMultiImage(
      {int count = 10, required BuildContext context}) async {
    final pickedFile = await ref
        .read(mediaProvider)
        .pickMultiImage(count: count, context: context);

    if (pickedFile.isNotEmpty) {
      _pickedImages.addAll(pickedFile);
      notifyListeners();
    }
  }

  Future<void> chooseVideo({required bool isCamera}) async {
    File? pickedFile;
    if (isCamera) {
      pickedFile = await ref.read(mediaProvider).captureVideo();
    } else {
      pickedFile = await ref.read(mediaProvider).pickVideo();
    }
    if (pickedFile != null) {
      initializeVideo(pickedFile);
      _pickedVideo = pickedFile;
      notifyListeners();
    }
  }

  Future<void> submit(BuildContext context) async {
    showLoading(context);
    final location = await ref.read(locationProvider).getLocation();
    double lat;
    double long;
    if (location != null) {
      lat = location.latitude!;
      long = location.longitude!;
    } else {
      final user =
          ref.read(userController(UserPreferences.userId)).asData!.value;
      debugPrint('got the lat and long from the user');
      lat = user.address.latitude;
      long = user.address.longitude;
    }

    String type = "";
    type = _pickedImages.isNotEmpty
        ? "image"
        : _pickedVideo != null
            ? "video"
            : _youtubeUrl.isNotEmpty
                ? "youtubeUrl"
                : "text";
    try {
      await ref.read(postProvider).createPost(
            images: _pickedImages,
            video: _pickedVideo,
            desc: _description,
            url: _youtubeUrl,
            type: type,
            latitude: lat,
            longitude: long,
          );
      Navigator.pop(context);
      successDialog(context, onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
      });
    } catch (e) {
      Navigator.pop(context);
      failDialog(context);
    }
  }

  @override
  void dispose() {
    _description = "";
    _youtubeUrl = "";
    _pickedVideo = null;
    _pickedImages.clear();
    super.dispose();
  }
}
