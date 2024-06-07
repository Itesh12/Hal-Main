import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/colors.dart';

void failDialog(BuildContext context,
    {String? message, Function()? onPressed}) {
  showDialog(
    context: context,
    builder: (_) => Dialog(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 416.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 82,
              height: 82,
              decoration: const BoxDecoration(
                color: redError,
                shape: BoxShape.circle,
              ),
              child: Center(child: SvgPicture.asset("assets/images/cross.svg")),
            ),
            14.verticalSpace,
            Text(
              "Failed",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            60.verticalSpace,
            Text(
              message ?? "Failed to upload",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h),
              child: ElevatedButton(
                onPressed: onPressed ?? () => Navigator.pop(context),
                child: const Text('Ok'),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
