import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';

Future<bool?> askFarmLocationDialog(BuildContext context,
    {String? title,
    bool subTitle = true,
    String? message,
    Function()? onPressed}) async {
  return showDialog<bool>(
    context: context,
    builder: (_) => AlertDialog(
      // title: Text("Location Access"),
      content: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 416.h),
        child: Column(
          children: [
            Text(
              title ?? "Allow Location Access",
              style: TextStyle(
                  fontSize: 20.sp, color: brown, fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            Image.asset(
              'assets/images/location.png',
              height: 136.w,
            ),
            7.verticalSpace,
            SizedBox(
                width: 231.w,
                child: Text(
                  message ??
                      'To measure your farm you have to be present in your field',
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w400, color: grey),
                  textAlign: TextAlign.center,
                )),
            const Spacer(),
            ElevatedButton(
              onPressed: onPressed ?? () {},
              child: const Text(
                'Yes',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            18.verticalSpace,
          ],
        ),
      ),
    ),
  );
}
