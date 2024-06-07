import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class KrishiGyanTiles extends StatelessWidget {
  const KrishiGyanTiles({
    Key? key,
    required this.topColor,
    required this.bottomColor,
    required this.image,
    required this.label,
    this.ontap,
  }) : super(key: key);
  final Color topColor;
  final Color bottomColor;
  final String image;
  final String label;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.h),
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
            height: 179.h,
            width: 150.w,
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
                        width: 100.w,
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
