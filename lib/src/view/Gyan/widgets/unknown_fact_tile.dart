import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kisaan_station/src/constants/colors.dart';

class UnknownFactTile extends StatelessWidget {
  const UnknownFactTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: 334.w,
      height: 118.h,
      decoration: BoxDecoration(
          color: const Color(0xffFFFBF1),
          border: Border.all(color: const Color(0xffFFED9F)),
          borderRadius: BorderRadius.circular(10.r)),
      child: Padding(
        padding: EdgeInsets.all(15.h),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Today's Unknown Fact",
                  style: textTheme.labelLarge!.copyWith(color: brown),
                ),
                const Spacer(),
                InkWell(
                    onTap: () {},
                    child: SvgPicture.asset('assets/images/share_outlied.svg')),
                17.horizontalSpace,
                InkWell(
                    onTap: () {},
                    child: SvgPicture.asset('assets/images/saved_outlied.svg')),
              ],
            ),
            15.verticalSpace,
            Row(
              children: [
                Image.asset(
                  'assets/images/bulb.png',
                  height: 30.h,
                ),
                11.horizontalSpace,
                SizedBox(
                    width: 262.w,
                    child: const Text(
                      'A farmer is a magician who produces money from the mud.',
                      style: TextStyle(
                          color: primary, fontWeight: FontWeight.w500),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
