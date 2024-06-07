import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MyStationBigCard extends StatelessWidget {
  const MyStationBigCard({
    Key? key,
    required this.topColor,
    required this.bottomColor,
    required this.image,
    required this.label,
    this.ontap,
    required this.height,
    required this.width,
  }) : super(key: key);

  final Color topColor;
  final double height;
  final double width;
  final Color bottomColor;
  final String image;
  final String label;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(7.0.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.r),
        child: InkWell(
          onTap: ontap,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [
                topColor,
                bottomColor,
              ],
            )),
            height: 172.h,
            width: 153.w,
            child: Stack(
              children: [
                Positioned(
                    bottom: 0.h,
                    right: 0.w,
                    top: 0.h,
                    child: SvgPicture.asset(image)),
                Positioned(
                    bottom: 10.h,
                    left: 17.w,
                    child: SizedBox(
                        width: 110.w,
                        child: Text(label,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                                color: Colors.white)))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
