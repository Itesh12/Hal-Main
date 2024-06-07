import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app/router/router.gr.dart';

@RoutePage()
class NoInternetPage extends StatelessWidget {
  const NoInternetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/no_connection.png",
              height: 224.h,
            ),
            12.verticalSpace,
            Text(
              "No Internet Connection",
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
                  "Please check your internet connection and try again",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  context.router.replaceAll([const KisaanHomeRoute()]);
                },
                child: const Text(
                  "Retry",
                ))
          ],
        )),
      ),
    );
  }
}
