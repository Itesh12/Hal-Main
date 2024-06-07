import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kisaan_station/src/app/router/router.gr.dart';

import '../../../../constants/colors.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key, required this.hintText}) : super(key: key);

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(const SearchRoute());
      },
      child: Container(
        height: 47.h,
        width: 400,
        decoration: BoxDecoration(
          color: white,
          border: Border.all(
            color: const Color(0x4FD9D9D9),
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 12, 0),
              child: SvgPicture.asset("assets/images/search.svg"),
            ),
            Expanded(
                child: Text(
              hintText,
              style: TextStyle(
                fontSize: 14.sp,
                color: const Color(0x5F563F1F),
              ),
            )),
            // Padding(
            //   padding: const EdgeInsets.only(right: 14),
            //   child: SvgPicture.asset("assets/images/mic.svg"),
            // ),
          ],
        ),
      ),
    );
  }
}
