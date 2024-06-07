import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:readmore/readmore.dart';

import '../../../../../global_providers.dart';
import '../../../../app/router/router.gr.dart';
import '../../../../model/social/post/comment_model.dart';
import '../../../../model/social/post/post_model.dart';
import '../../../../util/services/shared_preferences.dart';
import '../../../widget/profile_image.dart';

class ReplyTile extends StatelessWidget {
  const ReplyTile({
    Key? key,
    required this.reply,
    this.comment,
    this.post,
  }) : super(key: key);

  final Comment reply;
  final Comment? comment;
  final Post? post;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = ThemeData().textTheme;
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10),
      child: Column(
        children: [
          if (comment != null && comment!.repliesCount > 1)
            Row(
              children: [
                55.horizontalSpace,
                InkWell(
                  onTap: () {
                    context.router.push(ReplyRoute(
                      postId: post!.postId,
                      comment: comment!,
                    ));
                  },
                  child: Text(
                    'Show previous replies...',
                    style: textTheme.bodyMedium!.copyWith(
                        color: Colors.black87, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          10.verticalSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              40.horizontalSpace,
              Column(
                children: [
                  10.verticalSpace,
                  ProfilePicWidget(
                    url: reply.userProfileImage,
                    size: 26,
                    fizedSize: true,
                  ),
                ],
              ),
              10.horizontalSpace,
              Expanded(
                child: Container(
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
                              text: '${reply.name}   ',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            // TextSpan(text: reply.message)
                          ],
                        ),
                      ),
                      Text(
                        GetTimeAgo.parse(reply.createdAt)
                            .replaceFirst('-', '')
                            .replaceFirst('ago', ''),
                        style: textTheme.bodySmall!.copyWith(
                          color: const Color(
                            0xff8D8D8D,
                          ),
                        ),
                      ),
                      10.verticalSpace,
                      ReadMoreText(
                        reply.message ?? '',
                        colorClickableText: const Color(0xff8D8D8D),
                        trimCollapsedText: ' see more',
                        trimExpandedText: '',
                        style: const TextStyle(
                            fontSize: 16, color: Colors.black87),
                      ),
                      3.verticalSpace,
                    ],
                  ),
                ),
              ),
              10.horizontalSpace,
            ],
          ),
          if (reply.userId == UserPreferences.userId)
            Consumer(builder: (context, ref, child) {
              return InkWell(
                onTap: () async {
                  await ref
                      .read(perticularPostController(post!).notifier)
                      .deleteComment(postId: post!.postId, commentId: reply.id);
                  ref.refresh(singleReplyProvider(comment!.id));

                  ref
                      .read(perticularCommentController(comment!).notifier)
                      .decrementReplyCount(0);
                  ref
                      .read(perticularPostController(post!).notifier)
                      .decrementCommentCount(0);
                },
                child: Row(
                  children: [
                    80.horizontalSpace,
                    const Icon(
                      Icons.delete_outlined,
                      size: 15,
                    ),
                    5.horizontalSpace,
                    const Text('Delete'),
                  ],
                ),
              );
            })
        ],
      ),
    );
  }
}
