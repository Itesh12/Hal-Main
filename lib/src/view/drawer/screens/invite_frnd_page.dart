import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/constants/colors.dart';
import 'package:kisaan_station/src/constants/page_padding.dart';
import 'package:kisaan_station/src/util/services/shared_preferences.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../global_providers.dart';

@RoutePage()
class InviteFriendPage extends ConsumerStatefulWidget {
  const InviteFriendPage({Key? key}) : super(key: key);

  @override
  _InviteFrndState createState() => _InviteFrndState();
}

class _InviteFrndState extends ConsumerState<InviteFriendPage> {
  String? refercode;
  Uri? link;

  // Future<void> dynamicLinkCreate() async {
  //   link = await ref
  //       .read(dynamicLinkProvider)
  //       .createDynamicLinkAppShare(referralCode: refercode!);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(elevation: 0.5),
      body: const Padding(
        padding: pagePadding,
        child: Center(
          child: Text("Coming soon 🚀"),
          // child: Column(
          //   children: [
          //     60.verticalSpace,
          //     SizedBox(
          //         width: 276.w,
          //         child: Text(
          //           "Invite your friend to grow farmer's community",
          //           style: TextStyle(
          //               fontSize: 18.sp,
          //               color: brown,
          //               fontWeight: FontWeight.w500),
          //           textAlign: TextAlign.center,
          //         )),
          //     42.verticalSpace,
          //     Container(
          //         height: 243.h,
          //         width: 246.w,
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(12.r),
          //             border: Border.all(color: const Color(0xffEBEBEB))),
          //         child: Image.asset(
          //           'assets/images/wlcm_screen/farmer.png',
          //           fit: BoxFit.cover,
          //         )),
          //     10.verticalSpace,
          //     SizedBox(
          //         width: 229.w,
          //         child: Text(
          //           'Send invite with referral code and grow together',
          //           style: TextStyle(
          //               fontSize: 14.sp,
          //               color: brown,
          //               fontWeight: FontWeight.w500),
          //           textAlign: TextAlign.center,
          //         )),
          //     52.verticalSpace,
          //     const Text(
          //       'Your referral code',
          //       style: TextStyle(color: primary),
          //     ),
          //     11.verticalSpace,
          //     SizedBox(
          //       width: 220.w,
          //       height: 46.h,
          //       child: DottedBorder(
          //         borderType: BorderType.RRect,
          //         radius: Radius.circular(25.r),
          //         child: Center(
          //           child: Consumer(
          //             builder: (context, ref, child) {
          //               final val =
          //                   ref.watch(userController(UserPreferences.userId));
          //               return val.whenOrNull(data: (user) {
          //                     refercode = user.referralCode;
          //                     // dynamicLinkCreate();
          //                     return Text(
          //                       refercode!,
          //                       style: TextStyle(fontSize: 18.sp),
          //                     );
          //                   }) ??
          //                   const CircularProgressIndicator();
          //             },
          //           ),
          //         ),
          //       ),
          //     ),
          //     20.verticalSpace,
          //     ElevatedButton(
          //         onPressed: () {
          //           if (refercode != null && link != null) {
          //             debugPrint("Refercode: $refercode");
          //             Share.share(
          //                 "Hey! Check out this awesome app that fulfill the farmers need! "
          //                 "Use my referral code $refercode to signup on Kisaan Station.\n"
          //                 "Download the app: $link");
          //           }
          //         },
          //         child: const Text('Send Invite'))
          //   ],
          // ),
        ),
      ),
    );
  }
}
