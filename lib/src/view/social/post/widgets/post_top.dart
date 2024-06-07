import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:kisaan_station/global_providers.dart';
import 'package:kisaan_station/src/app/router/router.gr.dart';
import 'package:kisaan_station/src/util/services/shared_preferences.dart';
import 'package:kisaan_station/src/view/social/post/widgets/post_more_option_bottom_sheet.dart';
import 'package:kisaan_station/src/view/widget/profile_image.dart';

import '../../../../constants/colors.dart';
import '../../../../controller/user/follow_controller.dart';
import '../../../../l10n/l10n.dart';
import '../../../../model/social/post/post_model.dart';
import '../../../../util/bottomsheet/bottom_sheet.dart';
import '../../../profile/screens/other_profile_page.dart';

List<String> reportReason = [
  'False Information',
  'Suicided or self-injury',
  'Nudity or Sexual Content',
  'Inappropriate Content',
  'Bullying or harassment',
  'Hate speech',
  'Other'
];

int _currentIndex = -1;
bool isVisible = false;
final otherText = TextEditingController();

class PostTop extends ConsumerStatefulWidget {
  const PostTop({Key? key, required this.post, this.inMyProfile = false})
      : super(key: key);

  final Post post;
  final bool inMyProfile;

  @override
  _PostTopState createState() => _PostTopState();
}

class _PostTopState extends ConsumerState<PostTop> {
  Uri? link;

  String address = '';

  // Future<void> dynamicLinkCreate() async {
  //   final postId = widget.post.postId;
  //   // final desc = widget.post.postDescription.isNotEmpty
  //   //     ? widget.post.postDescription
  //   //     : null;
  //   // final image =
  //   //     widget.post.postType == "image" ? widget.post.media[0].mediaUrl : null;
  //   link = await ref.read(dynamicLinkProvider).createDynamicLinkSharePost(
  //         postId: postId,
  //         // desc: desc,
  //         // image: image,
  //       );
  // }

  Future<void> fetchAddress() async {
    address = await ref.read(locationProvider).getShortAddress(
              latitude: widget.post.latitude,
              longitude: widget.post.longitude,
            ) ??
        '';
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    fetchAddress();
    // dynamicLinkCreate();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Future.microtask(() {
    //   ref.watch(userFollowProvider(widget.post.userId).notifier).state =
    //       widget.post.followingStatus;
    // });

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              12.horizontalSpace,
              InkWell(
                onTap: widget.post.userId == UserPreferences.userId
                    ? () {
                        context.router.push(const ProfileRoute());
                      }
                    : () {
                        context.router.push(
                            OtherProfileRoute(userId: widget.post.userId));
                      },
                child: ProfilePicWidget(
                  url: widget.post.userProfileImage,
                  size: 37.w,
                  fizedSize: true,
                  hasBorder: true,
                  border: Border.all(
                    width: 2,
                    color: borderGrey,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: widget.post.userId == UserPreferences.userId
                            ? () {
                                context.router.push(const ProfileRoute());
                              }
                            : () {
                                context.router.push(OtherProfileRoute(
                                    userId: widget.post.userId));
                              },
                        child: Text(
                          widget.post.name,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      1.verticalSpace,
                      Row(
                        children: [
                          SvgPicture.asset("assets/images/location.svg"),
                          2.horizontalSpace,
                          Text(
                            address,
                            style: TextStyle(fontSize: 11.sp, color: grey),
                          ),
                        ],
                      ),
                      Text(
                        GetTimeAgo.parse(widget.post.createdAt),
                        style: TextStyle(fontSize: 11.sp, color: grey),
                      ),
                    ],
                  ),
                ),
              ),
              if (widget.post.userId != UserPreferences.userId)
                Consumer(builder: (context, ref, child) {
                  final isFollowing =
                      ref.watch(userFollowProvider(widget.post.userId));
                  return InkWell(
                    onTap: isFollowing
                        ? () async {
                            await ref.read(userRepoProvider).unFollowUser(
                                otherUserId: widget.post.userId,
                                userId: UserPreferences.userId);
                            ref
                                .read(userFollowProvider(widget.post.userId)
                                    .notifier)
                                .state = false;
                            // ref
                            //     .read(userController(UserPreferences.userId)
                            //         .notifier)
                            //     .decrementFollowingCount();
                          }
                        : () async {
                            await ref.read(userRepoProvider).followUser(
                                otherUserId: widget.post.userId,
                                userId: UserPreferences.userId);
                            ref
                                .read(userFollowProvider(widget.post.userId)
                                    .notifier)
                                .state = true;
                            // ref
                            //     .read(userController(UserPreferences.userId)
                            //         .notifier)
                            //     .increamentFollowingCount();
                          },
                    borderRadius: BorderRadius.circular(30),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 2),
                      child: Text(
                        !isFollowing
                            ? AppLocalizations.of(context)!.follow
                            : AppLocalizations.of(context)!.following,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: isFollowing ? grey : primary,
                        ),
                      ),
                    ),
                  );
                }),
              // if (post.userId != UserPreferences.userId)
              //   Material(
              //     color: Colors.white,
              //     child: Consumer(builder: (context, ref, child) {
              //       final userContState =
              //           ref.watch(userController(post.userId));
              //       final userCont =
              //           ref.read(userController(post.userId).notifier);

              //       return userContState.when(
              //           data: (user) => InkWell(
              //                 onTap: user.followingStatus
              //                     ? null
              //                     : () {
              //                         userCont.followUser(
              //                             otherUserId: post.userId);
              //                         // postController.followUser(otherUserId: post.userId);
              //                       },
              //                 borderRadius: BorderRadius.circular(30),
              //                 child: Padding(
              //                   padding: const EdgeInsets.symmetric(
              //                       horizontal: 4, vertical: 2),
              //                   child: Text(
              //                     user.followingStatus
              //                         ? AppLocalizations.of(context)!.follow
              //                         : AppLocalizations.of(context)!.following,
              //                     style: TextStyle(
              //                       fontSize: 12,
              //                       fontWeight: FontWeight.w500,
              //                       color: user.followingStatus ? primary : grey,
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //           error: (e, st) => SizedBox(),
              //           loading: () => CircularProgressIndicator());
              //     }),
              //   ),
              Consumer(builder: (context, ref, child) {
                return Material(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () async {
                      final val = await postMoreOptionBottomSheet(
                        context,
                        ref,
                        link: link,
                        post: widget.post,
                        inMyProfile: widget.inMyProfile,
                      );

                      if (val == null) return;
                      if (val == "Hide") {
                        await ref.read(postListProvider).hide(
                            postId: widget.post.postId,
                            context: context,
                            otherUserId: widget.post.userId);
                      }
                      if (val == "Report") {
                        buildShowModalBottomSheet(context, (controller) {
                          return ReportViewWidgett(
                              userId: widget.post.userId,
                              reportCall: (data) {
                                ref
                                    .read(perticularPostController(widget.post)
                                        .notifier)
                                    .reportUser(
                                      otherUserId: widget.post.userId,
                                      postId: widget.post.postId,
                                      reportReason: data,
                                    );
                              });
                          //   return StatefulBuilder(
                          //     builder: (context, setState) {
                          //       return SingleChildScrollView(
                          //         controller: controller,
                          //         child: Column(
                          //           children: [
                          //             Padding(
                          //               padding: const EdgeInsets.only(
                          //                   top: 25, left: 20, right: 20),
                          //               child: Column(
                          //                 crossAxisAlignment:
                          //                     CrossAxisAlignment.start,
                          //                 children: [
                          //                   const Text('Report',
                          //                       style: TextStyle(
                          //                           fontSize: 18,
                          //                           fontWeight: FontWeight.w800,
                          //                           fontStyle: FontStyle.normal,
                          //                           color: Colors.black)),
                          //                   const SizedBox(height: 2),
                          //                   Row(
                          //                     mainAxisAlignment:
                          //                         MainAxisAlignment.spaceBetween,
                          //                     children: [
                          //                       const Text(
                          //                           'Why are you reporting this post?',
                          //                           style: TextStyle(
                          //                               fontSize: 16,
                          //                               fontWeight:
                          //                                   FontWeight.w500,
                          //                               color: Colors.black45)),
                          //                       if (isVisible)
                          //                         ElevatedButton(
                          //                           onPressed: () {
                          //                             isVisible = false;
                          //                             _currentIndex = -1;
                          //                             setState(() {});
                          //                           },
                          //                           style:
                          //                               ElevatedButton.styleFrom(
                          //                                   minimumSize:
                          //                                       const Size(
                          //                                           32, 20)),
                          //                           child: const Text("Reasons"),
                          //                         ),
                          //                     ],
                          //                   ),
                          //                   const SizedBox(height: 10),
                          //                   const Divider(
                          //                     color: Colors.grey,
                          //                   )
                          //                 ],
                          //               ),
                          //             ),
                          //             if (!isVisible) ...{
                          //               Container(
                          //                 color: Colors.white,
                          //                 width:
                          //                     MediaQuery.of(context).size.width,
                          //                 // height: MediaQuery.of(context).size.height*
                          //                 //     0.55,
                          //                 child: ListView.builder(
                          //                   shrinkWrap: true,
                          //                   physics:
                          //                       const NeverScrollableScrollPhysics(),
                          //                   padding:
                          //                       const EdgeInsets.only(right: 35),
                          //                   itemCount: reportReason.length,
                          //                   itemBuilder: (BuildContext context,
                          //                       int index) {
                          //                     return RadioListTile(
                          //                       value: index,
                          //                       groupValue: _currentIndex,
                          //                       title: Text(
                          //                         reportReason[index],
                          //                         style: const TextStyle(
                          //                             fontSize: 16),
                          //                       ),
                          //                       onChanged: (val) {
                          //                         setState(() {
                          //                           _currentIndex = val!;
                          //                           if (val == 6) {
                          //                             isVisible = true;
                          //                           } else {
                          //                             isVisible = false;
                          //                           }
                          //                         });
                          //                       },
                          //                     );
                          //                   },
                          //                 ),
                          //               ),
                          //             },
                          //             if (isVisible)
                          //               Padding(
                          //                 padding: const EdgeInsets.only(
                          //                     left: 20, right: 20),
                          //                 child: Container(
                          //                   height: 100,
                          //                   decoration: BoxDecoration(
                          //                     border: Border.all(
                          //                       color: Colors.orange,
                          //                     ),
                          //                     borderRadius:
                          //                         BorderRadius.circular(20.0),
                          //                   ),
                          //                   padding: const EdgeInsets.all(18),
                          //                   child: TextFormField(
                          //                     controller: otherText,
                          //                     decoration: const InputDecoration(
                          //                       hintText:
                          //                           "Tell us more about what is happening",
                          //                       hintStyle:
                          //                           TextStyle(fontSize: 14),
                          //                       border: InputBorder.none,
                          //                       fillColor: Colors.white,
                          //                     ),
                          //                     maxLength: 50,
                          //                   ),
                          //                 ),
                          //               ),
                          //             const Padding(
                          //               padding: EdgeInsets.all(8.0),
                          //               child: Divider(
                          //                 color: Colors.grey,
                          //               ),
                          //             ),
                          //             Row(
                          //               mainAxisAlignment: MainAxisAlignment.end,
                          //               children: [
                          //                 SizedBox(
                          //                     height: 36,
                          //                     width: 101,
                          //                     child: TextButton(
                          //                       style: ButtonStyle(
                          //                           backgroundColor:
                          //                               MaterialStateProperty.all(
                          //                                   Colors.white)),
                          //                       onPressed: () {
                          //                         isVisible = false;
                          //                         _currentIndex = -1;
                          //                         setState(() {});
                          //                         Navigator.pop(context);
                          //                       },
                          //                       child: const Text('Cancel',
                          //                           style: TextStyle(
                          //                               color: Colors.black,
                          //                               fontSize: 14,
                          //                               fontWeight:
                          //                                   FontWeight.w500)),
                          //                     )),
                          //                 Padding(
                          //                   padding:
                          //                       const EdgeInsets.only(right: 20),
                          //                   child: SizedBox(
                          //                     height: 36,
                          //                     width: 101,
                          //                     child: TextButton(
                          //                       style: ButtonStyle(
                          //                           backgroundColor: MaterialStateProperty.all(
                          //                               const Color(0xFFE26B26)),
                          //                           shape: MaterialStateProperty.all<
                          //                                   RoundedRectangleBorder>(
                          //                               RoundedRectangleBorder(
                          //                                   borderRadius:
                          //                                       BorderRadius.circular(
                          //                                           27.0),
                          //                                   side: const BorderSide(
                          //                                       color: Color
                          //                                           .fromARGB(
                          //                                               255,
                          //                                               209,
                          //                                               110,
                          //                                               110))))),
                          //                       onPressed: () {
                          //                         String data;
                          //                         if (isVisible) {
                          //                           data = otherText.text;
                          //                         } else {
                          //                           data = reportReason[
                          //                               _currentIndex];
                          //                         }

                          //                         ref
                          //                             .read(
                          //                                 perticularPostController(
                          //                                         widget.post)
                          //                                     .notifier)
                          //                             .reportUser(
                          //                               otherUserId:
                          //                                   widget.post.userId,
                          //                               postId:
                          //                                   widget.post.postId,
                          //                               reportReason: data,
                          //                             );
                          //                         Utils.farmAddedMessage(
                          //                                 'User reported Successfully',
                          //                                 context)
                          //                             .then((value) =>
                          //                                 Navigator.pop(context));
                          //                       },
                          //                       child: const Text('Report',
                          //                           style: TextStyle(
                          //                               color: Colors.white,
                          //                               fontSize: 14,
                          //                               fontWeight:
                          //                                   FontWeight.w500)),
                          //                     ),
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
                          //             const SizedBox(height: 80),
                          //           ],
                          //         ),
                          //       );
                          //     },
                          //   );
                        }, initialHeight: 0.73);
                        //
                        // await Utils.farmAddedMessage(
                        //     'User reported Successfully',
                        //     context)
                        //     .then((value) =>
                        //     Navigator.pop(context));
                      }
                    },
                    borderRadius: BorderRadius.circular(30),
                    child: SizedBox(
                      height: 36.w,
                      width: 36.w,
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/images/more_option.svg",
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.h),
          child: const Divider(height: 1),
        ),
      ],
    );
  }
}
