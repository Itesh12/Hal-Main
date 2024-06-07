import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/router/router.gr.dart';

@RoutePage()
class SellerInactivePage extends StatelessWidget {
  const SellerInactivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.router.replaceAll([const KisaanHomeRoute()]);
              print("click");
            },
            icon: const Icon(Icons.close_outlined)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.block_outlined),
                10.horizontalSpace,
                const Text(
                  "Your Account has been disabled by admin",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff563f1f)),
                ),
              ],
            ),
            8.verticalSpace,
            const Text(
              "Please contact",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff8c8c8c)),
            ),
            const Text(
              "+91 1356170900",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff563e1f)),
            ),
          ],
        ),
      ),
    );
  }
}
