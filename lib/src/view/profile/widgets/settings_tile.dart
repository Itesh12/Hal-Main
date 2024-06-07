import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kisaan_station/src/app/router/router.gr.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({Key? key, required this.label}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(ChooseLanguageRoute(fromSetting: true));
      },
      child: SizedBox(
        width: 350.w,
        height: 80.h,
        child: Row(
          children: [
            Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                  color: const Color(0xffFEF9EE),
                  borderRadius: BorderRadius.all(Radius.circular(15.r))),
              child: Center(
                  child: SvgPicture.asset('assets/images/language_change.svg')),
            ),
            15.horizontalSpace,
            Text(
              label,
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff563E1F)),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}
