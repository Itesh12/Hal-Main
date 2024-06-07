import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlaceholder extends ConsumerStatefulWidget {
  const YoutubePlaceholder({
    Key? key,
    required this.videoURL,
    this.canEdit = false,
    this.inCard = false,
    this.onTap,
  }) : super(key: key);

  final String videoURL;
  final bool canEdit;
  final bool inCard;
  final Function()? onTap;

  @override
  _YoutubePlaceholderState createState() => _YoutubePlaceholderState();
}

class _YoutubePlaceholderState extends ConsumerState<YoutubePlaceholder> {
  String? _videoID;

  @override
  void initState() {
    final test = YoutubePlayer.convertUrlToId(widget.videoURL);
    if (test == null) {
      _videoID = widget.videoURL.substring(27, 38);
    } else {
      _videoID = test;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: widget.inCard ? null : BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: ClipRRect(
          borderRadius:
              widget.inCard ? BorderRadius.zero : BorderRadius.circular(9),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(
                      "https://img.youtube.com/vi/$_videoID/0.jpg"),
                  fit: BoxFit.cover,
                )),
                alignment: Alignment.center,
              ),
              if (widget.canEdit)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    height: 18,
                    width: 18,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black54),
                    child: InkWell(
                      onTap: widget.onTap,
                      child: const Center(
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              if (widget.inCard)
                const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 50,
                )
            ],
          ),
        ),
      ),
    );
  }
}
