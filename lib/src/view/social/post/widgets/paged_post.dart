import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/global_providers.dart';
import 'package:kisaan_station/src/model/reels/reels_model.dart';
import 'package:kisaan_station/src/view/shimmer/post_shimmer.dart';
import 'package:kisaan_station/src/view/social/post/widgets/post_card.dart';
import 'package:kisaan_station/src/view/widget/no_item_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import '../../../../constants/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PagedPost extends ConsumerWidget {
  const PagedPost({Key? key}) : super(key: key);

  Future<String> _getThumbnail(String videoUrl) async {
    final tempDir = await getTemporaryDirectory();
    final thumbnailPath = await VideoThumbnail.thumbnailFile(
      video: videoUrl,
      thumbnailPath: tempDir.path,
      imageFormat: ImageFormat.JPEG,
      maxHeight: 250,
      quality: 75,
    );

    // Debugging: Print the path of the generated thumbnail
    debugPrint('Thumbnail generated at: $thumbnailPath');

    return thumbnailPath!;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _postListController = ref.watch(postListProvider);
    final posts = _postListController.posts;

    final List<ReelModel> reelList = <ReelModel>[
      ReelModel(
        title: 'qwerty',
        likes: 10,
        userId: 1,
        video:
            "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        comments: [Comment(text: 'duihudf', userId: 1)],
      ),
      ReelModel(
        title: 'qwerty',
        likes: 10,
        userId: 1,
        video:
            "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
        comments: [Comment(text: 'duihudf', userId: 1)],
      ),
      ReelModel(
        title: 'qwerty',
        likes: 10,
        userId: 1,
        video:
            "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        comments: [Comment(text: 'duihudf', userId: 1)],
      ),
      ReelModel(
        title: 'qwerty',
        likes: 10,
        userId: 1,
        video:
            "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
        comments: [Comment(text: 'duihudf', userId: 1)],
      ),
      ReelModel(
        title: 'qwerty',
        likes: 10,
        userId: 1,
        video:
            "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        comments: [Comment(text: 'duihudf', userId: 1)],
      ),
    ];

    return _postListController.isFirstLoadRunning
        ? const SliverToBoxAdapter(
            child: PostShimmer(),
          )
        : _postListController.isFirstError
            ? SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.only(top: 30, bottom: 40),
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 40),
                          child: Text(
                            _postListController.firstErrorMessage,
                            style: const TextStyle(color: redError),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (_postListController.firstErrorMessage !=
                                "Session Expired...") {
                              _postListController.refresh(context);
                            } else {}
                          },
                          child: Text(_postListController.firstErrorMessage ==
                                  "Session Expired..."
                              ? "SignIn Again"
                              : "Retry"),
                        )
                      ],
                    ),
                  ),
                ),
              )
            : posts.isNotEmpty
                ? SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (index == posts.length + (posts.length ~/ 5)) {
                          if (_postListController.isLoadMoreRunning) {
                            return const Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 40),
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          } else if (_postListController.isLoadMoreError) {
                            return Container(
                              padding:
                                  const EdgeInsets.only(top: 30, bottom: 40),
                              color: Colors.white,
                              child: Center(
                                child: Text(
                                  _postListController.loadMoreErrorMessage,
                                  style: const TextStyle(color: redError),
                                ),
                              ),
                            );
                          } else {
                            return const SizedBox();
                          }
                        } else if ((index + 1) % 6 == 0) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Suggested Reels',
                                  style: TextStyle(
                                      color: primary,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 10.h),
                                SizedBox(
                                  height: 250.h,
                                  child: ListView.separated(
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemBuilder: (context, reelIndex) {
                                      final reel = reelList[reelIndex];
                                      return FutureBuilder<String>(
                                        future: _getThumbnail(reel.video),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return Container(
                                              width: 180.w,
                                              height: 220.w,
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: const Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                            );
                                          } else if (snapshot.hasError) {
                                            return Container(
                                              width: 180.w,
                                              height: 220.w,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Center(
                                                  child: Text(snapshot.error!
                                                      .toString())),
                                            );
                                          } else {
                                            return InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ReelScreen(),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                width: 180.w,
                                                height: 220.w,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  image: DecorationImage(
                                                    image: FileImage(
                                                        File(snapshot.data!)),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                        width: 20.w,
                                      );
                                    },
                                    itemCount: reelList.length,
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          // Adjust index to account for additional "Hello World" cards
                          final adjustedIndex = index - (index ~/ 6);
                          return PostCard(post: posts[adjustedIndex]);
                        }
                      },
                      childCount: posts.length + (posts.length ~/ 5) + 1,
                    ),
                  )
                : const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 400,
                      child: NoItemWidget(
                        title: "No Post",
                        subTitle: "Share what you think",
                      ),
                    ),
                  );
  }
}

// class PagedPost extends ConsumerWidget {
//   const PagedPost({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final _postListController = ref.watch(postListProvider);
//     final posts = _postListController.posts;
//
//     final List<ReelModel> reelList = <ReelModel>[
//       ReelModel(
//         title: 'qwerty',
//         likes: 10,
//         userId: 1,
//         video:
//             "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
//         comments: [
//           Comment(
//             text: 'duihudf',
//             userId: 1,
//           )
//         ],
//       ),
//       ReelModel(
//         title: 'qwerty',
//         likes: 10,
//         userId: 1,
//         video:
//             "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
//         comments: [
//           Comment(
//             text: 'duihudf',
//             userId: 1,
//           )
//         ],
//       ),
//       ReelModel(
//         title: 'qwerty',
//         likes: 10,
//         userId: 1,
//         video:
//             "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
//         comments: [
//           Comment(
//             text: 'duihudf',
//             userId: 1,
//           )
//         ],
//       ),
//       ReelModel(
//         title: 'qwerty',
//         likes: 10,
//         userId: 1,
//         video:
//             "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
//         comments: [
//           Comment(
//             text: 'duihudf',
//             userId: 1,
//           )
//         ],
//       ),
//       ReelModel(
//         title: 'qwerty',
//         likes: 10,
//         userId: 1,
//         video:
//             "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
//         comments: [
//           Comment(
//             text: 'duihudf',
//             userId: 1,
//           )
//         ],
//       ),
//       ReelModel(
//         title: 'qwerty',
//         likes: 10,
//         userId: 1,
//         video:
//             "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
//         comments: [
//           Comment(
//             text: 'duihudf',
//             userId: 1,
//           )
//         ],
//       ),
//     ];
//
//     return _postListController.isFirstLoadRunning
//         ? const SliverToBoxAdapter(
//             child: PostShimmer(),
//           )
//         : _postListController.isFirstError
//             ? SliverToBoxAdapter(
//                 child: Container(
//                   padding: const EdgeInsets.only(top: 30, bottom: 40),
//                   color: Colors.white,
//                   child: Center(
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 40),
//                           child: Text(
//                             _postListController.firstErrorMessage,
//                             style: const TextStyle(color: redError),
//                           ),
//                         ),
//                         ElevatedButton(
//                           onPressed: () async {
//                             if (_postListController.firstErrorMessage !=
//                                 "Session Expired...") {
//                               _postListController.refresh(context);
//                             } else {}
//                           },
//                           child: Text(_postListController.firstErrorMessage ==
//                                   "Session Expired..."
//                               ? "SignIn Again"
//                               : "Retry"),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               )
//             : posts.isNotEmpty
//                 ? SliverList(
//                     delegate: SliverChildBuilderDelegate(
//                       (context, index) {
//                         if (index == posts.length + (posts.length ~/ 5)) {
//                           if (_postListController.isLoadMoreRunning) {
//                             return const Padding(
//                               padding: EdgeInsets.only(top: 10, bottom: 40),
//                               child: Center(
//                                 child: CircularProgressIndicator(),
//                               ),
//                             );
//                           } else if (_postListController.isLoadMoreError) {
//                             return Container(
//                               padding:
//                                   const EdgeInsets.only(top: 30, bottom: 40),
//                               color: Colors.white,
//                               child: Center(
//                                 child: Text(
//                                   _postListController.loadMoreErrorMessage,
//                                   style: const TextStyle(color: redError),
//                                 ),
//                               ),
//                             );
//                           } else {
//                             return const SizedBox();
//                           }
//                         } else if ((index + 1) % 6 == 0) {
//                           return Padding(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 10.w, vertical: 10.h),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'Suggested Reels',
//                                   style: TextStyle(
//                                       color: primary,
//                                       fontSize: 16.sp,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                                 SizedBox(height: 10.h),
//                                 SizedBox(
//                                   height: 250.h,
//                                   child: ListView.separated(
//                                     physics: const BouncingScrollPhysics(),
//                                     scrollDirection: Axis.horizontal,
//                                     shrinkWrap: true,
//                                     itemBuilder: (context, index) {
//                                       return InkWell(
//                                         onTap: () {
//                                           Navigator.push(
//                                               context,
//                                               MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     ReelScreen(),
//                                               ));
//                                         },
//                                         child: Container(
//                                           width: 180.w,
//                                           height: 220.w,
//                                           decoration: BoxDecoration(
//                                             color: Colors.blue,
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                           ),
//                                         ),
//                                       );
//                                     },
//                                     separatorBuilder: (context, index) {
//                                       return SizedBox(
//                                         width: 20.w,
//                                       );
//                                     },
//                                     itemCount: 6,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         } else {
//                           // Adjust index to account for additional "Hello World" cards
//                           final adjustedIndex = index - (index ~/ 6);
//                           return PostCard(post: posts[adjustedIndex]);
//                         }
//                       },
//                       childCount: posts.length + (posts.length ~/ 5) + 1,
//                     ),
//                   )
//                 : const SliverToBoxAdapter(
//                     child: SizedBox(
//                       height: 400,
//                       child: NoItemWidget(
//                         title: "No Post",
//                         subTitle: "Share what you think",
//                       ),
//                     ),
//                   );
//   }
// }

class ReelScreen extends StatelessWidget {
  ReelScreen({Key? key}) : super(key: key);
  final controller = PageController();
  final List<ReelModel> reelList = <ReelModel>[
    ReelModel(
      title: 'qwerty',
      likes: 10,
      userId: 1,
      video:
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
      comments: [
        Comment(
          text: 'duihudf',
          userId: 1,
        )
      ],
    ),
    ReelModel(
      title: 'qwerty',
      likes: 10,
      userId: 1,
      video:
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
      comments: [
        Comment(
          text: 'duihudf',
          userId: 1,
        )
      ],
    ),
    ReelModel(
      title: 'qwerty',
      likes: 10,
      userId: 1,
      video:
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
      comments: [
        Comment(
          text: 'duihudf',
          userId: 1,
        )
      ],
    ),
    ReelModel(
      title: 'qwerty',
      likes: 10,
      userId: 1,
      video:
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
      comments: [
        Comment(
          text: 'duihudf',
          userId: 1,
        )
      ],
    ),
    ReelModel(
      title: 'qwerty',
      likes: 10,
      userId: 1,
      video:
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
      comments: [
        Comment(
          text: 'duihudf',
          userId: 1,
        )
      ],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        height: 100,
        // child: PageView(
        //   controller: controller,
        //   scrollDirection: Axis.vertical,
        //   padEnds: false,
        //   children: const [
        //     SinglePage(
        //       color: Colors.red,
        //     ),
        //     SinglePage(
        //       color: Colors.green,
        //     ),
        //     SinglePage(
        //       color: Colors.yellow,
        //     ),
        //     SinglePage(color: Colors.amber),
        //     SinglePage(
        //       color: Colors.purple,
        //     ),
        //   ],
        // ),
        child: PageView.builder(
          controller: controller,
          scrollDirection: Axis.vertical,
          padEnds: false,
          itemCount: reelList.length,
          itemBuilder: (context, index) {
            final reel = reelList[index];
            return SinglePage(
              color: Colors.primaries[index %
                  Colors.primaries
                      .length], // Just to give different colors for demonstration
              title: reel.title,
              likes: reel.likes,
              userName: 'User ${reel.userId}', // Dummy user name
              description: 'This is a description for ${reel.title}',
              commentCount: reel.comments.length,
              videoUrl: reel.video,
              pageController: controller,
              currentIndex: index,
              totalPages: reelList.length,
            );
          },
        ),
      ),
    );
  }
}

class SinglePage extends StatelessWidget {
  const SinglePage({
    Key? key,
    required this.videoUrl,
    required this.color,
    required this.title,
    required this.likes,
    required this.userName,
    required this.description,
    required this.commentCount,
    required this.pageController,
    required this.currentIndex,
    required this.totalPages,
  }) : super(key: key);

  final String videoUrl;
  final Color color;
  final String title;
  final int likes;
  final String userName;
  final String description;
  final int commentCount;
  final PageController pageController;
  final int currentIndex;
  final int totalPages;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Stack(
        children: [
          VideoPlayerScreen(
            videoUrl: videoUrl,
            pageController: pageController,
            currentIndex: currentIndex,
            totalPages: totalPages,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 10.w, bottom: 20.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 8,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.blue,
                              radius: 20,
                              child: Icon(Icons.person),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Text(
                              userName,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          description,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          maxLines: 2,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Buttons(
                      likes: likes,
                      commentCount: commentCount,
                      videoUrl: videoUrl,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;
  final PageController pageController;
  final int currentIndex;
  final int totalPages;

  const VideoPlayerScreen({
    Key? key,
    required this.videoUrl,
    required this.pageController,
    required this.currentIndex,
    required this.totalPages,
  }) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  int _loopCount = 0;
  bool _showPauseIcon = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {
          _controller.play();
          _controller.setLooping(false);
        });
      });

    _controller.addListener(() {
      if (_controller.value.position == _controller.value.duration) {
        _loopCount++;
        if (_loopCount < 2) {
          _controller.seekTo(Duration.zero);
          _controller.play();
        } else {
          if (widget.currentIndex < widget.totalPages - 1) {
            widget.pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.removeListener(() {});
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        _showPauseIcon = true;
      } else {
        _controller.play();
        _showPauseIcon = false;
      }
    });

    // Hide the pause icon after a short delay
    if (!_controller.value.isPlaying) {
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _showPauseIcon = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _togglePlayPause,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (_controller.value.isInitialized)
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
                ),
              ),
            )
          else
            const Center(child: CircularProgressIndicator()),
          if (_showPauseIcon)
            const Icon(
              Icons.pause_circle_outline,
              size: 60,
              color: Colors.white,
            ),
        ],
      ),
    );
  }
}

class Buttons extends StatefulWidget {
  const Buttons({
    Key? key,
    required this.likes,
    required this.commentCount,
    required this.videoUrl, // Add the video URL parameter
  }) : super(key: key);

  final int likes;
  final int commentCount;
  final String videoUrl; // Add the video URL field

  @override
  _ButtonsState createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  late int _likes;
  bool _isLiked = false;

  @override
  void initState() {
    super.initState();
    _likes = widget.likes;
  }

  void _toggleLike() {
    setState(() {
      if (_isLiked) {
        _likes -= 1;
      } else {
        _likes += 1;
      }
      _isLiked = !_isLiked;
    });
  }

  void _shareVideo() {
    Share.share(widget.videoUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: _toggleLike,
          icon: Icon(
            _isLiked ? Icons.favorite : Icons.favorite_border,
            color: _isLiked ? Colors.red : Colors.white,
          ),
        ),
        Text(
          '$_likes',
          style: const TextStyle(color: Colors.white),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.message_outlined,
            color: Colors.white,
          ),
        ),
        Text(
          '${widget.commentCount}',
          style: const TextStyle(color: Colors.white),
        ),
        IconButton(
          onPressed: _shareVideo, // Add the share button action
          icon: const Icon(
            Icons.share,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
