import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/constants/colors.dart';
import 'package:kisaan_station/src/constants/page_padding.dart';

import '../../../model/station/drone_service_model.dart';

@RoutePage()
class BookingDetailsPage extends StatefulWidget {
  const BookingDetailsPage({Key? key, required this.droneServiceModel})
      : super(key: key);

  final DroneServiceModel droneServiceModel;

  @override
  _BookingDetailsPageState createState() => _BookingDetailsPageState();
}

class _BookingDetailsPageState extends State<BookingDetailsPage> {
  final bool _ismore = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
            )),
        centerTitle: false,
        title: const Text(
          'Booking Details',
          style: TextStyle(color: primary, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   width: 375.w,
            //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            //   color: const Color(0xffFAF4EC),
            //   child: const Text(
            //     'Awaiting Confirmation',
            //     style: TextStyle(color: Color(0xffCE9141)),
            //   ),
            // ),
            Padding(
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
                  20.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.droneServiceModel.serviceName,
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: const Color(0xff929292),
                              fontWeight: FontWeight.w500)),
                      Text('Booking ID: #${widget.droneServiceModel.bookingId}',
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: const Color(0xffe26b26),
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  5.verticalSpace,
                  Text(
                    '${widget.droneServiceModel.bookingDate} | ${widget.droneServiceModel.bookingStartTime}',
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  15.verticalSpace,
                  const Divider(thickness: 1),
                  5.verticalSpace,
                ],
              ),
            ),

            Padding(
              padding: pagePadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order Details',
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: primary,
                        fontWeight: FontWeight.w600),
                  ),
                  5.verticalSpace,
                  Text(
                    "Name",
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: brown,
                        fontWeight: FontWeight.w600),
                  ),
                  3.verticalSpace,
                  Text(
                    widget.droneServiceModel.name,
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: grey,
                        fontWeight: FontWeight.w400),
                  ),
                  8.verticalSpace,
                  const Divider(thickness: 1),
                  3.verticalSpace,
                  Text(
                    "Number",
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: brown,
                        fontWeight: FontWeight.w600),
                  ),
                  3.verticalSpace,
                  Text(
                    "+91 ${widget.droneServiceModel.mobileNo}",
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: grey,
                        fontWeight: FontWeight.w400),
                  ),
                  8.verticalSpace,
                  const Divider(thickness: 1),
                  3.verticalSpace,
                  Text(
                    "Farm Location",
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: brown,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    widget.droneServiceModel.addFarmLocation.address,
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: grey,
                        fontWeight: FontWeight.w400),
                  ),
                  8.verticalSpace,
                  const Divider(thickness: 1),
                  3.verticalSpace,
                  Text(
                    "Farm Size",
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: brown,
                        fontWeight: FontWeight.w600),
                  ),
                  3.verticalSpace,
                  Text(
                    "${widget.droneServiceModel.addFarmDetails[0].area} ${widget.droneServiceModel.addFarmDetails[0].areaUnit}",
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: grey,
                        fontWeight: FontWeight.w400),
                  ),
                  8.verticalSpace,
                  const Divider(thickness: 1),
                  3.verticalSpace,
                  Text(
                    "Crop Type",
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: brown,
                        fontWeight: FontWeight.w600),
                  ),
                  3.verticalSpace,
                  Text(
                    widget.droneServiceModel.cropType,
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: grey,
                        fontWeight: FontWeight.w400),
                  ),
                  8.verticalSpace,
                  const Divider(thickness: 1),
                  3.verticalSpace,
                  Text(
                    "Spray Product ",
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: brown,
                        fontWeight: FontWeight.w600),
                  ),
                  3.verticalSpace,
                  if (widget.droneServiceModel.sparyProduct.runtimeType ==
                      String)
                    Text(
                      widget.droneServiceModel.sparyProduct,
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: grey,
                          fontWeight: FontWeight.w400),
                    )
                  else
                    const Text("Not added"),
                  8.verticalSpace,
                  const Divider(thickness: 1),
                  3.verticalSpace,
                  Text(
                    "Estimated Price",
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: brown,
                        fontWeight: FontWeight.w600),
                  ),
                  3.verticalSpace,
                  Text(
                    widget.droneServiceModel.estimatedPrice.toString(),
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: grey,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),

            // Padding(
            //   padding: pagePadding,
            //   child: _ismore
            //       ? Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [

            //             Text(
            //               'Personal Details',
            //               style: TextStyle(
            //                   fontSize: 14.sp,
            //                   color: Colors.black87,
            //                   fontWeight: FontWeight.w500),
            //             ),
            //             Text(
            //               'Aditya Raj Pandey | +92 7542317298',
            //               style: TextStyle(
            //                 fontSize: 14.sp,
            //                 color: grey,
            //               ),
            //             ),
            //             20.verticalSpace,
            //             Row(
            //               children: [
            //                 SizedBox(
            //                     width: 150.w,
            //                     child: Text(
            //                       'Farm Location',
            //                       style: TextStyle(
            //                           fontSize: 14.sp,
            //                           color: Colors.black,
            //                           fontWeight: FontWeight.w500),
            //                     )),
            //                 SizedBox(
            //                     width: 100.w,
            //                     child: Text(
            //                       'Farm Size',
            //                       style: TextStyle(
            //                           fontSize: 14.sp,
            //                           color: Colors.black,
            //                           fontWeight: FontWeight.w500),
            //                     )),
            //                 SizedBox(
            //                     width: 70.w,
            //                     child: Text(
            //                       'Dilution',
            //                       style: TextStyle(
            //                           fontSize: 14.sp,
            //                           color: Colors.black,
            //                           fontWeight: FontWeight.w500),
            //                     )),
            //               ],
            //             ),
            //             Row(
            //               children: [
            //                 SizedBox(
            //                     width: 150.w,
            //                     child: Text(
            //                       'Noida ,Sector 62',
            //                       style: TextStyle(
            //                         fontSize: 14.sp,
            //                         color: grey,
            //                       ),
            //                     )),
            //                 SizedBox(
            //                     width: 100.w,
            //                     child: Text(
            //                       '22 Bigha',
            //                       style: TextStyle(
            //                         fontSize: 14.sp,
            //                         color: grey,
            //                       ),
            //                     )),
            //                 SizedBox(
            //                     width: 70.w,
            //                     child: Text(
            //                       '1 Kg in 8 Ltrs',
            //                       style: TextStyle(
            //                         fontSize: 14.sp,
            //                         color: grey,
            //                       ),
            //                     )),
            //               ],
            //             ),
            //             25.verticalSpace,
            //           ],
            //         )
            //       : Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             const Text('More Details'),
            //             InkWell(
            //               onTap: () {
            //                 _ismore = !_ismore;
            //                 setState(() {});
            //               },
            //               child: const Icon(Icons.expand_more),
            //             )
            //           ],
            //         ),
            // ),
            // 5.verticalSpace,
            // const Divider(
            //   thickness: 2,
            // ),
            // 5.verticalSpace,
            // Padding(
            //   padding: pagePadding,
            //   child: Row(
            //     children: [
            //       SizedBox(
            //           width: 130.w,
            //           child: Text(
            //             'ITEM',
            //             style: TextStyle(
            //                 fontSize: 14.sp,
            //                 color: const Color(0xff929292),
            //                 fontWeight: FontWeight.w500),
            //           )),
            //       SizedBox(
            //           width: 70.w,
            //           child: Text(
            //             'RATE',
            //             style: TextStyle(
            //                 fontSize: 14.sp,
            //                 color: const Color(0xff929292),
            //                 fontWeight: FontWeight.w500),
            //           )),
            //       SizedBox(
            //           width: 70.w,
            //           child: Text(
            //             'QTY',
            //             style: TextStyle(
            //                 fontSize: 14.sp,
            //                 color: const Color(0xff929292),
            //                 fontWeight: FontWeight.w500),
            //           )),
            //       Text(
            //         'SUBTOTAL',
            //         style: TextStyle(
            //             fontSize: 14.sp,
            //             color: const Color(0xff929292),
            //             fontWeight: FontWeight.w500),
            //       ),
            //     ],
            //   ),
            // ),
            // const Divider(
            //   thickness: 2,
            // ),
            // Padding(
            //   padding: pagePadding,
            //   child: Row(
            //     children: [
            //       SizedBox(
            //           width: 130.w,
            //           child: Text('Drone Spraying',
            //               style: TextStyle(
            //                   fontSize: 14.sp,
            //                   color: Colors.black87,
            //                   fontWeight: FontWeight.w500))),
            //       SizedBox(
            //           width: 70.w,
            //           child: Text('7500/acre',
            //               style: TextStyle(
            //                   fontSize: 14.sp,
            //                   color: Colors.black87,
            //                   fontWeight: FontWeight.w500))),
            //       SizedBox(
            //           width: 70.w,
            //           child: Text('7 acres',
            //               style: TextStyle(
            //                   fontSize: 14.sp,
            //                   color: Colors.black87,
            //                   fontWeight: FontWeight.w500))),
            //       Text('Rs 3,500',
            //           style: TextStyle(
            //               fontSize: 14.sp,
            //               color: Colors.black87,
            //               fontWeight: FontWeight.w500)),
            //     ],
            //   ),
            // ),
            // 10.verticalSpace,
            // Padding(
            //   padding: pagePadding,
            //   child: Row(
            //     children: [
            //       SizedBox(
            //           width: 130.w,
            //           child: Text('Fertiliser',
            //               style: TextStyle(
            //                   fontSize: 14.sp,
            //                   color: Colors.black87,
            //                   fontWeight: FontWeight.w500))),
            //       SizedBox(
            //           width: 70.w,
            //           child: Text('Rs 250/ kg',
            //               style: TextStyle(
            //                   fontSize: 14.sp,
            //                   color: Colors.black87,
            //                   fontWeight: FontWeight.w500))),
            //       SizedBox(
            //           width: 70.w,
            //           child: Text('2 Kg',
            //               style: TextStyle(
            //                   fontSize: 14.sp,
            //                   color: Colors.black87,
            //                   fontWeight: FontWeight.w500))),
            //       Text('Rs 500',
            //           style: TextStyle(
            //               fontSize: 14.sp,
            //               color: Colors.black87,
            //               fontWeight: FontWeight.w500)),
            //     ],
            //   ),
            // ),
            // if (_ismore)
            //   Column(
            //     children: [
            //       20.verticalSpace,
            //       const Divider(
            //         thickness: 2,
            //       ),
            //       25.verticalSpace,
            //       Center(
            //         child: Container(
            //           padding: const EdgeInsets.symmetric(horizontal: 10),
            //           decoration: BoxDecoration(
            //             boxShadow: [
            //               BoxShadow(
            //                 color: Colors.black12.withOpacity(0.05),
            //                 blurRadius: 10.0,
            //                 spreadRadius: 0.1,
            //               ),
            //             ],
            //           ),
            //           child: CustomPaint(
            //             size:
            //                 Size(335.w, (335.w * 0.447887323943662).toDouble()),
            //             //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            //             painter: RPSCustomPainter(),
            //             child: Padding(
            //               padding: EdgeInsets.symmetric(
            //                   horizontal: 25.w, vertical: 25.h),
            //               child: Column(
            //                 children: [
            //                   Row(
            //                     children: [
            //                       Text(
            //                         'Subtotal',
            //                         style: TextStyle(
            //                             fontSize: 14.sp,
            //                             color: const Color(0xff929292),
            //                             fontWeight: FontWeight.w500),
            //                       ),
            //                       const Spacer(),
            //                       const Text('Rs. 4,000'),
            //                     ],
            //                   ),
            //                   5.verticalSpace,
            //                   Row(
            //                     children: [
            //                       Row(
            //                         children: [
            //                           Text(
            //                             'Discount',
            //                             style: TextStyle(
            //                                 fontSize: 14.sp,
            //                                 color: const Color(0xff929292),
            //                                 fontWeight: FontWeight.w500),
            //                           ),
            //                           10.horizontalSpace,
            //                           Container(
            //                             height: 20,
            //                             width: 25.w,
            //                             padding: const EdgeInsets.only(top: 2),
            //                             decoration: BoxDecoration(
            //                                 color: const Color(0xff3B72ED),
            //                                 borderRadius: BorderRadius.all(
            //                                     Radius.circular(2.r))),
            //                             child: const Center(
            //                                 child: Text(
            //                               '12%',
            //                               style: TextStyle(
            //                                   height: 1.5,
            //                                   color: Colors.white,
            //                                   fontSize: 12),
            //                             )),
            //                           )
            //                         ],
            //                       ),
            //                       const Spacer(),
            //                       const Text('Rs. 300'),
            //                     ],
            //                   ),
            //                   5.verticalSpace,
            //                   Row(
            //                     children: [
            //                       Text(
            //                         'TAX',
            //                         style: TextStyle(
            //                             fontSize: 14.sp,
            //                             color: const Color(0xff929292),
            //                             fontWeight: FontWeight.w500),
            //                       ),
            //                       const Spacer(),
            //                       const Text('Rs. 300'),
            //                     ],
            //                   ),
            //                   5.verticalSpace,
            //                   const Divider(
            //                     thickness: 1,
            //                   ),
            //                   Row(
            //                     children: const [
            //                       Text('GRAND TOTAL'),
            //                       Spacer(),
            //                       Text('Rs. 4,000/-'),
            //                     ],
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // if (_ismore) 50.verticalSpace else 200.verticalSpace,
            // Padding(
            //   padding: pagePadding,
            //   child: Row(
            //     children: [
            //       Expanded(
            //           child: Column(
            //         children: [
            //           Text(
            //             'Total Amount',
            //             style: TextStyle(
            //                 fontSize: 14.sp,
            //                 color: const Color(0xff929292),
            //                 fontWeight: FontWeight.w500),
            //           ),
            //           Text(
            //             'Rs 6,450',
            //             style: TextStyle(
            //                 fontSize: 20.sp,
            //                 color: Colors.black87,
            //                 fontWeight: FontWeight.bold),
            //           ),
            //         ],
            //       )),
            //       Expanded(
            //           child: ElevatedButton(
            //         onPressed: () {},
            //         child: const Text('Pay Now'),
            //       )),
            //     ],
            //   ),
            // ),
            // 20.verticalSpace,
          ],
        ),
      ),
    );
  }
}

//Add this CustomPaint widget to the Widget Tree

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Path path_0 = Path();
    path_0.moveTo(size.width * 0.03943662, size.height * 0.06289308);
    path_0.cubicTo(
        size.width * 0.03321380,
        size.height * 0.06289308,
        size.width * 0.02816901,
        size.height * 0.07415660,
        size.width * 0.02816901,
        size.height * 0.08805031);
    path_0.lineTo(size.width * 0.02816901, size.height * 0.8742138);
    path_0.cubicTo(
        size.width * 0.02816901,
        size.height * 0.9089497,
        size.width * 0.04078056,
        size.height * 0.9371069,
        size.width * 0.05633803,
        size.height * 0.9371069);
    path_0.lineTo(size.width * 0.05637606, size.height * 0.9371069);
    path_0.cubicTo(
        size.width * 0.05637606,
        size.height * 0.9189560,
        size.width * 0.06211662,
        size.height * 0.9042390,
        size.width * 0.06919775,
        size.height * 0.9042390);
    path_0.cubicTo(
        size.width * 0.07627887,
        size.height * 0.9042390,
        size.width * 0.08201915,
        size.height * 0.9189560,
        size.width * 0.08201915,
        size.height * 0.9371069);
    path_0.lineTo(size.width * 0.09227662, size.height * 0.9371069);
    path_0.cubicTo(
        size.width * 0.09227662,
        size.height * 0.9189560,
        size.width * 0.09801690,
        size.height * 0.9042390,
        size.width * 0.1050980,
        size.height * 0.9042390);
    path_0.cubicTo(
        size.width * 0.1121792,
        size.height * 0.9042390,
        size.width * 0.1179194,
        size.height * 0.9189560,
        size.width * 0.1179194,
        size.height * 0.9371069);
    path_0.lineTo(size.width * 0.1281766, size.height * 0.9371069);
    path_0.cubicTo(
        size.width * 0.1281766,
        size.height * 0.9189560,
        size.width * 0.1339169,
        size.height * 0.9042390,
        size.width * 0.1409980,
        size.height * 0.9042390);
    path_0.cubicTo(
        size.width * 0.1480792,
        size.height * 0.9042390,
        size.width * 0.1538194,
        size.height * 0.9189560,
        size.width * 0.1538194,
        size.height * 0.9371069);
    path_0.lineTo(size.width * 0.1640769, size.height * 0.9371069);
    path_0.cubicTo(
        size.width * 0.1640769,
        size.height * 0.9189560,
        size.width * 0.1698172,
        size.height * 0.9042390,
        size.width * 0.1768983,
        size.height * 0.9042390);
    path_0.cubicTo(
        size.width * 0.1839794,
        size.height * 0.9042390,
        size.width * 0.1897200,
        size.height * 0.9189560,
        size.width * 0.1897200,
        size.height * 0.9371069);
    path_0.lineTo(size.width * 0.1999769, size.height * 0.9371069);
    path_0.cubicTo(
        size.width * 0.1999769,
        size.height * 0.9189560,
        size.width * 0.2057175,
        size.height * 0.9042390,
        size.width * 0.2127983,
        size.height * 0.9042390);
    path_0.cubicTo(
        size.width * 0.2198794,
        size.height * 0.9042390,
        size.width * 0.2256200,
        size.height * 0.9189560,
        size.width * 0.2256200,
        size.height * 0.9371069);
    path_0.lineTo(size.width * 0.2358775, size.height * 0.9371069);
    path_0.cubicTo(
        size.width * 0.2358775,
        size.height * 0.9189560,
        size.width * 0.2416177,
        size.height * 0.9042390,
        size.width * 0.2486989,
        size.height * 0.9042390);
    path_0.cubicTo(
        size.width * 0.2557800,
        size.height * 0.9042390,
        size.width * 0.2615203,
        size.height * 0.9189560,
        size.width * 0.2615203,
        size.height * 0.9371069);
    path_0.lineTo(size.width * 0.2717775, size.height * 0.9371069);
    path_0.cubicTo(
        size.width * 0.2717775,
        size.height * 0.9189560,
        size.width * 0.2775177,
        size.height * 0.9042390,
        size.width * 0.2846000,
        size.height * 0.9042390);
    path_0.cubicTo(
        size.width * 0.2916789,
        size.height * 0.9042390,
        size.width * 0.2974197,
        size.height * 0.9189560,
        size.width * 0.2974197,
        size.height * 0.9371069);
    path_0.lineTo(size.width * 0.3076789, size.height * 0.9371069);
    path_0.cubicTo(
        size.width * 0.3076789,
        size.height * 0.9189560,
        size.width * 0.3134169,
        size.height * 0.9042390,
        size.width * 0.3204986,
        size.height * 0.9042390);
    path_0.cubicTo(
        size.width * 0.3275803,
        size.height * 0.9042390,
        size.width * 0.3333211,
        size.height * 0.9189560,
        size.width * 0.3333211,
        size.height * 0.9371069);
    path_0.lineTo(size.width * 0.3435775, size.height * 0.9371069);
    path_0.cubicTo(
        size.width * 0.3435775,
        size.height * 0.9189560,
        size.width * 0.3493183,
        size.height * 0.9042390,
        size.width * 0.3564000,
        size.height * 0.9042390);
    path_0.cubicTo(
        size.width * 0.3634817,
        size.height * 0.9042390,
        size.width * 0.3692197,
        size.height * 0.9189560,
        size.width * 0.3692197,
        size.height * 0.9371069);
    path_0.lineTo(size.width * 0.3794789, size.height * 0.9371069);
    path_0.cubicTo(
        size.width * 0.3794789,
        size.height * 0.9189560,
        size.width * 0.3852169,
        size.height * 0.9042390,
        size.width * 0.3922986,
        size.height * 0.9042390);
    path_0.cubicTo(
        size.width * 0.3993803,
        size.height * 0.9042390,
        size.width * 0.4051211,
        size.height * 0.9189560,
        size.width * 0.4051211,
        size.height * 0.9371069);
    path_0.lineTo(size.width * 0.4153775, size.height * 0.9371069);
    path_0.cubicTo(
        size.width * 0.4153775,
        size.height * 0.9189560,
        size.width * 0.4211183,
        size.height * 0.9042390,
        size.width * 0.4282000,
        size.height * 0.9042390);
    path_0.cubicTo(
        size.width * 0.4352817,
        size.height * 0.9042390,
        size.width * 0.4410197,
        size.height * 0.9189560,
        size.width * 0.4410197,
        size.height * 0.9371069);
    path_0.lineTo(size.width * 0.4512789, size.height * 0.9371069);
    path_0.cubicTo(
        size.width * 0.4512789,
        size.height * 0.9189560,
        size.width * 0.4570197,
        size.height * 0.9042390,
        size.width * 0.4640986,
        size.height * 0.9042390);
    path_0.cubicTo(
        size.width * 0.4711803,
        size.height * 0.9042390,
        size.width * 0.4769211,
        size.height * 0.9189560,
        size.width * 0.4769211,
        size.height * 0.9371069);
    path_0.lineTo(size.width * 0.4871775, size.height * 0.9371069);
    path_0.cubicTo(
        size.width * 0.4871775,
        size.height * 0.9189560,
        size.width * 0.4929183,
        size.height * 0.9042390,
        size.width * 0.5000000,
        size.height * 0.9042390);
    path_0.cubicTo(
        size.width * 0.5070817,
        size.height * 0.9042390,
        size.width * 0.5128225,
        size.height * 0.9189560,
        size.width * 0.5128225,
        size.height * 0.9371069);
    path_0.lineTo(size.width * 0.5230789, size.height * 0.9371069);
    path_0.cubicTo(
        size.width * 0.5230789,
        size.height * 0.9189560,
        size.width * 0.5288197,
        size.height * 0.9042390,
        size.width * 0.5359014,
        size.height * 0.9042390);
    path_0.cubicTo(
        size.width * 0.5429803,
        size.height * 0.9042390,
        size.width * 0.5487211,
        size.height * 0.9189560,
        size.width * 0.5487211,
        size.height * 0.9371069);
    path_0.lineTo(size.width * 0.5589803, size.height * 0.9371069);
    path_0.cubicTo(
        size.width * 0.5589803,
        size.height * 0.9189560,
        size.width * 0.5647183,
        size.height * 0.9042390,
        size.width * 0.5718000,
        size.height * 0.9042390);
    path_0.cubicTo(
        size.width * 0.5788817,
        size.height * 0.9042390,
        size.width * 0.5846225,
        size.height * 0.9189560,
        size.width * 0.5846225,
        size.height * 0.9371069);
    path_0.lineTo(size.width * 0.5948789, size.height * 0.9371069);
    path_0.cubicTo(
        size.width * 0.5948789,
        size.height * 0.9189560,
        size.width * 0.6006197,
        size.height * 0.9042390,
        size.width * 0.6077014,
        size.height * 0.9042390);
    path_0.cubicTo(
        size.width * 0.6147831,
        size.height * 0.9042390,
        size.width * 0.6205211,
        size.height * 0.9189560,
        size.width * 0.6205211,
        size.height * 0.9371069);
    path_0.lineTo(size.width * 0.6307803, size.height * 0.9371069);
    path_0.cubicTo(
        size.width * 0.6307803,
        size.height * 0.9189560,
        size.width * 0.6365183,
        size.height * 0.9042390,
        size.width * 0.6436000,
        size.height * 0.9042390);
    path_0.cubicTo(
        size.width * 0.6506817,
        size.height * 0.9042390,
        size.width * 0.6564225,
        size.height * 0.9189560,
        size.width * 0.6564225,
        size.height * 0.9371069);
    path_0.lineTo(size.width * 0.6666789, size.height * 0.9371069);
    path_0.cubicTo(
        size.width * 0.6666789,
        size.height * 0.9189560,
        size.width * 0.6724197,
        size.height * 0.9042390,
        size.width * 0.6795014,
        size.height * 0.9042390);
    path_0.cubicTo(
        size.width * 0.6865831,
        size.height * 0.9042390,
        size.width * 0.6923239,
        size.height * 0.9189560,
        size.width * 0.6923239,
        size.height * 0.9371069);
    path_0.lineTo(size.width * 0.7025803, size.height * 0.9371069);
    path_0.cubicTo(
        size.width * 0.7025803,
        size.height * 0.9189560,
        size.width * 0.7083211,
        size.height * 0.9042390,
        size.width * 0.7154000,
        size.height * 0.9042390);
    path_0.cubicTo(
        size.width * 0.7224817,
        size.height * 0.9042390,
        size.width * 0.7282225,
        size.height * 0.9189560,
        size.width * 0.7282225,
        size.height * 0.9371069);
    path_0.lineTo(size.width * 0.7384789, size.height * 0.9371069);
    path_0.cubicTo(
        size.width * 0.7384789,
        size.height * 0.9189560,
        size.width * 0.7442197,
        size.height * 0.9042390,
        size.width * 0.7513014,
        size.height * 0.9042390);
    path_0.cubicTo(
        size.width * 0.7583831,
        size.height * 0.9042390,
        size.width * 0.7641239,
        size.height * 0.9189560,
        size.width * 0.7641239,
        size.height * 0.9371069);
    path_0.lineTo(size.width * 0.7743803, size.height * 0.9371069);
    path_0.cubicTo(
        size.width * 0.7743803,
        size.height * 0.9189560,
        size.width * 0.7801211,
        size.height * 0.9042390,
        size.width * 0.7872028,
        size.height * 0.9042390);
    path_0.cubicTo(
        size.width * 0.7942817,
        size.height * 0.9042390,
        size.width * 0.8000225,
        size.height * 0.9189560,
        size.width * 0.8000225,
        size.height * 0.9371069);
    path_0.lineTo(size.width * 0.8102817, size.height * 0.9371069);
    path_0.cubicTo(
        size.width * 0.8102817,
        size.height * 0.9189560,
        size.width * 0.8160197,
        size.height * 0.9042390,
        size.width * 0.8231014,
        size.height * 0.9042390);
    path_0.cubicTo(
        size.width * 0.8301831,
        size.height * 0.9042390,
        size.width * 0.8359239,
        size.height * 0.9189560,
        size.width * 0.8359239,
        size.height * 0.9371069);
    path_0.lineTo(size.width * 0.8461803, size.height * 0.9371069);
    path_0.cubicTo(
        size.width * 0.8461803,
        size.height * 0.9189560,
        size.width * 0.8519211,
        size.height * 0.9042390,
        size.width * 0.8590028,
        size.height * 0.9042390);
    path_0.cubicTo(
        size.width * 0.8660817,
        size.height * 0.9042390,
        size.width * 0.8718225,
        size.height * 0.9189560,
        size.width * 0.8718225,
        size.height * 0.9371069);
    path_0.lineTo(size.width * 0.8820817, size.height * 0.9371069);
    path_0.cubicTo(
        size.width * 0.8820817,
        size.height * 0.9189560,
        size.width * 0.8878197,
        size.height * 0.9042390,
        size.width * 0.8949014,
        size.height * 0.9042390);
    path_0.cubicTo(
        size.width * 0.9019831,
        size.height * 0.9042390,
        size.width * 0.9077239,
        size.height * 0.9189560,
        size.width * 0.9077239,
        size.height * 0.9371069);
    path_0.lineTo(size.width * 0.9179803, size.height * 0.9371069);
    path_0.cubicTo(
        size.width * 0.9179803,
        size.height * 0.9189560,
        size.width * 0.9237211,
        size.height * 0.9042390,
        size.width * 0.9308028,
        size.height * 0.9042390);
    path_0.cubicTo(
        size.width * 0.9378845,
        size.height * 0.9042390,
        size.width * 0.9436225,
        size.height * 0.9189560,
        size.width * 0.9436225,
        size.height * 0.9371069);
    path_0.lineTo(size.width * 0.9436620, size.height * 0.9371069);
    path_0.cubicTo(
        size.width * 0.9592197,
        size.height * 0.9371069,
        size.width * 0.9718310,
        size.height * 0.9089497,
        size.width * 0.9718310,
        size.height * 0.8742138);
    path_0.lineTo(size.width * 0.9718310, size.height * 0.08805031);
    path_0.cubicTo(
        size.width * 0.9718310,
        size.height * 0.07415660,
        size.width * 0.9667859,
        size.height * 0.06289308,
        size.width * 0.9605634,
        size.height * 0.06289308);
    path_0.lineTo(size.width * 0.03943662, size.height * 0.06289308);
    path_0.close();

    final Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
