import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/global_providers.dart';
import 'package:kisaan_station/src/constants/colors.dart';
import 'package:kisaan_station/src/controller/user/follow_controller.dart';
import 'package:kisaan_station/src/view/home/widget/SellerListing_pages.dart';
import 'package:kisaan_station/src/view/widget/profile_image.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../../../app/router/router.gr.dart';
import '../../../constants/page_padding.dart';
import '../../../util/services/shared_preferences.dart';
import '../../shimmer/user_tile_shimmer.dart';
import '../../widget/appDialog.dart';

@RoutePage()
class UserFollowersPage extends StatefulWidget {
  final bool fromFollowers;
  final bool isOthers;
  final String otherUserId;

  const UserFollowersPage({
    Key? key,
    required this.fromFollowers,
    required this.isOthers,
    required this.otherUserId,
  }) : super(key: key);

  @override
  _UserFollowersPageState createState() => _UserFollowersPageState();
}

class _UserFollowersPageState extends State<UserFollowersPage> {
  int initialIndex = 0;

  List<Widget> tabs = [
    const Tab(
      height: 30,
      child: Text(
        'Followers',
      ),
    ),
    const Tab(
      height: 30,
      child: Text(
        'Following',
      ),
    ),
  ];

  @override
  void initState() {
    if (widget.fromFollowers) {
      initialIndex = 0;
    } else {
      initialIndex = 1;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: tabs.length,
        initialIndex: initialIndex,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 30,
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                )),
            bottom: TabBar(
              physics: const BouncingScrollPhysics(),
              tabs: tabs,
              labelColor: primary,
              unselectedLabelColor: grey,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: MaterialIndicator(
                height: 3,
                color: primary,
              ),
              indicatorColor: primary,
            ),
          ),
          body: Column(
            children: [
              const Padding(
                padding: pagePadding,
                child: Divider(
                  height: 1,
                ),
              ),
              12.verticalSpace,
              Expanded(
                child: TabBarView(children: [
                  // Follower tab
                  UserFollowerPagedList(
                      isOthers: widget.isOthers,
                      otherUserId: widget.otherUserId),
                  // Following tab
                  UserFollowingPagedList(
                      isOthers: widget.isOthers,
                      otherUserId: widget.otherUserId),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserFollowingPagedList extends ConsumerWidget {
  const UserFollowingPagedList(
      {Key? key, required this.isOthers, required this.otherUserId})
      : super(key: key);
  final bool isOthers;
  final String otherUserId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _followingList = ref.watch(followingListProvider(userId)).following;
    final _followingListController = ref.watch(followingListProvider(userId));
    return _followingListController.isFirstLoadRunning
        ? const UserTileShimmer()
        : _followingListController.isFirstError
            ? Container(
                padding: const EdgeInsets.only(top: 30, bottom: 40),
                color: Colors.white,
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: Text(
                          _followingListController.firstErrorMessage,
                          style: const TextStyle(color: redError),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (_followingListController.firstErrorMessage !=
                              "Session Expired...") {
                            _followingListController.refresh();
                          } else {}
                        },
                        child: Text(
                            _followingListController.firstErrorMessage ==
                                    "Session Expired..."
                                ? "SignIn Again"
                                : "Retry"),
                      )
                    ],
                  ),
                ),
              )
            : _followingList.isNotEmpty
                ? Padding(
                    padding: pagePadding,
                    child: ListView.builder(
                        itemCount: _followingList.length + 1,
                        itemBuilder: (context, index) {
                          if (index == _followingList.length) {
                            if (_followingListController.isLoadMoreRunning) {
                              return const Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 40),
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            } else if (_followingListController
                                .isLoadMoreRunning) {
                              return Container(
                                padding:
                                    const EdgeInsets.only(top: 30, bottom: 40),
                                color: Colors.white,
                                child: Center(
                                  child: Text(
                                    _followingListController
                                        .loadMoreErrorMessage,
                                    style: const TextStyle(color: redError),
                                  ),
                                ),
                              );
                            } else {
                              return const SizedBox();
                            }
                          } else {
                            return FollowingUserTile(
                              name: _followingList[index].name,
                              username: _followingList[index].username,
                              profilePic: _followingList[index].image,
                              userId: _followingList[index].followingId,
                              isFollowing:
                                  _followingList[index].followingStatus,
                              isOthers: isOthers,
                              index: index,
                            );
                          }
                        }),

                    // followerList.when(
                    //         data: (data) {
                    //           return Padding(
                    //             padding: pagePadding,
                    //             child: ListView.builder(
                    //                 itemCount: data.length,
                    //                 itemBuilder: (context, index) => FollowerUserTile(
                    //                       name: data[index].name,
                    //                       username: data[index].username,
                    //                       profilePic: data[index].image,
                    //                       userId: data[index].follower_id,
                    //                       isOthers: isOthers,
                    //                     )),
                    //           );
                  )
                : const SizedBox(
                    height: 400,
                    child: Center(child: Text("No Following")),
                  );
  }
}

class FollowerUserTile extends ConsumerWidget {
  const FollowerUserTile(
      {Key? key,
      required this.isOthers,
      required this.name,
      required this.index,
      required this.userId,
      required this.username,
      required this.isFollowing,
      this.profilePic})
      : super(key: key);
  final String name;
  final String username;
  final String? profilePic;
  final String userId;
  final bool isFollowing;
  final bool isOthers;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.microtask(() {
      ref.watch(userFollowProvider(userId).notifier).state = isFollowing;
    });
    final textTheme = Theme.of(context).textTheme;
    // ref.watch(userFollowProvider(userId).notifier).state = isFollowing;
    return ListTile(
      onTap: () => userId == UserPreferences.userId
          ? context.router.push(const ProfileRoute())
          : context.router.push(OtherProfileRoute(userId: userId)),
      leading: ProfilePicWidget(
        size: 58,
        url: profilePic,
      ),
      title: Text(
        name,
        style: textTheme.labelLarge,
      ),
      subtitle: Text(
        username,
        style: textTheme.bodyMedium!.copyWith(color: const Color(0xffA6A4A4)),
      ),
      trailing: Consumer(builder: (context, ref, child) {
        final following = ref.watch(userFollowProvider(userId));

        final bool res = isOthers && following;

        return userId == UserPreferences.userId
            ? const SizedBox()
            : isOthers
                ? const SizedBox()
                : OutlinedButton(
                    onPressed: isOthers
                        ? isFollowing
                            ? () async {
                                AppDialog(
                                    title: "Attention",
                                    subtitle:
                                        "Do you want to unfollow this user?",
                                    leftBtnText: "No",
                                    rightBtnText: "Yes",
                                    leftBtnColor: Colors.black54,
                                    leftBtnTap: () {
                                      Navigator.pop(context);
                                    },
                                    rightBtnTap: () async {
                                      await ref
                                          .read(userRepoProvider)
                                          .unFollowUser(
                                              otherUserId: userId,
                                              userId: UserPreferences.userId);
                                      ref
                                          .read(userFollowProvider(userId)
                                              .notifier)
                                          .state = false;
                                      ref
                                          .read(userController(
                                                  UserPreferences.userId)
                                              .notifier)
                                          .decrementFollowingCount();
                                      context.router.pop();
                                    }).showOptionAlert(context);
                              }
                            : () async {
                                await ref.read(userRepoProvider).followUser(
                                    otherUserId: userId,
                                    userId: UserPreferences.userId);
                                ref
                                    .read(userFollowProvider(userId).notifier)
                                    .state = true;
                                ref
                                    .read(userController(UserPreferences.userId)
                                        .notifier)
                                    .increamentFollowingCount();
                              }
                        : () async {
                            await ref
                                .read(userController(userId).notifier)
                                .removeUser(otherUserId: userId);
                            ref
                                .read(userFollowProvider(userId).notifier)
                                .state = false;
                            ref
                                .read(followerListProvider(
                                    UserPreferences.userId))
                                .removeUser(index);
                            ref
                                .read(userController(UserPreferences.userId)
                                    .notifier)
                                .decrementFollowerCount();
                          },
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(78, 28),
                      shape: const StadiumBorder(),
                      backgroundColor:
                          isOthers && following ? primary : whitePrimary,
                    ),
                    child: Text(
                      isOthers
                          ? following
                              ? 'Following'
                              : 'Follow'
                          : 'Remove',
                      softWrap: false,
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: isOthers && following ? black : primary,
                      ),
                    ));
      }),
    );
    //   return SizedBox(
    //     width: 190,
    //     height: 80,
    //     child: Column(
    //       children: [
    //         Row(
    //           children: [
    //             ProfilePicWidget(
    //               size: 58,
    //               url: profilePic,
    //             ),
    //             22.horizontalSpace,
    //             Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Text(
    //                   name,
    //                   style: textTheme.labelLarge,
    //                 ),
    //                 Text(
    //                   username,
    //                   style: textTheme.bodyMedium!
    //                       .copyWith(color: const Color(0xffA6A4A4)),
    //                 ),
    //               ],
    //             ),
    //             const Spacer(),
    //             Consumer(builder: (context, ref, child) {
    //               final userContState = ref.watch(userController(userId));
    //               final userCont = ref.read(userController(userId).notifier);
    //               final _followerListController = ref.watch(followerListProvider(UserPreferences.userId);

    //               return userContState.when(
    //                   data: (data) {
    //                     final isFollowing =
    //                         ref.watch(userFollowProvider(FollowParam(
    //                       userId: userId,
    //                       isFollowing: data.followingStatus,
    //                     )));

    //                     return isOthers
    //                         ? ElevatedButton(
    //                             onPressed: isFollowing
    //                                 ? () async {
    //                                     await ref
    //                                         .read(userRepoProvider)
    //                                         .unFollowUser(
    //                                             userId: UserPreferences.userId,
    //                                             otherUserId: userId);
    //                                     ref
    //                                         .read(userFollowProvider(FollowParam(
    //                                                 userId: userId,
    //                                                 isFollowing:
    //                                                     data.followingStatus))
    //                                             .notifier)
    //                                         .state = false;
    //                                   }
    //                                 : () async {
    //                                     await ref
    //                                         .read(userRepoProvider)
    //                                         .followUser(
    //                                             otherUserId: userId,
    //                                             userId: UserPreferences.userId);
    //                                     ref
    //                                         .read(userFollowProvider(FollowParam(
    //                                           userId: userId,
    //                                           isFollowing: data.followingStatus,
    //                                         )).notifier)
    //                                         .state = true;
    //                                   },
    //                             style: ElevatedButton.styleFrom(
    //                               minimumSize: const Size(83, 30),
    //                             ),
    //                             child: Text(
    //                               isFollowing ? 'UnFollow' : 'Follow',
    //                               softWrap: false,
    //                               style: textTheme.labelSmall!
    //                                   .copyWith(color: Colors.white),
    //                             ))
    //                         : ElevatedButton(
    //                             onPressed: () async {
    //                               await userCont.removeUser(otherUserId: userId);
    //                               ref
    //                                   .read(userFollowProvider(FollowParam(
    //                                           userId: userId,
    //                                           isFollowing: data.followingStatus))
    //                                       .notifier)
    //                                   .state = false;
    //                               _followerListController.removeUser(index);
    //                             },
    //                             style: ElevatedButton.styleFrom(
    //                               minimumSize: const Size(83, 30),
    //                             ),
    //                             child: Text(
    //                               'Remove',
    //                               softWrap: false,
    //                               style: textTheme.labelSmall!
    //                                   .copyWith(color: Colors.white),
    //                             ));
    //                   },
    //                   error: (e, st) => const SizedBox(),
    //                   loading: () => const CircularProgressIndicator());
    //             }),
    //           ],
    //         ),
    //         const Divider(),
    //       ],
    //     ),
    //   );
  }
}

class FollowingUserTile extends ConsumerWidget {
  const FollowingUserTile(
      {Key? key,
      required this.isOthers,
      required this.index,
      required this.name,
      required this.userId,
      required this.username,
      required this.isFollowing,
      this.profilePic})
      : super(key: key);
  final String name;
  final String username;
  final String? profilePic;
  final String userId;
  final bool isFollowing;
  final bool isOthers;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.microtask(() {
      ref.watch(userFollowProvider(userId).notifier).state = isFollowing;
    });
    final textTheme = Theme.of(context).textTheme;
    // ref.watch(userFollowProvider(userId).notifier).state = isFollowing;
    return ListTile(
      onTap: () => userId == UserPreferences.userId
          ? context.router.push(const ProfileRoute())
          : context.router.push(OtherProfileRoute(userId: userId)),
      leading: ProfilePicWidget(
        size: 58,
        url: profilePic,
      ),
      title: Text(
        name,
        style: textTheme.labelLarge,
      ),
      subtitle: Text(
        username,
        style: textTheme.bodyMedium!.copyWith(color: const Color(0xffA6A4A4)),
      ),
      trailing: Consumer(builder: (context, ref, child) {
        final following = ref.watch(userFollowProvider(userId));

        return userId == UserPreferences.userId
            ? const SizedBox()
            : isOthers
                ? const SizedBox()
                : OutlinedButton(
                    onPressed: () async {
                      AppDialog(
                          title: "Attention",
                          subtitle: "Do you want to unfollow this user?",
                          leftBtnText: "No",
                          rightBtnText: "Yes",
                          leftBtnColor: Colors.black54,
                          leftBtnTap: () {
                            Navigator.pop(context);
                          },
                          rightBtnTap: () async {
                            await ref.read(userRepoProvider).unFollowUser(
                                otherUserId: userId,
                                userId: UserPreferences.userId);
                            ref
                                .read(userFollowProvider(userId).notifier)
                                .state = false;
                            ref
                                .read(userController(UserPreferences.userId)
                                    .notifier)
                                .decrementFollowingCount();
                            context.router.pop();
                            ref
                                .refresh(followingListProvider(
                                        UserPreferences.userId)
                                    .notifier)
                                .removeUser(index);
                            ref.refresh(
                                followingListProvider(UserPreferences.userId));
                            ref.refresh(
                                userFollowProvider(UserPreferences.userId));
                          }).showOptionAlert(context);
                    },

                    // : () async {
                    //     await ref.read(userRepoProvider).followUser(
                    //         otherUserId: userId,
                    //         userId: UserPreferences.userId);
                    //     ref
                    //         .read(userFollowProvider(userId).notifier)
                    //         .state = true;
                    //     ref
                    //         .read(userController(UserPreferences.userId)
                    //             .notifier)
                    //         .increamentFollowingCount();
                    //   }
                    // : () async {
                    //     await ref
                    //         .read(userController(userId).notifier)
                    //         .removeUser(otherUserId: userId);
                    //     ref.read(userFollowProvider(userId).notifier).state =
                    //         false;
                    //     ref
                    //         .read(followingListProvider(UserPreferences.userId))
                    //         .removeUser(index);
                    //     ref
                    //         .read(
                    //             userController(UserPreferences.userId).notifier)
                    //         .decrementFollowingCount();
                    //   },
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(78, 28),
                      shape: const StadiumBorder(),
                    ),
                    child: Text(
                      isOthers
                          ? following
                              ? 'Following'
                              : 'Follow'
                          : "Following",
                      softWrap: false,
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: black),
                    ));
      }),
    );
  }

  // @override
  // Widget build(BuildContext context, WidgetRef ref) {
  //   final textTheme = Theme.of(context).textTheme;
  //   Future.microtask(
  //     () {
  //       ref.watch(userFollowProvider(userId).notifier).state = isFollowing;
  //     },
  //   );
  //   return ListTile(
  //     onTap: () {
  //       context.router.push(OtherProfileRoute(userId: userId));
  //     },
  //     leading: ProfilePicWidget(
  //       size: 58,
  //       url: profilePic,
  //     ),
  //     title: Text(
  //       name,
  //       style: textTheme.labelLarge,
  //     ),
  //     subtitle: Text(
  //       username,
  //       style: textTheme.bodyMedium!.copyWith(color: const Color(0xffA6A4A4)),
  //     ),
  //     trailing: userId == UserPreferences.userId
  //         ? null
  //         : Consumer(builder: (context, ref, child) {
  //             // final isFollowin = ref
  //             //     .watch(followingListProvider(userId))
  //             //     .following
  //             //     .map((e) => e.followingStatus);

  //             return OutlinedButton(
  //                 onPressed: () async {
  //                   AppDialog(
  //                       title: "Attention",
  //                       subtitle: "Do you want to unfollow this user?",
  //                       leftBtnText: "No",
  //                       rightBtnText: "Yes",
  //                       leftBtnColor: Colors.black54,
  //                       leftBtnTap: () {
  //                         Navigator.pop(context);
  //                       },
  //                       rightBtnTap: () async {
  //                         await ref.read(userRepoProvider).unFollowUser(
  //                             otherUserId: userId,
  //                             userId: UserPreferences.userId);
  //                         ref.read(userFollowProvider(userId).notifier).state =
  //                             false;
  //                         ref
  //                             .read(userController(UserPreferences.userId)
  //                                 .notifier)
  //                             .decrementFollowingCount();

  //                         context.router.pop();
  //                         ref.refresh(followingListProvider(userId));
  //                       }).showOptionAlert(context);
  //                 },
  //                 // : () async {
  //                 //     await ref.read(userRepoProvider).followUser(
  //                 //         otherUserId: userId,
  //                 //         userId: UserPreferences.userId);
  //                 //     ref.read(userFollowProvider(userId).notifier).state =
  //                 //         true;
  //                 //     ref
  //                 //         .read(userController(UserPreferences.userId)
  //                 //             .notifier)
  //                 //         .increamentFollowingCount();
  //                 //   },
  //                 style: OutlinedButton.styleFrom(
  //                   minimumSize: const Size(78, 28),
  //                   shape: const StadiumBorder(),
  //                   backgroundColor: whitePrimary,
  //                 ),
  //                 child: Text(
  //                   'Following',
  //                   softWrap: false,
  //                   style: TextStyle(
  //                     fontSize: 10.sp,
  //                     fontWeight: FontWeight.w500,
  //                     // color: isFollowin ? black : white,
  //                   ),
  //                 ));
  //           }),
  //   );
  // }
}

class UserFollowerPagedList extends ConsumerWidget {
  const UserFollowerPagedList(
      {Key? key, required this.isOthers, required this.otherUserId})
      : super(key: key);
  final bool isOthers;
  final String otherUserId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final followerList = ref.watch(followerListProvider(otherUserId)).followers;
    final _followerListController =
        ref.watch(followerListProvider(otherUserId));
    // final otherfollowerList =
    //     ref.watch(otherFollowerListDataProvider(otherUserId));
    return
        // isOthers
        //   ? SizedBox()
        // otherfollowerList.when(
        //         data: (data) {
        //           return Padding(
        //             padding: pagePadding,
        //             child: ListView.builder(
        //                 itemCount: data.length,
        //                 itemBuilder: (context, index) => InkWell(
        //                       onTap: () {
        //                         context.router.push(OtherProfileRoute(
        //                             userId: data[index].followingId));
        //                       },
        //                       child: FollowerUserTile(
        //                         name: data[index].name,
        //                         username: data[index].username,
        //                         profilePic: data[index].image,
        //                         userId: data[index].followingId,
        //                         isFollowing: followerList[index].followingStatus,
        //                         isOthers: isOthers,
        //                         index: index,
        //                       ),
        //                     )),
        //           );
        //         },
        //         error: (e, s) => const SizedBox(),
        //         loading: () => const UserTileShimmer())
        _followerListController.isFirstLoadRunning
            ? const UserTileShimmer()
            : _followerListController.isFirstError
                ? Container(
                    padding: const EdgeInsets.only(top: 30, bottom: 40),
                    color: Colors.white,
                    child: Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 40),
                            child: Text(
                              _followerListController.firstErrorMessage,
                              style: const TextStyle(color: redError),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              if (_followerListController.firstErrorMessage !=
                                  "Session Expired...") {
                                _followerListController.refresh();
                              } else {}
                            },
                            child: Text(
                                _followerListController.firstErrorMessage ==
                                        "Session Expired..."
                                    ? "SignIn Again"
                                    : "Retry"),
                          )
                        ],
                      ),
                    ),
                  )
                : followerList.isNotEmpty
                    ? Padding(
                        padding: pagePadding,
                        child: ListView.builder(
                            itemCount: followerList.length + 1,
                            itemBuilder: (context, index) {
                              if (index == followerList.length) {
                                if (_followerListController.isLoadMoreRunning) {
                                  return const Padding(
                                    padding:
                                        EdgeInsets.only(top: 10, bottom: 40),
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  );
                                } else if (_followerListController
                                    .isLoadMoreRunning) {
                                  return Container(
                                    padding: const EdgeInsets.only(
                                        top: 30, bottom: 40),
                                    color: Colors.white,
                                    child: Center(
                                      child: Text(
                                        _followerListController
                                            .loadMoreErrorMessage,
                                        style: const TextStyle(color: redError),
                                      ),
                                    ),
                                  );
                                } else {
                                  return const SizedBox();
                                }
                              } else {
                                return FollowerUserTile(
                                  name: followerList[index].name,
                                  username: followerList[index].username,
                                  profilePic: followerList[index].image,
                                  userId: followerList[index].followingId,
                                  isFollowing:
                                      followerList[index].followingStatus,
                                  isOthers: isOthers,
                                  index: index,
                                );
                              }
                            }),

                        // followerList.when(
                        //         data: (data) {
                        //           return Padding(
                        //             padding: pagePadding,
                        //             child: ListView.builder(
                        //                 itemCount: data.length,
                        //                 itemBuilder: (context, index) => FollowerUserTile(
                        //                       name: data[index].name,
                        //                       username: data[index].username,
                        //                       profilePic: data[index].image,
                        //                       userId: data[index].follower_id,
                        //                       isOthers: isOthers,
                        //                     )),
                        //           );
                      )
                    : const SizedBox(
                        height: 400,
                        child: Center(child: Text("No Followers")),
                      );
  }
}
