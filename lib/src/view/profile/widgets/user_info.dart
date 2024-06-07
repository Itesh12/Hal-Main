import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/view/shimmer/user_profile_shimmer.dart';

import '../../../../global_providers.dart';
import '../../../app/router/router.gr.dart';
import '../../../constants/colors.dart';
import '../../../controller/user/follow_controller.dart';
import '../../../l10n/l10n.dart';
import '../../../util/services/shared_preferences.dart';
import '../../widget/profile_image.dart';

class UserInfo extends ConsumerStatefulWidget {
  const UserInfo({
    Key? key,
    required this.isOthers,
    required this.userId,
  }) : super(key: key);

  final String userId;
  final bool isOthers;

  @override
  ConsumerState<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends ConsumerState<UserInfo> {
  @override
  void initState() {
    fetchUserDetail();

    super.initState();
  }

  fetchUserDetail() async{
    await ref
        .read(userController(widget.userId).notifier)
        .initUser();
  }
  @override
  Widget build(BuildContext context) {
    final val = ref.watch(userController(widget.userId));
    return val.when(
      data: (user) {
        Future.microtask(() {
          ref.watch(userFollowProvider(widget.userId).notifier).state =
              user.followingStatus;
        });
        return Padding(
          padding: EdgeInsets.fromLTRB(15, 10.h, 20, 0),
          child: Column(
            children: [
              Row(
                children: [
                  ProfilePicWidget(
                    url: user.profilePic,
                    hasBorder: true,
                    hasShadow: true,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  user.name,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w600),
                                  maxLines: 2,
                                ),
                              )
                            ],
                          ),
                          Text(
                            "@${user.username}",
                            style: TextStyle(
                                fontSize: 12.sp,
                                overflow: TextOverflow.ellipsis),
                            maxLines: 1,
                          ),
                          4.verticalSpace,
                          if (user.description != null)
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    user.description!,
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 11.sp,
                                      color: grey,
                                    ),
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: widget.isOthers
                          ? () {
                              context.router.push(UserFollowersRoute(
                                  isOthers: widget.isOthers,
                                  fromFollowers: true,
                                  otherUserId: widget.userId));
                            }
                          : () {
                              context.router.push(UserFollowersRoute(
                                  isOthers: widget.isOthers,
                                  fromFollowers: true,
                                  otherUserId: widget.userId));
                            },
                      child: Text(
                          "${user.followersCount} ${AppLocalizations.of(context)!.followers}")),
                  Icon(
                    Icons.fiber_manual_record,
                    size: 8.r,
                    color: primary,
                  ),
                  TextButton(
                      onPressed: widget.isOthers
                          ? () {
                              context.router.push(UserFollowersRoute(
                                  isOthers: widget.isOthers,
                                  fromFollowers: false,
                                  otherUserId: widget.userId));
                            }
                          : () {
                              context.router.push(UserFollowersRoute(
                                  isOthers: widget.isOthers,
                                  fromFollowers: false,
                                  otherUserId: widget.userId));
                            },
                      child: Text(
                          "${user.followingCount} ${AppLocalizations.of(context)!.following}")),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // if (!isOthers) ...[
                    //   MyOutlinedButton(
                    //     label: AppLocalizations.of(context)!.kyc_verification,
                    //   ),
                    //   17.horizontalSpace,
                    //   MyOutlinedButton(
                    //     label: AppLocalizations.of(context)!.my_khata,
                    //   ),
                    //   17.horizontalSpace,
                    //   MyOutlinedButton(
                    //     label: AppLocalizations.of(context)!.my_group,
                    //   ),
                    // ],
                    if (widget.isOthers) ...[
                      Consumer(builder: (context, ref, child) {
                        final isFollowing =
                            ref.watch(userFollowProvider(widget.userId));

                        return MyOutlinedButton(
                          label: isFollowing ? "Following" : "Follow",
                          onPressed: isFollowing
                              ? () async {
                                  await ref.read(userRepoProvider).unFollowUser(
                                      userId: UserPreferences.userId,
                                      otherUserId: widget.userId);
                                  ref
                                      .read(userFollowProvider(widget.userId).notifier)
                                      .state = false;
                                  ref
                                      .read(userController(widget.userId).notifier)
                                      .decrementFollowerCount();
                                  ref
                                      .read(
                                          userController(UserPreferences.userId)
                                              .notifier)
                                      .decrementFollowingCount();
                                  ref.refresh(followerListProvider(
                                      UserPreferences.userId));
                                  ref.refresh(followingListProvider(
                                      UserPreferences.userId));
                                }
                              : () async {
                                  await ref.read(userRepoProvider).followUser(
                                      otherUserId: widget.userId,
                                      userId: UserPreferences.userId);
                                  ref
                                      .read(userFollowProvider(widget.userId).notifier)
                                      .state = true;
                                  ref
                                      .read(userController(widget.userId).notifier)
                                      .increamentFollowerCount();
                                  ref
                                      .read(
                                          userController(UserPreferences.userId)
                                              .notifier)
                                      .increamentFollowingCount();
                                  ref.refresh(
                                      userController(UserPreferences.userId)
                                          .notifier);
                                  ref.refresh(followerListProvider(
                                      UserPreferences.userId));
                                  ref.refresh(followingListProvider(
                                      UserPreferences.userId));
                                },
                        );
                      }),
                      // 17.horizontalSpace,
                      // const MyOutlinedButton(label: "Message"),
                      // 17.horizontalSpace,
                      // const MyOutlinedButton(label: "Contact"),
                    ]
                  ],
                ),
              ),
            ],
          ),
        );
      },
      error: (e, __) => const Center(child: Text("Somthing went wrong")),
      loading: () => const Center(child: UserProfileShimmer()),
    );
  }
}

class MyOutlinedButton extends StatelessWidget {
  const MyOutlinedButton({Key? key, required this.label, this.onPressed})
      : super(key: key);

  final String label;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed ?? () {},
      style: OutlinedButton.styleFrom(
        // minimumSize: const Size(100, 36),
        shape: const StadiumBorder(),
        backgroundColor: label == 'Follow' ? primary : whitePrimary,
      ),
      child: Text(
        label,
        softWrap: false,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: label == 'Follow' ? FontWeight.w600 : FontWeight.w500,
          color: label == 'Follow' ? white : black,
        ),
      ),
    );
  }
}
