import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kisaan_station/src/util/bottomsheet/bottom_sheet.dart';

import '../../../../../global_providers.dart';
// import '../../../../l10n/l10n.dart';
import '../../../../app/router/router.gr.dart';
import '../../../../model/social/post/post_model.dart';
import '../../../../util/services/shared_preferences.dart';

Future<String?> postMoreOptionBottomSheet(BuildContext context, WidgetRef ref,
    {Uri? link, required Post post, bool inMyProfile = false}) async {
  final status = await buildShowModalBottomSheet<String>(
    context,
    (controller) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (post.userId == UserPreferences.userId) ...{
              InkWell(
                onTap: () {
                  context.router.popAndPush(const SettingsRoute());
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/setting.svg',
                      height: 20.h,
                    ),
                    10.horizontalSpace,
                    Text(
                      'Setting',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            },
            if (post.userId != UserPreferences.userId) ...{
              Material(
                color: Colors.white,
                child: InkWell(
                  onTap: () async {
                    // Navigator.pop(context,"Hide");
                    context.popRoute("Hide");
                  },
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.visibility_off_outlined,
                            size: 20,
                            color: Colors.black,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Hide Post",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(color: Colors.grey, thickness: 0.5),
            },
            if (post.userId != UserPreferences.userId) ...{
              Material(
                color: Colors.white,
                child: InkWell(
                  onTap: () {
                    // Navigator.pop(context,"Report");
                    context.popRoute("Report");
                  },
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/images/report_1.svg"),
                          const SizedBox(width: 10),
                          Text(
                            "Report",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xffEA1F44)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            },
            if (post.userId == UserPreferences.userId) ...{
              const Divider(),
              Material(
                color: Colors.white,
                child: SizedBox(
                  width: double.maxFinite,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: InkWell(
                      onTap: () async {
                        await ref.read(postProvider).deletePost(
                              postId: post.postId,
                            );
                        if (inMyProfile) {
                          debugPrint("It is my post list");
                          ref
                              .read(
                                  userPostListProvider(UserPreferences.userId))
                              .deletePost(post);
                        } else {
                          debugPrint("It is other post list");
                          ref.read(postListProvider).deletePost(post);
                        }
                        context.router.root.popTop();
                      },
                      child: SizedBox(
                        width: double.maxFinite,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Row(
                            children: [
                              const Icon(Icons.delete_forever_outlined),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Delete Post',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            },
          ],
        ),
      );
    },
    initialHeight: 0.22,
  );
  return status;
}
