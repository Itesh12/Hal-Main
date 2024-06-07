import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/app/router/router.gr.dart';
import 'package:kisaan_station/src/constants/colors.dart';
import 'package:kisaan_station/src/constants/page_padding.dart';

import '../../../model/station/drone_service_model.dart';

@RoutePage()
class BookingStatusPage extends StatefulWidget {
  const BookingStatusPage({Key? key, required this.droneServiceModel})
      : super(key: key);
  final DroneServiceModel droneServiceModel;

  @override
  _BookingStatusPageState createState() => _BookingStatusPageState();
}

class _BookingStatusPageState extends State<BookingStatusPage> {
  int currentStep = 0;

  List<Step> steps = [
    const Step(
      title: Text('Step 1'),
      content: Text('Hello!'),
      isActive: true,
    ),
    const Step(
      title: Text('Step 2'),
      content: Text('World!'),
      isActive: true,
    ),
    const Step(
      title: Text('Step 3'),
      content: Text('Hello World!'),
      state: StepState.complete,
      isActive: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Booking Status',
          style: TextStyle(color: primary, fontSize: 18),
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: pagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.verticalSpace,
              Image.asset(
                'assets/images/drone_spraying.png',
                height: 40.h,
                width: 40.h,
              ),
              22.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.droneServiceModel.serviceName,
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xff929292),
                          fontWeight: FontWeight.w500)),
                  Text('Total Price',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xff929292),
                          fontWeight: FontWeight.w500)),
                ],
              ),
              5.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${widget.droneServiceModel.bookingDate} | ${widget.droneServiceModel.bookingStartTime}',
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  Text('Rs ${widget.droneServiceModel.estimatedPrice}',
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500)),
                ],
              ),
              30.verticalSpace,
              Container(
                padding: const EdgeInsets.all(15),
                // height: 318.h,
                width: 335.w,
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10.0,
                        spreadRadius: 0.1,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Track Order'),
                        Text(
                            'Booking ID: #${widget.droneServiceModel.bookingId}'),
                      ],
                    ),
                    const Divider(),
                    const ProgressStepsIndicator(
                      title: 'Service Requested Successfully',
                      isComplete: true,
                    ),
                    ProgressStepsIndicator(
                      title: 'Approval by kisaan station.',
                      isComplete: widget.droneServiceModel.orderStatus ==
                              "Approved" ||
                          widget.droneServiceModel.orderStatus ==
                              "On the way" ||
                          widget.droneServiceModel.orderStatus == "Delivered",
                    ),
                    ProgressStepsIndicator(
                      title: "Service on the way",
                      isComplete: widget.droneServiceModel.orderStatus ==
                              "On the way" ||
                          widget.droneServiceModel.orderStatus == "Delivered",
                    ),
                    ProgressStepsIndicator(
                      isLast: true,
                      title: 'Service Delivered',
                      isComplete:
                          widget.droneServiceModel.orderStatus == "Delivered",
                    ),
                  ],
                ),
              ),
              25.verticalSpace,
              Align(
                child: InkWell(
                  onTap: () {
                    context.router.push(BookingDetailsRoute(
                        droneServiceModel: widget.droneServiceModel));
                  },
                  child: Container(
                    height: 47.h,
                    width: 308.w,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.all(Radius.circular(34.r))),
                    child: const Center(
                        child: Text(
                      'View Booking details',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProgressStepsIndicator extends StatelessWidget {
  const ProgressStepsIndicator(
      {Key? key,
      this.isLast = false,
      required this.title,
      this.isComplete = false})
      : super(key: key);

  final bool isLast;
  final String title;
  final bool isComplete;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            if (isComplete)
              const Icon(
                Icons.check_circle,
                color: Color(0xff189634),
              )
            else
              Container(
                height: 22.h,
                width: 22.h,
                decoration: const BoxDecoration(
                    color: Color(0xffD9D9D9), shape: BoxShape.circle),
              ),
            if (!isLast)
              SizedBox(
                width: 1.5,
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        color: const Color(0xffB0B0B0),
                        height: 4,
                        width: 1,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 5,
                      );
                    },
                    itemCount: 5),
              ),
          ],
        ),
        10.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.black),
            ),
            // Text(
            //   "9:25 PM | 10 Aug'22",
            //   style: TextStyle(color: const Color(0xff8F8F8F), fontSize: 12.sp),
            // ),
          ],
        ),
      ],
    );
  }
}
