import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisaan_station/global_providers.dart';
import 'package:kisaan_station/src/view/shimmer/comment_shimmer.dart';
import 'package:kisaan_station/src/view/widget/no_item_widget.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/page_padding.dart';
import '../../../../model/social/post/comment_model.dart';
import '../../../../model/social/post/post_model.dart';
import 'comment_tile.dart';

class PagedReply extends ConsumerWidget {
  const PagedReply({
    required this.parentComment,
    required this.post,
    Key? key,
    required this.entityId,
  }) : super(key: key);

  final String entityId;
  final Comment parentComment;
  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _replyListController = ref.watch(replyListProvider(entityId));
    final replies = _replyListController.replies;

    return _replyListController.isFirstLoadRunning
        ? const CommentShimmer()
        : _replyListController.isFirstError
            ? Container(
                padding: const EdgeInsets.only(top: 30, bottom: 40),
                color: Colors.white,
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: Text(
                          _replyListController.firstErrorMessage,
                          style: const TextStyle(color: redError),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (_replyListController.firstErrorMessage !=
                              "Session Expired...") {
                            _replyListController.refresh();
                          } else {}
                        },
                        child: Text(_replyListController.firstErrorMessage ==
                                "Session Expired..."
                            ? "SignIn Again"
                            : "Retry"),
                      )
                    ],
                  ),
                ),
              )
            : replies.isNotEmpty
                ? ListView.builder(
                    padding: pagePadding,
                    controller: _replyListController.controller,
                    // reverse: true,
                    // shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    itemCount: replies.length + 1,
                    itemBuilder: (context, index) {
                      if (index == replies.length) {
                        if (_replyListController.isLoadMoreRunning) {
                          return const Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 40),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        } else if (_replyListController.isLoadMoreError) {
                          return Container(
                            padding: const EdgeInsets.only(top: 30, bottom: 40),
                            color: Colors.white,
                            child: Center(
                              child: Text(
                                _replyListController.loadMoreErrorMessage,
                                style: const TextStyle(color: redError),
                              ),
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
                      } else {
                        return CommentTile(
                          parentComment: parentComment,
                          comment: replies[index],
                          isReply: true,
                          index: index,
                          post: post,
                        );
                      }
                    },
                  )
                : const SizedBox(
                    height: 400,
                    child: NoItemWidget(
                      title: "No Replies",
                      subTitle: "Share what you think",
                    ),
                  );
  }
}
