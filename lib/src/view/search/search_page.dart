import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/util/search_bar.dart';
import 'package:kisaan_station/src/util/services/shared_preferences.dart';
import 'package:kisaan_station/src/view/search/searched_user_tile.dart';

import '../../../global_providers.dart';
import '../../app/router/router.gr.dart';
import '../../constants/colors.dart';
import '../../l10n/l10n.dart';
import '../shimmer/comment_shimmer.dart';
import '../widget/no_item_widget.dart';

@RoutePage()
class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final TextEditingController _searchTextController = TextEditingController();
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios_new,
              )),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Consumer(builder: (context, ref, child) {
              final _searchUserController =
                  ref.watch(searchUserProvider(searchQuery));
              final searchUserList =
                  ref.watch(searchUserProvider(searchQuery)).searchUsers;
              final index = searchUserList
                  .indexWhere((item) => item.id == UserPreferences.userId);
              if (searchUserList.isNotEmpty) {
                if (searchUserList.length > index && index != -1) {
                  searchUserList.removeAt(index);
                }
              }

              return Column(
                children: [
                  Hero(
                      tag: 'abcd',
                      child: Material(
                          child: searchbar(
                              textEditingController: _searchTextController,
                              fillcolor: Colors.white,
                              hintText: 'Search',
                              onchanged: (t) async {
                                searchQuery = t;
                                _searchUserController.refresh();
                              }))),
                  15.verticalSpace,
                  if (_searchUserController.isFirstLoadRunning)
                    const CommentShimmer()
                  else
                    _searchUserController.isFirstError
                        ? Text(
                            AppLocalizations.of(context)!.enter_name_to_Search,
                          )
                        : searchUserList.isNotEmpty
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount: searchUserList.length + 1,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  if (index == searchUserList.length) {
                                    if (_searchUserController
                                        .isLoadMoreRunning) {
                                      return const Padding(
                                        padding: EdgeInsets.only(
                                            top: 10, bottom: 40),
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                    } else if (_searchUserController
                                        .isLoadMoreRunning) {
                                      return Container(
                                        padding: const EdgeInsets.only(
                                            top: 30, bottom: 40),
                                        color: Colors.white,
                                        child: Center(
                                          child: Text(
                                            _searchUserController
                                                .loadMoreErrorMessage,
                                            style: const TextStyle(
                                                color: redError),
                                          ),
                                        ),
                                      );
                                    } else {
                                      return const SizedBox();
                                    }
                                  } else {
                                    return InkWell(
                                      onTap: () {
                                        context.router.push(OtherProfileRoute(
                                            userId: searchUserList[index].id));
                                      },
                                      child: SearchUserTile(
                                        name: searchUserList[index].name,
                                        username:
                                            searchUserList[index].username,
                                        profilePic: searchUserList[index]
                                            .userProfileImage,
                                        isFollowing: true,
                                        userId: searchUserList[index].id,
                                        isOthers: true,
                                        index: index,
                                      ),
                                    );
                                  }
                                })
                            : const SizedBox(
                                height: 400,
                                child: NoItemWidget(
                                  title: "No User Found",
                                  subTitle: "Share what you think",
                                ),
                              ),
                  43.verticalSpace,
                  // Align(
                  //     alignment: Alignment.bottomLeft,
                  //     child: Text(
                  //       AppLocalizations.of(context)!.discover_more,
                  //       style: textTheme.titleSmall,
                  //     )),
                  // Wrap(
                  //   children: const [
                  //     DiscoverMoreTiles(
                  //       title: 'Wheat',
                  //     ),
                  //     DiscoverMoreTiles(
                  //       title: 'Rice',
                  //     ),
                  //     DiscoverMoreTiles(
                  //       title: 'Tomato',
                  //     ),
                  //     DiscoverMoreTiles(
                  //       title: 'Tractors',
                  //     ),
                  //     DiscoverMoreTiles(
                  //       title: 'Cultivators',
                  //     ),
                  //   ],
                  // )
                ],
              );
            }),
          ),
        ));
  }
}

class DiscoverMoreTiles extends StatelessWidget {
  const DiscoverMoreTiles({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Center(
        child: Chip(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.r))),
      backgroundColor: const Color(0xffF4F4F4),
      label: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        child: Text(
          title,
          style: textTheme.bodyLarge!.copyWith(color: brown),
        ),
      ),
    ));
  }
}
