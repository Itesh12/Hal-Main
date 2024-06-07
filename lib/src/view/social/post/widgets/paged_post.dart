import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/global_providers.dart';
import 'package:kisaan_station/src/view/shimmer/post_shimmer.dart';
import 'package:kisaan_station/src/view/social/post/widgets/post_card.dart';
import 'package:kisaan_station/src/view/widget/no_item_widget.dart';

import '../../../../constants/colors.dart';

class PagedPost extends ConsumerWidget {
  const PagedPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _postListController = ref.watch(postListProvider);
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
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeScreen(),
                                              ));
                                        },
                                        child: Container(
                                          width: 180.w,
                                          height: 220.w,
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                        width: 20.w,
                                      );
                                    },
                                    itemCount: 6,
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

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        height: 100,
        child: PageView(
          controller: controller,
          scrollDirection: Axis.vertical,
          padEnds: false,
          children: const [
            SinglePage(
              color: Colors.red,
            ),
            SinglePage(
              color: Colors.green,
            ),
            SinglePage(
              color: Colors.yellow,
            ),
            SinglePage(color: Colors.amber),
            SinglePage(
              color: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}

class SinglePage extends StatelessWidget {
  const SinglePage({
    Key? key,
    required this.color,
  }) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(color: color),
      const Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
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
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 20,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Name of user",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Text(
                      "This is the very long description of the videos which has many lines This is the very long description of the videos which has many lines This is the very long description of the videos which has many lines This is the very long description of the videos which has many lines",
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 2,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Flexible(flex: 1, child: Buttons())
            ],
          ),
        ),
      )
    ]);
  }
}

class Buttons extends StatelessWidget {
  const Buttons({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.heart_broken_outlined,
              color: Colors.white,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.message_outlined,
              color: Colors.white,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              color: Colors.white,
            )),
      ],
    );
  }
}
