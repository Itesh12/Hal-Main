import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/global_providers.dart';
import 'package:kisaan_station/src/model/user/blocked_list_model.dart';
import 'package:kisaan_station/src/view/widget/profile_image.dart';

import '../../../util/services/shared_preferences.dart';
import '../../widget/appDialog.dart';

@RoutePage()
class UserBlockPagedList extends ConsumerWidget {
  const UserBlockPagedList({Key? key}) : super(key: key);
  // final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final res = ref.watch(blockedUserProvider);
    return SafeArea(
        child: Scaffold(
            // backgroundColor: const Color(0xffDFDFDF),
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () => context.popRoute(),
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                  )),
              title: Text(
                "Blocked accounts",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: const Color(0xffE26B26),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            body: res.when(
                data: (blockUser) {
                  if (blockUser.isNotEmpty) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Material(
                        child: ListView.builder(
                            itemCount: blockUser.length,
                            itemBuilder: (context, index) {
                              return BlockUserTile(
                                blockUser: blockUser[index],
                              );
                            }),
                      ),
                    );
                  } else {
                    return const Center(child: Text("No Blocked Users"));
                  }
                },
                error: (error, stackTrace) => const SizedBox(),
                loading: () {
                  return const Center(child: CircularProgressIndicator());
                })));
  }
}

class BlockUserTile extends ConsumerWidget {
  const BlockUserTile({
    Key? key,
    required this.blockUser,
  }) : super(key: key);

  final BlockedListModel blockUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
        onTap: () {
          // context.router.push(OtherProfileRoute(userId: blockUser.id));
        },
        leading: ProfilePicWidget(
          size: 58,
          url: blockUser.userProfileImage,
        ),
        title: Text(
          blockUser.name,
          style: textTheme.labelLarge!.copyWith(color: const Color(0xff563E1F)),
        ),
        subtitle: Text(
          blockUser.username,
          style: textTheme.bodyMedium!.copyWith(color: const Color(0xff563E1F)),
        ),
        trailing: OutlinedButton(
            onPressed: () async {
              AppDialog(
                  title: "Attention",
                  subtitle: "Do you want to unblock this user?",
                  leftBtnText: "No",
                  rightBtnText: "Yes",
                  leftBtnColor: Colors.black54,
                  leftBtnTap: () {
                    Navigator.pop(context);
                  },
                  rightBtnTap: () async {
                    Navigator.pop(context);
                    context.router.pop();
                    await ref.read(blockedUserProvider.notifier).unblockUser(
                        stalkerId: UserPreferences.userId,
                        otherUserId: blockUser.id);
                    ref.read(blockedUserProvider.notifier).state = ref.refresh(blockedUserProvider);
                    ref.read(blockedUserProvider);

                    ref.refresh(postListProvider);
                    ref.refresh(userRepoProvider);
                    ref.refresh(userPostListProvider(UserPreferences.userId));

                    // ref
                    //     .read(userController(UserPreferences.userId)
                    //         .notifier)
                    //     .increamentFollowingCount();
                  }).showOptionAlert(context);
            },
            // : () async {
            //     await ref.read(blockedUserProvider.notifier).blockUser(
            //         blockedByUserId: UserPreferences.userId,
            //         blockedUserId: blockUser.id);

            //     // ref
            //     //     .read(userController(UserPreferences.userId).notifier)
            //     //     .decrementFollowingCount();
            //   },
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(78, 32),
              shape: const StadiumBorder(),
              backgroundColor: const Color(0xffE26B26),
            ),
            child: Text(
              'Unblock',
              softWrap: false,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            )));
  }
}
