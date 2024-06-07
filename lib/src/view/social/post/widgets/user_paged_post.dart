import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisaan_station/global_providers.dart';
import 'package:kisaan_station/src/view/shimmer/post_shimmer.dart';
import 'package:kisaan_station/src/view/social/post/widgets/post_card.dart';
import 'package:kisaan_station/src/view/widget/no_item_widget.dart';

import '../../../../constants/colors.dart';

class UserPagedPost extends ConsumerWidget {
  const UserPagedPost({
    Key? key,
    required this.userId,
  }) : super(key: key);
  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _postListController = ref.watch(userPostListProvider(userId));
    final posts = _postListController.posts;

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
                        if (index == posts.length) {
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
                        } else {
                          return PostCard(
                            post: posts[index],
                            inMyProfile: true,
                          );
                        }
                      },
                      childCount: posts.length + 1,
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
