// import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kisaan_station/src/model/station/seller_historyist_model.dart';
import 'package:kisaan_station/src/util/utlis.dart';
import 'package:kisaan_station/src/view/home/widget/SellerListing_pages.dart';

import '../../../../global_providers.dart';
import '../../../constants/page_padding.dart';
import '../../widget/snackbar.dart';

@RoutePage()
class SellerHistoryOrderDetailsPage extends ConsumerStatefulWidget {
  const SellerHistoryOrderDetailsPage({required this.orderId, super.key});
  final String orderId;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SellerHistoryOrderDetailsState();
}

class _SellerHistoryOrderDetailsState
    extends ConsumerState<SellerHistoryOrderDetailsPage> {
  SellerHistoryistModel? sellerHistoryistModel;
  final remainingtextController = TextEditingController();
  @override
  void initState() {
    super.initState();

    _getData();
  }

  Future<void> _getData() async {
    final val = await ref.read(droneServiceRepoProvider).getSellerStatus();
    try {
      sellerHistoryistModel = await ref
          .read(droneServiceRepoProvider)
          .getOrderDetails(buyId: widget.orderId);
      setState(() {});
      print("debug coming");
    } on Exception {
      // TODO
    }
  }

  Future<bool> showDialogIfFirstLoaded(BuildContext context) async {
    final res = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0)), //this right here
          child: SizedBox(
            height: 279.h,
            // width: 335,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: SizedBox(
                      child: Row(
                        children: [
                          Text(
                            "Payment Remaining:",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: const Color(0xff1a1a1a),
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          8.horizontalSpace,
                          Text(
                            "₹${sellerHistoryistModel?.remainingPayment}",
                            style: TextStyle(
                                color: const Color(0xffe48912),
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                    ),
                  ),
                  30.verticalSpace,
                  Text(
                    "Enter Received Amount",
                    style: TextStyle(
                        color: const Color(0xff8e8e8e),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter recieve ammount';
                      } else {
                        return null;
                      }
                    },
                    controller: remainingtextController,
                    keyboardType: TextInputType.number,
                  ),
                  25.verticalSpace,
                  Center(
                    child: InkWell(
                      onTap: () async {
                        if (int.parse(remainingtextController.text) >
                            int.parse(sellerHistoryistModel?.remainingPayment
                                    .toString() ??
                                "0")) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              getSnackBar("Enter amount less than remaining"));
                        } else {
                          final response = await showDialogIfPay(context);
                          if (response) {}
                        }
                        // final lat = ref.watch(latLongProvider).coordinates[0];
                        // final long = ref.watch(latLongProvider).coordinates[1];
                        // final _farmList = OcLocation(
                        //     address: _locationController.text,
                        //     latitude: long.toString(),
                        //     longitude: lat.toString());
                        // _farmDetailList.add(FarmDetailOrder(
                        //   farmName:
                        //       widget.sellerOrderlistModel.farmDetails.first.farmName,
                        //   area: double.parse(farmEditingController1.text),
                        //   areaUnit: _farmUnitTextEditingController.text,
                        // ));
                        // if (_pickedImages.isNotEmpty &&
                        //     _locationController.text.isNotEmpty &&
                        //     _dronenumbercontroller.text.isNotEmpty) {
                        //   final response = await showDialogIfFirstLoaded(context);
                        //   if (response) {
                        //     await ref
                        //         .read(stationSellRepoProvider)
                        //         .sellerOrderdelivered(
                        //           orderDeliverdModel: OrderDeliverdModel(
                        //             id: widget.sellerOrderlistModel.id,
                        //             estimatedPrice: estimatedPrice.toString(),
                        //             paymentReceived: farmEditingController2.text,
                        //             remainingPayment: totalremaining.toString(),
                        //             OCLocation: jsonEncode(_farmList),
                        //             remarks: notesEditingController2.text,
                        //             equipmentNo: _dronenumbercontroller.text,
                        //             addFarmDetails: jsonEncode(_farmDetailList),
                        //           ),
                        //           images: _pickedImages,
                        //         );

                        //     context.router.push(OrderSubmitRoute(
                        //         sellerOrderlistModel: widget.sellerOrderlistModel));

                        //     ref.refresh(sellerOrderListProvider(userId));
                        //     final _myListingController = ref.watch(
                        //         sellerOrderListProvider(UserPreferences.userId));
                        //     _myListingController.refresh(context);
                        //   } else {}
                        // } else {
                        //   ScaffoldMessenger.of(context).showSnackBar(getSnackBar(
                        //       "Please provide details in mandatory field"));
                        // }
                      },
                      child: Container(
                        height: 48,
                        width: 285,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(34.0),
                          gradient: const LinearGradient(
                              colors: [Color(0xfff39a00), Color(0xffe26b26)]),
                        ),
                        child: Center(
                          child: Text(
                            "Confirm payment",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: const Color(0xffffffff),
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
    return res ?? false;
  }

  Future<bool> showDialogIfPay(BuildContext context) async {
    final res = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0)), //this right here
          child: SizedBox(
            height: 285.h,
            // width: 335,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Center(
                      child: Text(
                        "Confirm Payment",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: const Color(0xff1a1a1a),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                  12.verticalSpace,
                  Text(
                    "Are you sure you have received the complete payment? You can not edit the details onceits is uploaded",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: const Color(0xff8c8c8c),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  22.verticalSpace,
                  Center(
                    child: SizedBox(
                      height: 41,
                      width: 241,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffe26b26),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            // background
                          ),
                          onPressed: () async {
                            await ref
                                .read(stationSellRepoProvider)
                                .remainingpaymentUpdate(
                                    buyId: widget.orderId,
                                    paymentReceived: double.parse(
                                        remainingtextController.text));
                            await Utils.farmAddedMessage(
                                "you payment updated successfully", context);
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.pop(context);
                            ref.refresh(sellerOrderListProvider(userId));

                            final _myListingController =
                                ref.watch(sellerOrderListProvider(userId));
                            _myListingController.refresh(context);
                          },
                          child: const Text('Confirm',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500))),
                    ),
                  ),
                  10.verticalSpace,
                  Center(
                    child: SizedBox(
                      height: 41,
                      width: 241,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffdddddd),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            // background
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff606060),
                                  fontWeight: FontWeight.w500))),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
    return res ?? false;
  }

  @override
  void dispose() {
    remainingtextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 18,
              color: Color(0xff585858),
            )),
        centerTitle: false,
        title: Text(
          "Order: ${sellerHistoryistModel?.bookingId}",
          style: TextStyle(
            fontSize: 20.sp,
            color: const Color(0xff563e1f),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            8.verticalSpace,
            if (sellerHistoryistModel?.remainingPayment != 0)
              Container(
                  height: 90.h,
                  width: 336.w,
                  decoration: BoxDecoration(
                    color: const Color(0xfffff1de),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // mainAxisAlignment: MainAxisAlignment.,
                      children: [
                        SvgPicture.asset(
                          'assets/images/drone-details.svg',
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                "Payment Remaining:",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: const Color(0xff1a1a1a),
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            // 8.horizontalSpace,
                            Text(
                              "₹${sellerHistoryistModel?.remainingPayment}",
                              style: TextStyle(
                                  color: const Color(0xffe48912),
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),

                        // 120.horizontalSpace,
                      ],
                    ),
                  )),
            15.verticalSpace,
            if (sellerHistoryistModel?.remainingPayment != 0)
              Center(
                child: SizedBox(
                  height: 42.h,
                  width: 305.w,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffe26b26),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        // background
                      ),
                      onPressed: () async {
                        final response = await showDialogIfFirstLoaded(context);
                        if (response) {}
                      },
                      child: const Text('Update Payment',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600))),
                ),
              ),
            25.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order Details",
                  style: TextStyle(
                      color: const Color(0xff200e32),
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "View Less",
                  style: TextStyle(
                      color: const Color(0xff777777),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            12.verticalSpace,
            Text(
              "Delivery Address:",
              style: TextStyle(
                  color: const Color(0xff969696),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500),
            ),
            5.verticalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: SvgPicture.asset(
                          'assets/images/Loc-1.svg',
                          height: 15,
                        ),
                      ),
                      8.horizontalSpace,
                      SizedBox(
                        // height: 63,
                        width: 330.h,
                        child: Text(
                          "${sellerHistoryistModel?.addFarmLocation.address}",
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: const Color(0xff563e1f),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 6.0),
                //   child: SizedBox(
                //     child: Row(
                //       // crossAxisAlignment: CrossAxisAlignment.start,
                //       // mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         SvgPicture.asset(
                //           'assets/images/Get-d.svg',
                //           height: 17,
                //         ),
                //         10.horizontalSpace,
                //         Text(
                //           'Get Directions',
                //           style: TextStyle(
                //               color: const Color(0xffe26b26),
                //               fontSize: 12.sp,
                //               fontWeight: FontWeight.w600),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
            5.verticalSpace,
            const Divider(
              color: Color(0xffdfdfdf),
              thickness: 1,
            ),
            5.verticalSpace,
            CardText(
                text: "Delivery Date & Time: ",
                otherText: "${sellerHistoryistModel?.updatedAt.toLocal()}."),
            5.verticalSpace,
            const Divider(
              color: Color(0xffdfdfdf),
              thickness: 1,
            ),
            CardText(
              text:
                  "Farm Details (0${sellerHistoryistModel?.addFarmDetails.length}):",
              otherText:
                  "${sellerHistoryistModel?.addFarmDetails.first.farmName} - ${sellerHistoryistModel?.addFarmDetails.first.area} Acre  ",
            ),
            3.verticalSpace,
            const Divider(
              color: Color(0xffdfdfdf),
              thickness: 1,
            ),
            CardText(
                text: "Crop Type:",
                otherText: "${sellerHistoryistModel?.cropType}"),
            5.verticalSpace,
            const Divider(
              color: Color(0xffdfdfdf),
              thickness: 1,
            ),
            CardText(
                text: "Spray Product:",
                otherText: "${sellerHistoryistModel?.sparyProduct}|"),
            5.verticalSpace,
            const Divider(
              color: Color(0xffdfdfdf),
              thickness: 1,
            ),
            5.verticalSpace,
            Text(
              "Total Order amount",
              style: TextStyle(
                  color: const Color(0xff969696),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500),
            ),
            Row(
              children: [
                Text(
                  "₹${sellerHistoryistModel?.estimatedPrice}",
                  style: TextStyle(
                      color: const Color(0xff563e1f),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700),
                ),
                5.horizontalSpace,
                // Container(
                //   height: 20,
                //   width: 46,
                //   decoration: BoxDecoration(
                //     color: const Color(0xff3a974c).withOpacity(0.2),
                //     borderRadius: BorderRadius.circular(40),
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.only(
                //         left: 12, top: 1, right: 6, bottom: 4),
                //     child: Text(
                //       "Paid",
                //       style: TextStyle(
                //           color: const Color(0xff3a974c),
                //           fontSize: 12.sp,
                //           fontWeight: FontWeight.w400),
                //     ),
                //   ),
                // )
              ],
            ),
            3.verticalSpace,
            const Divider(
              color: Color(0xffdfdfdf),
              thickness: 1,
            ),
            CardText(
                text: "Received amount",
                otherText: "₹${sellerHistoryistModel?.paymentReceived}")
          ],
        ),
      )),
    );
  }
}

class CardText extends StatelessWidget {
  final String text;
  final String otherText;
  const CardText({required this.text, required this.otherText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
              color: const Color(0xff969696),
              fontSize: 14.sp,
              fontWeight: FontWeight.w500),
        ),
        8.horizontalSpace,
        Text(
          otherText,
          style: TextStyle(
              color: const Color(0xff563e1f),
              fontSize: 14.sp,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:kisaan_station/src/constants/page_padding.dart';

// import '../../../model/station/seller_historyist_model.dart';

// class SellerHistoryOrderDetails extends ConsumerWidget {
//   const SellerHistoryOrderDetails(
//       {required this.orderId, super.key});

//   final String orderId;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       // resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         leading: IconButton(
//             onPressed: () => Navigator.pop(context),
//             icon: const Icon(
//               Icons.arrow_back_ios_new,
//               size: 18,
//               color: Color(0xff585858),
//             )),

//         // centerTitle: true,
//         title: Text(
//           "Order: ${sellerHistoryistModel.bookingId}",
//           style: TextStyle(
//             fontSize: 20.sp,
//             color: const Color(0xff563e1f),
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//           child: Padding(
//         padding: pagePadding,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             8.verticalSpace,

//             Container(
//                 height: 76,
//                 // width: 350,
//                 decoration: BoxDecoration(
//                   color: const Color(0xfff8f8f8),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       SizedBox(
//                         height: 80,
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           // mainAxisAlignment: MainAxisAlignment.,
//                           children: [
//                             // SizedBox(
//                             //   height: 80,
//                             //   // width: 60,
//                             //   child: IconButton(
//                             //       onPressed: () {
//                             //         context.router.push(const ProfileRoute());
//                             //       },
//                             //       icon:
//                             //           sellerHistoryistModel.buyerProfileImage ==
//                             //                   null
//                             //               ? ProfilePicWidget(
//                             //                   url: sellerOrderlistModel
//                             //                       .buyerProfileImage,
//                             //                   size: 70.h,
//                             //                   fizedSize: true,
//                             //                 )
//                             //               : const CircleAvatar()),
//                             // ),

//                             5.horizontalSpace,
//                             SizedBox(
//                               height: 70,
//                               // width: 120,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                    sellerHistoryistModel.cropType,
//                                     textAlign: TextAlign.start,
//                                     style: TextStyle(
//                                         color: const Color(0xff341d10),
//                                         fontSize: 16.sp,
//                                         fontWeight: FontWeight.w600),
//                                   ),
//                                   Text(
//                                     "#",
//                                     style: TextStyle(
//                                         color: const Color(0xff848484),
//                                         fontSize: 14.sp,
//                                         fontWeight: FontWeight.w400),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             // 120.horizontalSpace,
//                           ],
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           // context.router.push(const ProfileRoute());
//                         },
//                         icon: SvgPicture.asset(
//                           'assets/images/Order-call.svg',
//                           height: 80,
//                         ),
//                       ),
//                     ],
//                   ),
//                 )),
//             8.verticalSpace,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SizedBox(
//                   child: Row(
//                     children: [
//                       SvgPicture.asset(
//                         'assets/images/drone-details.svg',
//                       ),
//                       5.horizontalSpace,
//                       // Container(
//                       //   height: 20,
//                       //   width: 46,
//                       //   decoration: BoxDecoration(
//                       //     color: const Color(0xff3a974c).withOpacity(0.2),
//                       //     borderRadius: BorderRadius.circular(40),
//                       //   ),
//                       //   child: Padding(
//                       //     padding: const EdgeInsets.only(
//                       //         left: 12, top: 1, right: 6, bottom: 4),
//                       //     child: Text(
//                       //       "Paid",
//                       //       style: TextStyle(
//                       //           color: const Color(0xff3a974c),
//                       //           fontSize: 12.sp,
//                       //           fontWeight: FontWeight.w400),
//                       //     ),
//                       //   ),
//                       // ),
//                     ],
//                   ),
//                 ),
//                 Text(
//                   "₹${sellerHistoryistModel.estimatedPrice}",
//                   style: TextStyle(
//                       color: const Color(0xffe48912),
//                       fontSize: 18.sp,
//                       fontWeight: FontWeight.w700),
//                 ),
//               ],
//             ),
//             15.verticalSpace,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Order Details",
//                   style: TextStyle(
//                       color: const Color(0xff200e32),
//                       fontSize: 17.sp,
//                       fontWeight: FontWeight.w600),
//                 ),
//                 Text(
//                   "View Less",
//                   style: TextStyle(
//                       color: const Color(0xff777777),
//                       fontSize: 15.sp,
//                       fontWeight: FontWeight.w600),
//                 ),
//               ],
//             ),

//             12.verticalSpace,
//             Text(
//               "Delivery Address:",
//               style: TextStyle(
//                   color: const Color(0xff969696),
//                   fontSize: 14.sp,
//                   fontWeight: FontWeight.w500),
//             ),
//             8.verticalSpace,
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SizedBox(
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(top: 6.0),
//                         child: SvgPicture.asset(
//                           'assets/images/Loc-1.svg',
//                           height: 17,
//                         ),
//                       ),
//                       8.horizontalSpace,
//                       SizedBox(
//                         // height: 63,
//                         width: 130,
//                         child: Text(
//                          sellerHistoryistModel.addFarmLocation.address,
//                           style: TextStyle(
//                               color: const Color(0xff563e1f),
//                               fontSize: 14.sp,
//                               fontWeight: FontWeight.w500),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 // Padding(
//                 //   padding: const EdgeInsets.only(top: 6.0),
//                 //   child: SizedBox(
//                 //     child: Row(
//                 //       // crossAxisAlignment: CrossAxisAlignment.start,
//                 //       // mainAxisAlignment: MainAxisAlignment.center,
//                 //       children: [
//                 //         SvgPicture.asset(
//                 //           'assets/images/Get-d.svg',
//                 //           height: 17,
//                 //         ),
//                 //         10.horizontalSpace,
//                 //         Text(
//                 //           'Get Directions',
//                 //           style: TextStyle(
//                 //               color: const Color(0xffe26b26),
//                 //               fontSize: 12.sp,
//                 //               fontWeight: FontWeight.w600),
//                 //         ),
//                 //       ],
//                 //     ),
//                 //   ),
//                 // ),
//               ],
//             ),
//             5.verticalSpace,
//             const Divider(
//               color: Color(0xffdfdfdf),
//               thickness: 1,
//             ),
//             CardText(
//                 text: "Booking Date & Time:",
//                 otherText:
//                     "${sellerHistoryistModel.bookingId} | ${sellerHistoryistModel.bookingId}"),
//             5.verticalSpace,
//             const Divider(
//               color: Color(0xffdfdfdf),
//               thickness: 1,
//             ),
//             CardText(
//                 text:
//                     "Farm Details (0${sellerHistoryistModel.addFarmDetails.length}):",
//                 otherText:
//                     "${sellerHistoryistModel.addFarmDetails.map((e) => e.area).fold(0.0, (previousValue, element) => previousValue + element)}Acre"),
//             5.verticalSpace,
//             const Divider(
//               color: Color(0xffdfdfdf),
//               thickness: 1,
//             ),
//             CardText(
//                 text: "Crop Type:", otherText: sellerHistoryistModel.cropType),
//             5.verticalSpace,
//             const Divider(
//               color: Color(0xffdfdfdf),
//               thickness: 1,
//             ),
//             CardText(
//                 text: "Spray Product:",
//                 otherText: "${sellerHistoryistModel.sparyProduct} |"),
//             5.verticalSpace,
//             const Divider(
//               color: Color(0xffdfdfdf),
//               thickness: 1,
//             ),
//             5.verticalSpace,
//             Text(
//               "Order amount",
//               style: TextStyle(
//                   color: const Color(0xff969696),
//                   fontSize: 14.sp,
//                   fontWeight: FontWeight.w500),
//             ),
//             Row(
//               children: [
//                 Text(
//                   sellerHistoryistModel.estimatedPrice.toString(),
//                   style: TextStyle(
//                       color: const Color(0xff563e1f),
//                       fontSize: 16.sp,
//                       fontWeight: FontWeight.w700),
//                 ),
//                 5.horizontalSpace,
//                 // Container(
//                 //   height: 20,
//                 //   width: 46,
//                 //   decoration: BoxDecoration(
//                 //     color: const Color(0xff3a974c).withOpacity(0.2),
//                 //     borderRadius: BorderRadius.circular(40),
//                 //   ),
//                 //   child: Padding(
//                 //     padding: const EdgeInsets.only(
//                 //         left: 12, top: 1, right: 6, bottom: 4),
//                 //     child: Text(
//                 //       "Paid",
//                 //       style: TextStyle(
//                 //           color: const Color(0xff3a974c),
//                 //           fontSize: 12.sp,
//                 //           fontWeight: FontWeight.w400),
//                 //     ),
//                 //   ),
//                 // )
//               ],
//             ),
//             3.verticalSpace,
//             const Divider(
//               color: Color(0xffdfdfdf),
//               thickness: 1,
//             ),
//             10.verticalSpace,
//             Center(
//               child: SizedBox(
//                 height: 48,
//                 width: 308,
//                 child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xffe26b26),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(40.0),
//                       ),
//                       // background
//                     ),
//                     onPressed: () {
//                       // context.router.push(SellerOrderCompleteRoute(
//                       //     sellerOrderlistModel: sellerOrderlistModel));
//                     },
//                     child: const Text('Complete Order',
//                         style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.white,
//                             fontWeight: FontWeight.w500))),
//               ),
//             ),
//             // Row(
//             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //   crossAxisAlignment: CrossAxisAlignment.start,
//             //   children: [
//             //     SizedBox(
//             //       height: 42,
//             //       width: 104,
//             //       child: ElevatedButton(
//             //           style: ElevatedButton.styleFrom(
//             //             backgroundColor: const Color(0xffe8e8e8),
//             //             shape: RoundedRectangleBorder(
//             //               borderRadius: BorderRadius.circular(40.0),
//             //             ),
//             //             // background
//             //           ),
//             //           onPressed: () {},
//             //           child: const Text('Reject',
//             //               style: TextStyle(
//             //                   fontSize: 14,
//             //                   color: Color(0xff626262),
//             //                   fontWeight: FontWeight.w500))),
//             //     ),
//             //     SizedBox(
//             //       height: 42,
//             //       width: 207,
//             //       child: ElevatedButton(
//             //           style: ElevatedButton.styleFrom(
//             //             backgroundColor: const Color(0xff3a974c),
//             //             shape: RoundedRectangleBorder(
//             //               borderRadius: BorderRadius.circular(40.0),
//             //             ),
//             //             // background
//             //           ),
//             //           onPressed: () {
//             //             context.router.push(const SellerOrderCompleteRoute());
//             //           },
//             //           child: const Text('Accept Order',
//             //               style: TextStyle(
//             //                   fontSize: 14,
//             //                   color: Colors.white,
//             //                   fontWeight: FontWeight.w500))),
//             //     ),
//             //   ],
//             // ),
//           ],
//         ),
//       )),
//     );
//   }
// }

// class CardText extends StatelessWidget {
//   final String text;
//   final String otherText;
//   const CardText({required this.text, required this.otherText});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           text,
//           style: TextStyle(
//               color: const Color(0xff969696),
//               fontSize: 14.sp,
//               fontWeight: FontWeight.w500),
//         ),
//         8.horizontalSpace,
//         Text(
//           otherText,
//           style: TextStyle(
//               color: const Color(0xff563e1f),
//               fontSize: 14.sp,
//               fontWeight: FontWeight.w500),
//         ),
//       ],
//     );
//   }
// }


