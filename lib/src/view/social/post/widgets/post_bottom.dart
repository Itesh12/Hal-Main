import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kisaan_station/src/constants/colors.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../global_providers.dart';
import '../../../../app/router/router.gr.dart';
import '../../../../l10n/l10n.dart';
import '../../../../model/social/post/post_model.dart';

class PostBottom extends ConsumerStatefulWidget {
  const PostBottom({Key? key, required this.rawPost}) : super(key: key);

  final Post rawPost;

  @override
  _PostBottomState createState() => _PostBottomState();
}

class _PostBottomState extends ConsumerState<PostBottom> {
  Uri? link;

  // Future<void> dynamicLinkCreate() async {
  //   // final desc = widget.rawPost.postDescription.isNotEmpty
  //   //     ? widget.rawPost.postDescription
  //   //     : null;
  //   // final image = widget.rawPost.postType == "image"
  //   //     ? widget.rawPost.media[0].mediaUrl
  //   //     : null;
  //   final postId = widget.rawPost.postId;
  //   link = await ref.read(dynamicLinkProvider).createDynamicLinkSharePost(
  //         postId: postId,
  //         // desc: desc,
  //         // image: image,
  //       );
  // }

  @override
  void initState() {
    // dynamicLinkCreate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final postCallBack =
        ref.read(perticularPostController(widget.rawPost).notifier);
    final post = ref.watch(perticularPostController(widget.rawPost));

    return Column(
      children: [
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 13.h),
        //   child: const Divider(height: 1),
        // ),
        Padding(
          padding: const EdgeInsets.fromLTRB(14, 8, 14, 4),
          child: Row(
            children: <Widget>[
              Row(
                children: [
                  Material(
                    color: Colors.white,
                    child: InkWell(
                      onTap: () async {
                        await postCallBack.likePost(
                            likeStat: !post.likeDislike, entityId: post.postId);
                      },
                      borderRadius: BorderRadius.circular(30),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: SvgPicture.asset(
                          post.likeDislike
                              ? "assets/images/heartFilled.svg"
                              : "assets/images/heart.svg",
                          color: post.likeDislike ? null : brown,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "${post.totalLikes} ${AppLocalizations.of(context)!.likes}",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0XFF777777),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12),
              Material(
                color: Colors.white,
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {
                    context.pushRoute(CommentRoute(postId: post.postId));
                  },
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 6),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/chat.svg",
                            height: 18,
                            width: 18,
                            color: brown,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "${post.commentCount} ${AppLocalizations.of(context)!.comments}",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0XFF777777),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              // const SizedBox(width: 8),
              // Material(
              //   color: Colors.white,
              //   child: InkWell(
              //       borderRadius: BorderRadius.circular(30),
              //       onTap: () {
              //         Share.share("$link");
              //       },
              //       child: Padding(
              //         padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
              //         child: Transform.rotate(
              //           angle: -math.pi / 3.5,
              //           child: SvgPicture.asset(
              //             "assets/images/send.svg",
              //             color: brown,
              //             width: 18,
              //           ),
              //         ),
              //       )),
              // ),
              // const Spacer(),
              // Material(
              //   color: Colors.white,
              //   child: InkWell(
              //       borderRadius: BorderRadius.circular(30),
              //       onTap: () {},
              //       child: Padding(
              //         padding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
              //         child: SvgPicture.asset(
              //           "assets/images/bookmark.svg",
              //           color: brown,
              //           // width: 18,
              //         ),
              //       )),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
