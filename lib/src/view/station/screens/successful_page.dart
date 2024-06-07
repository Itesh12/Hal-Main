import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


@RoutePage()
class SuccessDroneSprayingPage extends StatelessWidget {
  const SuccessDroneSprayingPage({Key? key, required this.bookingId})
      : super(key: key);

  final String bookingId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            context.router.pop();
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            width: 150.h,
            height: 150.h,
            decoration: BoxDecoration(
              color: const Color(0xff50C878).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Container(
                width: 93.h,
                height: 93.h,
                decoration: const BoxDecoration(
                  color: Color(0xff50C878),
                  shape: BoxShape.circle,
                ),
                child:
                    Center(child: SvgPicture.asset("assets/images/check.svg")),
              ),
            ),
          ),
          14.verticalSpace,
          Text(
            "Your request successfully sent",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "to the Kisaan Station.",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "You will get notified once your order is",
            style: TextStyle(
              color: const Color(0xffABABAB),
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            "approved by the Kisan Station.",
            style: TextStyle(
              color: const Color(0xffABABAB),
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          85.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Booking ID: ',
                style: TextStyle(
                  color: const Color(0xffABABAB),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                bookingId,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
          60.verticalSpace,
          // ElevatedButton(onPressed: () {
          //   Navigator.pop(context);

          //   context.router.popAndPush(BookingStatusRoute(bookingId: bookingId));

          // }, child: const Text('View Booking Status')),
          24.verticalSpace,
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('Back to Home')),
        ],
      ),
    );
  }
}
