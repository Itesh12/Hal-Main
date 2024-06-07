import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoItemWidget extends StatelessWidget {
  const NoItemWidget({Key? key, this.title, this.subTitle}) : super(key: key);

  final String? title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/no_item.png",
            height: 224.h,
          ),
          12.verticalSpace,
          Text(
            title ?? "No Item",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: SizedBox(
              width: 200,
              child: Text(
                subTitle ?? "Nothing to fetch",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class NoorderWidget extends StatelessWidget {
  const NoorderWidget({Key? key, this.title, this.subTitle, required this.icon})
      : super(key: key);

  final String? title;
  final String? subTitle;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/images/$icon.svg",
            height: 65.h,
          ),
          12.verticalSpace,
          Text(
            title ?? "No item",
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xff563e1f)),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: SizedBox(
              // width: 200,
              child: Text(
                subTitle ?? "You have not received any order yet.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff737373)),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
