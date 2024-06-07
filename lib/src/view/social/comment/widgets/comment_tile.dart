import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:kisaan_station/global_providers.dart';
import 'package:kisaan_station/src/model/social/post/comment_model.dart';
import 'package:kisaan_station/src/util/services/shared_preferences.dart';
import 'package:kisaan_station/src/view/shimmer/comment_shimmer.dart';
import 'package:readmore/readmore.dart';

import '../../../../app/router/router.gr.dart';
import '../../../../model/social/post/post_model.dart';
import '../../../widget/profile_image.dart';
import 'reply_tile.dart';

class CommentTile extends StatelessWidget {
  const CommentTile({
    Key? key,
    required this.comment,
    this.post,
    this.isReply = false,
    required this.index,
    this.parentComment,
  }) : super(key: key);

  final Comment comment;
  final Comment? parentComment;
  final bool isReply;
  final Post? post;
  final int? index;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = ThemeData().textTheme;
    return Consumer(builder: (context, ref, child) {
      final replyCount = ref.watch(perticularCommentController(comment)
          .select((value) => value.repliesCount));
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    10.verticalSpace,
                    ProfilePicWidget(
                      url: comment.userProfileImage,
                      size: 40,
                      fizedSize: true,
                    ),
                  ],
                ),
                10.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 285.w,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: const Color(0xffF2F2F2),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.r),
                              bottomLeft: Radius.circular(10.r),
                              bottomRight: Radius.circular(10.r))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '${comment.name}   ',
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            GetTimeAgo.parse(comment.createdAt)
                                .replaceFirst('-', '')
                                .replaceFirst('ago', ''),
                            style: textTheme.bodySmall!.copyWith(
                              color: const Color(0xff8D8D8D),
                            ),
                          ),
                          10.verticalSpace,
                          ReadMoreText(
                            comment.message ?? '',
                            colorClickableText: const Color(0xff8D8D8D),
                            trimCollapsedText: ' see more',
                            trimExpandedText: '',
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                    10.verticalSpace,
                    Row(
                      children: [
                        if (!isReply)
                          InkWell(
                            onTap: () {
                              context.router.push(ReplyRoute(
                                postId: post!.postId,
                                comment: comment,
                              ));
                            },
                            child: Row(
                              children: [
                                10.horizontalSpace,
                                Text(
                                  'Reply',
                                  style: textTheme.bodyMedium!.copyWith(
                                      color: const Color(0xff5C5C5C),
                                      fontWeight: FontWeight.w500),
                                ),
                                10.horizontalSpace,
                                Container(
                                  height: 3.h,
                                  width: 3.w,
                                  decoration: const BoxDecoration(
                                    color: Color(0xff5C5C5C),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                10.horizontalSpace,
                                Text(
                                  '$replyCount replies',
                                  style: textTheme.bodyMedium!
                                      .copyWith(color: const Color(0xff6E6E6E)),
                                ),
                                10.horizontalSpace,
                              ],
                            ),
                          ),
                        if (comment.userId == UserPreferences.userId)
                          InkWell(
                            onTap: () async {
                              final repliesCount = comment.repliesCount;
                              await ref
                                  .read(
                                      perticularPostController(post!).notifier)
                                  .deleteComment(
                                      postId: post!.postId,
                                      commentId: comment.id);
                              if (isReply) {
                                ref
                                    .read(replyListProvider(parentComment!.id)
                                        .notifier)
                                    .removeReply(index!);
                                ref
                                    .read(perticularCommentController(
                                            parentComment!)
                                        .notifier)
                                    .decrementReplyCount(0);
                                ref
                                    .read(perticularPostController(post!)
                                        .notifier)
                                    .decrementCommentCount(0);
                              } else {
                                ref
                                    .read(commentListProvider(post!.postId))
                                    .removeComment(index!);
                                ref
                                    .read(perticularPostController(post!)
                                        .notifier)
                                    .decrementCommentCount(repliesCount);
                              }
                            },
                            child: const Text('Delete'),
                          )
                      ],
                    )
                  ],
                ),
                // Material(
                //   color: Colors.white,
                //   child: InkWell(
                //     onTap: () {
                //       isCommentLiked = !isCommentLiked;
                //       setState(() {});
                //     },
                //     borderRadius: BorderRadius.circular(30),
                //     child: Padding(
                //       padding: const EdgeInsets.all(8),
                //       child: SvgPicture.asset(
                //         isCommentLiked
                //             ? "assets/images/heartFilled.svg"
                //             : "assets/images/heart.svg",
                //         height: 12.h,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
            if (replyCount > 0)
              Consumer(builder: (context, ref, child) {
                final res = ref.watch(singleReplyProvider(comment.id));
                return res.when(
                  data: (reply) {
                    if (reply.isNotEmpty) {
                      if (comment.repliesCount == 1) {
                        return ReplyTile(
                          reply: reply[0],
                          comment: comment,
                          post: post,
                        );
                      } else {
                        return ReplyTile(
                          reply: reply[0],
                          comment: comment,
                          post: post,
                        );
                      }
                    } else {
                      return const SizedBox();
                    }
                  },
                  error: (_, __) => const SizedBox(),
                  loading: () => const ReplyShimmer(),
                );
              }),
          ],
        ),
      );
    });
  }
}
