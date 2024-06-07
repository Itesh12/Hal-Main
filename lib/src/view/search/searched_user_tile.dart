import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/router/router.gr.dart';
import '../widget/profile_image.dart';

class SearchUserTile extends ConsumerWidget {
  const SearchUserTile(
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
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      onTap: () {
        context.router.push(OtherProfileRoute(userId: userId));
      },
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
