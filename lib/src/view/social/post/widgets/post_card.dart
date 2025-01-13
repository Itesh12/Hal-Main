import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/constants/colors.dart';
import 'package:kisaan_station/src/view/social/post/widgets/comment_bottom.dart';
import 'package:kisaan_station/src/view/social/post/widgets/normal_video_player_widget.dart';
import 'package:kisaan_station/src/view/social/post/widgets/post_bottom.dart';
import 'package:kisaan_station/src/view/social/post/widgets/post_image_preview.dart';
import 'package:kisaan_station/src/view/social/post/widgets/post_top.dart';
import 'package:kisaan_station/src/view/social/post/widgets/youtube_placeholder.dart';
import 'package:kisaan_station/src/view/social/post/widgets/youtube_video_player_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../app/router/router.gr.dart';
import '../../../../model/social/post/post_model.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    Key? key,
    required this.post,
    this.inDetail = false,
    this.inMyProfile = false,
  }) : super(key: key);

  final Post post;
  final bool inDetail;
  final bool inMyProfile;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Color(0xffE1E1E1)),
            bottom: BorderSide(color: Color(0xffE1E1E1)),
          ),
          color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PostTop(post: post, inMyProfile: inMyProfile),
          if (post.postDescription.isNotEmpty) TextPreviewWidget(post: post),
          MediaDisplayWidget(
            post: post,
            inDetail: inDetail,
            context: context,
            postType: post.postType,
          ),
          PostBottom(rawPost: post),
          CommentBottom(post: post),
        ],
      ),
    );
  }
}

class MediaDisplayWidget extends StatelessWidget {
  const MediaDisplayWidget({
    Key? key,
    required this.post,
    required this.inDetail,
    required this.context,
    required this.postType,
  }) : super(key: key);

  final Post post;
  final bool inDetail;
  final BuildContext context;
  final String postType;

  @override
  Widget build(BuildContext context) {
    switch (postType) {
      case "image":
        return PostImagePreview(images: post.media);
      case "video":
        return KVideoPlayer(url: post.media[0].mediaUrl);
      case "youtubeUrl":
        return YoutubePreview(inDetail: inDetail, post: post, context: context);
      default:
        return const SizedBox();
    }
  }
}

class YoutubePreview extends StatelessWidget {
  const YoutubePreview({
    Key? key,
    required this.inDetail,
    required this.post,
    required this.context,
  }) : super(key: key);

  final bool inDetail;
  final Post post;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return inDetail
        ? YoutubeOnScreen(
            videoURL: post.link!,
          )
        : InkWell(
            onTap: () {
              context.router.push(PostDetailRoute(postId: post.postId));
            },
            child: YoutubePlaceholder(
              videoURL: post.link!,
              inCard: true,
            ),
          );
  }
}

class TextPreviewWidget extends StatefulWidget {
  const TextPreviewWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  State<TextPreviewWidget> createState() => _TextPreviewWidgetState();
}

class _TextPreviewWidgetState extends State<TextPreviewWidget> {
  late String firstHalf;
  late String secondHalf;
  late String urlLink;
  // RegExp exp = RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');

  bool flag = true;

  // @override
  // void initState() {
  //   super.initState();
  //   final Iterable<RegExpMatch> matches =
  //       exp.allMatches(widget.post.postDescription);
  //   for (final match in matches) {
  //     urlLink = widget.post.postDescription.substring(match.start, match.end);
  //   }
  //   if (widget.post.postDescription.length > 200) {
  //     firstHalf = widget.post.postDescription.substring(0, 200);
  //     secondHalf = widget.post.postDescription
  //         .substring(200, widget.post.postDescription.length);
  //   } else {
  //     firstHalf = widget.post.postDescription;
  //     secondHalf = "";
  //   }
  // }

  bool descTextShowFlag = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.post.postDescription.replaceAll(" ", "").length >= 250)
                Linkify(
                  onOpen: (link) async {
                    context.router
                        .push(InAppViewRoute(url: Uri.parse(link.url)));
                  },
                  text: widget.post.postDescription,
                  maxLines: descTextShowFlag ? null : 5,
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                )
              else
                Linkify(
                  onOpen: (link) async {
                    context.router
                        .push(InAppViewRoute(url: Uri.parse(link.url)));
                  },
                  text: widget.post.postDescription,
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                ),
              if (widget.post.postDescription.replaceAll(" ", "").length >= 250)
                InkWell(
                  onTap: () {
                    setState(() {
                      descTextShowFlag = !descTextShowFlag;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      if (descTextShowFlag)
                        Text(
                          "read less",
                          style: TextStyle(color: primary, fontSize: 14.sp),
                        )
                      else
                        Text(
                          "Read more..",
                          style: TextStyle(color: primary, fontSize: 14.sp),
                        )
                    ],
                  ),
                )
              else
                const SizedBox(),
            ],
          )),

          // Flexible(
          //     child: Text.rich(
          //       TextSpan(
          //         children: [
          //           if (200 < widget.post.postDescription.length)
          //             TextSpan(
          //               style: TextStyle(
          //                   fontSize: 16.sp, fontWeight: FontWeight.w400),
          //               children: [
          //                 WidgetSpan(
          //                   child: Linkify(
          //                     onOpen: (link) async {
          //                       final Uri _url = Uri.parse(urlLink);
          //                       context.router.push(InAppViewRoute(url: _url));
          //
          //                       // await launchUrl(
          //                       //   _url,
          //                       //   mode: LaunchMode.inAppWebView,
          //                       // );
          //                       debugPrint(_url.toString());
          //                     },
          //                     style: TextStyle(
          //                         fontSize: 16.sp, fontWeight: FontWeight.w400),
          //                     text: flag
          //                         ? ("$firstHalf...")
          //                         : (firstHalf + secondHalf),
          //                   ),
          //                 ),
          //                 const TextSpan(text: ' '),
          //                 TextSpan(
          //                     text: flag ? "Read more..." : "read less",
          //                     style: TextStyle(color: primary, fontSize: 14.sp),
          //                     recognizer: TapGestureRecognizer()
          //                       ..onTap = () async {
          //                         setState(() {
          //
          //                           flag = !flag;
          //                         });
          //                       })
          //               ],
          //             )
          //           else
          //             WidgetSpan(
          //               child: Linkify(
          //                 onOpen: (link) async {
          //                   final Uri _url = Uri.parse(urlLink);
          //                   context.router.push(InAppViewRoute(url: _url));
          //
          //                   debugPrint(_url.toString());
          //                 },
          //                 style: TextStyle(
          //                   fontSize: 16.sp,
          //                   fontWeight: FontWeight.w400,
          //                 ),
          //                 text: firstHalf,
          //               ),
          //             )
          //         ],
          //       ),
          //       textAlign: TextAlign.start,
          //       softWrap: true,
          //       overflow: TextOverflow.clip,
          //     ),
          //   )
        ],
      ),
    );
  }
}

@RoutePage()
class InAppViewPage extends StatefulWidget {
  const InAppViewPage({Key? key, required this.url}) : super(key: key);
  final Uri url;

  @override
  _InAppViewState createState() => _InAppViewState();
}

class _InAppViewState extends State<InAppViewPage> {
  double _progress = 0;
  late InAppWebViewController webView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          leading: IconButton(
            onPressed: () {
              context.router.pop();
            },
            icon: Icon(
              Icons.close,
              color: brown,
              size: 20.sp,
            ),
          ),
          centerTitle: false,
          title: Text(
            widget.url.toString(),
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: PopupMenuButton<int>(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8)),
                ),
                elevation: 2,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                offset: const Offset(55, 56.5),
                child: const Icon(
                  Icons.more_vert_rounded,
                  size: 22,
                  color: Colors.black,
                ),
                onSelected: (value) async {},
                itemBuilder: (context) => [
                  PopupMenuItem(
                    padding: EdgeInsets.zero,
                    height: 40,
                    value: 1,
                    child: InkWell(
                      onTap: () async {
                        context.router.pop();
                        await launchUrl(
                          widget.url,
                          mode: LaunchMode.externalApplication,
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Center(
                          child: Text(
                            "Open in Brower",
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            InAppWebView(
              initialUrlRequest: URLRequest(url: WebUri(widget.url.toString())),
              onWebViewCreated: (InAppWebViewController controller) {
                webView = controller;
              },
              onProgressChanged:
                  (InAppWebViewController controller, int progress) {
                setState(() {
                  _progress = progress / 100;
                });
              },
            ),
            if (_progress < 1)
              SizedBox(
                height: 3,
                child: LinearProgressIndicator(
                  value: _progress,
                  backgroundColor:
                      Theme.of(context).colorScheme.background.withOpacity(0.2),
                ),
              )
            else
              const SizedBox(),
          ],
        ));
  }
}
