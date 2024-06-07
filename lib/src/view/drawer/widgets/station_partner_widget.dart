import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kisaan_station/src/app/router/router.gr.dart';
import 'package:kisaan_station/src/l10n/l10n.dart';

import '../../../../global_providers.dart';

class HalSaathiWidget extends StatelessWidget {
  const HalSaathiWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      width: 223.w,
      // height: 113.h,
      decoration: BoxDecoration(
        color: const Color(0xffFFF3D7),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: 150.w,
                  child: Text(
                    'Want to become Hal Saathi ?',
                    style:
                    TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
                  )),
              const Spacer(),
              SvgPicture.asset('assets/images/info.svg')
            ],
          ),
          17.verticalSpace,
          Consumer(
            builder: (context, ref, child){
              return InkWell(
                onTap: () async {


                  final firstStatus = await ref
                      .read(droneServiceRepoProvider)
                      .getSellerFirstStatus();

                  if (firstStatus) {
                    debugPrint("AA GYA true ME");
                    final val = await ref
                        .read(droneServiceRepoProvider)
                        .getSellerStatus();
                    switch (val.status) {
                      case 'Pending':
                        Navigator.pop(context, true);
                        context.router.replaceAll(
                            [const SellerStatusRoute()]);
                        break;
                      case 'Rejected':
                        Navigator.pop(context, true);
                        context.router.replaceAll(
                            [const SellerStatusRoute()]);
                        break;
                      case 'Active':
                        Navigator.pop(context, true);
                        context.router
                            .replaceAll([const SellerRoute()]);
                        break;
                      case 'In-active':
                        Navigator.pop(context, true);
                        context.router.replaceAll(
                            [const SellerInactiveRoute()]);
                        break;
                    }
                  } else {
                    debugPrint("AA GYA DEBUG ME");
                    Navigator.pop(context, true);
                    context.router.replaceAll(
                        [const SellerVericationRoute()]);
                  }
                },
                child: Container(
                  width: 78.w,
                  height: 28.h,
                  decoration: BoxDecoration(
                      color: const Color(0xff563E1F),
                      borderRadius: BorderRadius.circular(4.r)),
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!.yes,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}




