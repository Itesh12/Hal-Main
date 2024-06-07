import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisaan_station/global_providers.dart';
import 'package:kisaan_station/src/view/shimmer/comment_shimmer.dart';
import 'package:kisaan_station/src/view/widget/no_item_widget.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/page_padding.dart';
import '../../../../model/social/post/post_model.dart';
import 'comment_tile.dart';

class PagedComment extends ConsumerWidget {
  const PagedComment({
    Key? key,
    required this.entityId,
    this.post,
  }) : super(key: key);

  final String entityId;
  final Post? post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _commentListController = ref.watch(commentListProvider(entityId));

    final comments = _commentListController.comments;

    return _commentListController.isFirstLoadRunning
        ? const SliverToBoxAdapter(child: CommentShimmer())
        : _commentListController.isFirstError
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
                            _commentListController.firstErrorMessage,
                            style: const TextStyle(color: redError),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (_commentListController.firstErrorMessage !=
                                "Session Expired...") {
                              _commentListController.refresh();
                            } else {}
                          },
                          child: Text(
                              _commentListController.firstErrorMessage ==
                                      "Session Expired..."
                                  ? "SignIn Again"
                                  : "Retry"),
                        )
                      ],
                    ),
                  ),
                ),
              )
            : comments.isNotEmpty
                ? SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final int reverseIndex = comments.length - index - 1;
                        if (reverseIndex == -1) {
                          if (_commentListController.isLoadMoreRunning) {
                            return const Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 40),
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          } else if (_commentListController.isLoadMoreError) {
                            return Container(
                              padding:
                                  const EdgeInsets.only(top: 30, bottom: 40),
                              color: Colors.white,
                              child: Center(
                                child: Text(
                                  _commentListController.loadMoreErrorMessage,
                                  style: const TextStyle(color: redError),
                                ),
                              ),
                            );
                          } else {
                            return const SizedBox();
                          }
                        } else {
                          return Padding(
                            padding: pagePadding,
                            child: CommentTile(
                              comment: comments[reverseIndex],
                              post: post,
                              index: reverseIndex,
                            ),
                          );
                        }
                      },
                      childCount: comments.length + 1,
                    ),
                  )
                : const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 400,
                      child: NoItemWidget(
                        title: "No Comments",
                        subTitle: "Share what you think",
                      ),
                    ),
                  );
  }
}
