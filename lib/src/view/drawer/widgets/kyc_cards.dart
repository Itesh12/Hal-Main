import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/colors.dart';
import '../../widget/percent_indicator.dart';

class KYCcards extends StatelessWidget {
  const KYCcards(
      {Key? key,
      required this.label,
      required this.leadingIcon,
      required this.percentage,
      required this.indicatorColor,
      required this.fillColor})
      : super(key: key);

  final String label;
  final String leadingIcon;
  final double percentage;
  final Color indicatorColor;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 18.h),
      child: Container(
        width: 304.w,
        height: 98.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade200, spreadRadius: 2, blurRadius: 20)
          ],
        ),
        // color: Colors.red,
        child: Padding(
          padding:
              EdgeInsets.only(top: 14.h, bottom: 14.h, left: 20.w, right: 10.w),
          child: Row(
            children: [
              CircularPercentIndicator(
                  radius: 60.0,
                  percent: percentage,
                  progressColor: indicatorColor,
                  backgroundColor: fillColor,
                  center: SvgPicture.asset(
                    leadingIcon,
                    height: 25.h,
                  )),
              20.horizontalSpace,
              Text(
                label,
                style: textTheme.titleSmall!.copyWith(color: brown),
              ),
              const Spacer(),
              if (percentage == 1)
                Container(
                    width: 47.w,
                    height: 14.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.r),
                      color: const Color(0xffDBEEEC),
                    ),
                    child: Center(
                        child: Text(
                      'completed',
                      style: TextStyle(
                          color: const Color(0xff18967D), fontSize: 8.sp),
                    ))),
              Icon(
                Icons.arrow_forward_ios,
                size: 16.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
