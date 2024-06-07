import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kisaan_station/src/constants/page_padding.dart';

import '../../../constants/colors.dart';

@RoutePage()
class BookingSuccessPage extends StatefulWidget {
  const BookingSuccessPage({Key? key}) : super(key: key);

  @override
  _BookingSuccessPageState createState() => _BookingSuccessPageState();
}

class _BookingSuccessPageState extends State<BookingSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.close,
            )),
      ),
      body: Padding(
        padding: pagePadding,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  Container(
                    width: 82,
                    height: 82,
                    decoration: const BoxDecoration(
                      color: green,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                        child: SvgPicture.asset("assets/images/check.svg")),
                  ),
                  25.verticalSpace,
                  Text(
                    "Your request is successfully sent to the Kisaan Station.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  20.verticalSpace,
                  Text(
                    "You will get notified once your order is approved by the Kisaan Station.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xffABABAB),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  85.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Booking ID:',
                        style: TextStyle(
                          color: const Color(0xffABABAB),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      5.horizontalSpace,
                      Text(
                        '#XL54DE',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                  75.verticalSpace,

                ],
              ),
            ),
            const Spacer(),
            // ElevatedButton(
            //   onPressed: () {

            //     context.router.push(BookingStatusRoute(bookingId: '89'));
            //   },
            //   // onPressed ?? () => Navigator.pop(context),
            //   child: const Text('View Booking Status'),
            // ),
            25.verticalSpace,
            const ElevatedButton(
              onPressed: null,
              // onPressed ?? () => Navigator.pop(context),
              child: Text('Back to Home'),
            ),
            25.verticalSpace
          ],
        ),
      ),
    );
  }
}
