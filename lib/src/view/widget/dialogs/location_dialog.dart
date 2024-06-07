import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';

void askLocationDialog(BuildContext context,
    {String? message, Function()? onPressed}) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      // title: Text("Location Access"),
      content: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 416.h),
        child: Column(
          children: [
            Text(
              "Location Access",
              style: TextStyle(
                  fontSize: 20.sp, color: brown, fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            Image.asset(
              'assets/images/location.png',
              height: 130.h,
            ),
            const Spacer(),
            Text(
              'Enable precise location',
              style: TextStyle(
                  color: primary, fontSize: 18.sp, fontWeight: FontWeight.w700),
            ),
            6.verticalSpace,
            SizedBox(
                width: 231.w,
                child: Text(
                  message ??
                      'Your location will be used to show you personalised information',
                  style: TextStyle(fontSize: 11.sp, color: grey),
                  textAlign: TextAlign.center,
                )),
            const Spacer(),
            ElevatedButton(
              onPressed: onPressed ?? () {},
              child: const Text('Allow'),
            ),
            18.verticalSpace,
          ],
        ),
      ),
    ),
  );
}
