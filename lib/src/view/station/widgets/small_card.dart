import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kisaan_station/src/constants/colors.dart';

class SmallCard extends StatelessWidget {
  const SmallCard({Key? key, required this.icon, required this.label})
      : super(key: key);

  final String icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.only(left: 13.w),
      height: 54.h,
      width: 145.w,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade200, spreadRadius: 2, blurRadius: 20)
          ],
          borderRadius: BorderRadius.circular(15.r)),
      child: Row(
        children: [
          SvgPicture.asset(icon),
          10.horizontalSpace,
          Text(
            label,
            style: textTheme.labelMedium!.copyWith(
                color: brown, fontSize: 12.sp, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
