import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kisaan_station/global_providers.dart';
import 'package:kisaan_station/src/constants/colors.dart';

import '../../../model/station/seller_status_model.dart';
import '../../../util/services/shared_preferences.dart';
import '../../widget/profile_image.dart';

@RoutePage()
class SellerProfilePage extends ConsumerStatefulWidget {
  const SellerProfilePage({super.key});

  @override
  ConsumerState<SellerProfilePage> createState() =>
      _ConsumerSellerProfilePageState();
}

class _ConsumerSellerProfilePageState extends ConsumerState<SellerProfilePage> {
  SellerStatusModel? sellerStatusModel;

  @override
  void initState() {
    super.initState();

    _getData();
  }

  Future<void> _getData() async {
    final val = await ref.read(droneServiceRepoProvider).getSellerStatus();
    try {
      sellerStatusModel =
          await ref.read(droneServiceRepoProvider).getSellerStatus();
      setState(() {});
      print("debug coming");
    } on Exception {
      // TODO
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 21,
            )),
        centerTitle: true,
        title: const Text(
          "My Profile",
          style: TextStyle(
            fontSize: 18,
            color: primary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Stack(children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: IconButton(
                        onPressed: () {},
                        icon: ProfilePicWidget(
                          url: UserPreferences.profilePic,
                          // size: 100,
                          fizedSize: true,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 13,
                      right: 1,
                      child: SvgPicture.asset(
                        'assets/images/tick.svg',
                        // color: const Color(0xffce9141),
                        height: 30,
                        width: 30,
                      ),
                    )
                  ]),
                  Text(
                    sellerStatusModel?.fullName ?? UserPreferences.userName,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        color: Color(0xff200e32),
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            10.verticalSpace,
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                         const Text(
                          "Hal Saathi Type:",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xff563e1f),
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "  ${sellerStatusModel?.sellerType}" ?? "No Seller Type",
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              color: Color(0xff563e1f),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    10.verticalSpace,
                    const Text(
                      "About me",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xff563e1f),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    10.verticalSpace,
                    Text(
                      sellerStatusModel?.businessDetails ?? "No buinessDetails",
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          color: Color(0xff563e1f),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
            15.verticalSpace,
            const Divider(
              color: Color(0xffd6d6d6),
              thickness: 1.5,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Address",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff563e1f),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  10.verticalSpace,
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/Loc-1.svg',
                        color: const Color(0xffce9141),
                        height: 15,
                        width: 15,
                      ),
                      10.horizontalSpace,
                      const Text(
                        "Greater Kailash, New Delhi, 928351",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xff563e1f),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  20.verticalSpace,
                  const Text(
                    "User Id",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff563e1f),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  10.verticalSpace,
                  Row(
                    children: [
                      const Icon(
                        Icons.call_outlined,
                        color: Color(0xffce9141),
                        size: 15,
                      ),
                      // SvgPicture.asset(
                      //   'assets/images/call.svg',
                      //   color: const Color(0xffce9141),
                      //   // height: 15,
                      //   // width: 15,
                      // ),
                      10.horizontalSpace,
                      Text(
                        UserPreferences.userId,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            color: Color(0xff563e1f),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  10.verticalSpace,
                  Row(
                    children: [
                      const Icon(
                        Icons.email_outlined,
                        color: Color(0xffce9141),
                        size: 15,
                      ),
                      10.horizontalSpace,
                      Text(
                        sellerStatusModel?.email ?? "No email addded",
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            color: Color(0xff563e1f),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
