import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/colors.dart';

class ItemSelectorList extends StatelessWidget {
  const ItemSelectorList(
      {Key? key, required this.currentIndex, required this.index})
      : super(key: key);

  final int currentIndex;
  final int index;

  @override
  Widget build(BuildContext context) {
    if (currentIndex == index) {
      return Container(
        height: 55,
        decoration: BoxDecoration(
            color: itemListActive, borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            SvgPicture.asset(
              "assets/images/mandi_bhao.svg",
              color: white,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                "Mandi",
                style: TextStyle(
                    fontSize: 12, fontFamily: "Poppins", color: Colors.white),
              ),
            )
          ],
        ),
      );
    } else {
      return Container(
        height: 55,
        decoration: BoxDecoration(
            color: itemListInActive, borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/mandi_bhao.svg",
              color: blackGrey,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                "Mandi",
                style: TextStyle(
                    fontSize: 10, fontFamily: "Poppins", color: blackGrey),
              ),
            )
          ],
        ),
      );
    }
  }
}

// class AllListBuyCard extends StatelessWidget {
//   const AllListBuyCard({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     bool activeBookmark = false;
//     return StatefulBuilder(
//       builder: (BuildContext context, void Function(void Function()) setState) {
//         return InkWell(
//           onTap: () {
//             context.router.push( BuyDetailRoute());
//           },
//           child: Container(
//             width: double.maxFinite,
//             height: 182,
//             padding: const EdgeInsets.all(10),
//             margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(
//                     color: const Color.fromRGBO(133, 133, 133, 0.11))),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   width: MediaQuery.of(context).size.width / 2.7,
//                   height: 165,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       image: const DecorationImage(
//                           image: NetworkImage(
//                               "https://image.made-in-china.com/202f0j00ECMakcvRrwqm/Tomota-Extrct-Lycopene-5-95-HPLC-.jpg"),
//                           fit: BoxFit.fill)),
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 10.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             SizedBox(
//                               height: 20,
//                               child: Row(
//                                 children: [
//                                   const Spacer(),
//                                   // GestureDetector(
//                                   //     onTap: () {
//                                   //       setState(() {
//                                   //         activeBookmark = !activeBookmark;
//                                   //       });
//                                   //     },
//                                   //     child: activeBookmark
//                                   //         ? const Icon(
//                                   //             Icons.bookmark_rounded,
//                                   //             color: itemListActive,
//                                   //           )
//                                   //         : const Icon(
//                                   //             Icons.bookmark_outline_rounded,
//                                   //             color: itemListActive,
//                                   //           )),
//                                 ],
//                               ),
//                             ),
//                             const Text(
//                               "Vegetable",
//                               style: TextStyle(
//                                   fontSize: 11,
//                                   fontFamily: "Poppins",
//                                   color: Color(0xff5F5F5F),
//                                   fontWeight: FontWeight.w500),
//                             ),
//                             const Text(
//                               "Tomatoes",
//                               style: TextStyle(
//                                   fontSize: 20,
//                                   fontFamily: "Poppins",
//                                   color: Color(0xff563E1F),
//                                   fontWeight: FontWeight.w600),
//                             ),
//                             RichText(
//                               text: const TextSpan(
//                                 text: '₹ 250 ',
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     fontFamily: "Poppins",
//                                     color: Color(0xffE26B26),
//                                     fontWeight: FontWeight.w600),
//                                 children: <TextSpan>[
//                                   TextSpan(
//                                     text: '/kg',
//                                     style: TextStyle(
//                                         fontSize: 15,
//                                         fontFamily: "Poppins",
//                                         color: Color(0xffE26B26),
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: const [
//                                     Icon(
//                                       Icons.location_on_outlined,
//                                       color: Color(0xffCE9141),
//                                       size: 20.0,
//                                     ),
//                                     SizedBox(
//                                       width: 2,
//                                     ),
//                                     Text(
//                                       '2km',
//                                       style: TextStyle(
//                                           fontSize: 11,
//                                           fontFamily: "Poppins",
//                                           color: Color(0xffCE9141),
//                                           fontWeight: FontWeight.w600),
//                                     )
//                                   ],
//                                 ),
//                                 Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: const [
//                                     Icon(
//                                       Icons.star,
//                                       color: Color(0xffEEAC03),
//                                       size: 14.0,
//                                     ),
//                                     SizedBox(
//                                       width: 2,
//                                     ),
//                                     Text(
//                                       '3.9',
//                                       style: TextStyle(
//                                           fontSize: 11,
//                                           fontFamily: "Poppins",
//                                           color: Color(0xff563E1F),
//                                           fontWeight: FontWeight.w500),
//                                     )
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 5,
//                             ),
//                             Row(
//                               children: const [
//                                 Icon(
//                                   Icons.person_outline,
//                                   color: Color(0xff606060),
//                                   size: 18.0,
//                                 ),
//                                 SizedBox(
//                                   width: 2,
//                                 ),
//                                 Text(
//                                   'Seller - Ram Prasad Sharma ',
//                                   style: TextStyle(
//                                       fontSize: 11,
//                                       fontFamily: "Poppins",
//                                       color: Color(0xff606060),
//                                       fontWeight: FontWeight.w500),
//                                 )
//                               ],
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class AllListRentCard extends StatelessWidget {
//   const AllListRentCard({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     bool activeBookmark = false;
//     return StatefulBuilder(
//       builder: (BuildContext context, void Function(void Function()) setState) {
//         return InkWell(
//           onTap: () {
//             context.router.push(const RentDetailRoute());
//           },
//           child: Container(
//             width: double.maxFinite,
//             height: 182,
//             padding: const EdgeInsets.all(10),
//             margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(
//                     color: const Color.fromRGBO(133, 133, 133, 0.11))),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Stack(
//                   children: [
//                     Container(
//                       width: MediaQuery.of(context).size.width / 2.7,
//                       height: 165,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           image: const DecorationImage(
//                               image: NetworkImage(
//                                   "https://images.unsplash.com/photo-1614977645540-7abd88ba8e56?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dHJhY3RvcnxlbnwwfHwwfHw%3D&w=1000&q=80"),
//                               fit: BoxFit.fill)),
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(5),
//                           color: const Color(0xffFFF6E9)),
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 12, vertical: 2),
//                       margin: const EdgeInsets.all(10),
//                       child: const Text(
//                         "Rent",
//                         style: TextStyle(
//                             fontSize: 9.5,
//                             fontFamily: "Poppins",
//                             color: Color(0xffE26B26),
//                             fontWeight: FontWeight.w500),
//                       ),
//                     )
//                   ],
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 10.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             SizedBox(
//                               height: 20,
//                               child: Row(
//                                 children: [
//                                   const Spacer(),
//                                   // GestureDetector(
//                                   //     onTap: () {
//                                   //       setState(() {
//                                   //         activeBookmark = !activeBookmark;
//                                   //       });
//                                   //     },
//                                   //     child: activeBookmark
//                                   //         ? const Icon(
//                                   //             Icons.bookmark_rounded,
//                                   //             color: itemListActive,
//                                   //           )
//                                   //         : const Icon(
//                                   //             Icons.bookmark_outline_rounded,
//                                   //             color: itemListActive,
//                                   //           )),
//                                 ],
//                               ),
//                             ),
//                             const Text(
//                               "Equipment",
//                               style: TextStyle(
//                                   fontSize: 11,
//                                   fontFamily: "Poppins",
//                                   color: Color(0xff5F5F5F),
//                                   fontWeight: FontWeight.w500),
//                             ),
//                             const Text(
//                               "Rotavator",
//                               style: TextStyle(
//                                   fontSize: 20,
//                                   fontFamily: "Poppins",
//                                   color: Color(0xff563E1F),
//                                   fontWeight: FontWeight.w600),
//                             ),
//                             RichText(
//                               text: const TextSpan(
//                                 text: '₹ 2500 ',
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     fontFamily: "Poppins",
//                                     color: Color(0xffE26B26),
//                                     fontWeight: FontWeight.w600),
//                                 children: <TextSpan>[
//                                   TextSpan(
//                                     text: '/day',
//                                     style: TextStyle(
//                                         fontSize: 15,
//                                         fontFamily: "Poppins",
//                                         color: Color(0xffE26B26),
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: const [
//                                     Icon(
//                                       Icons.location_on_outlined,
//                                       color: Color(0xffCE9141),
//                                       size: 20.0,
//                                     ),
//                                     SizedBox(
//                                       width: 2,
//                                     ),
//                                     Text(
//                                       '2km',
//                                       style: TextStyle(
//                                           fontSize: 11,
//                                           fontFamily: "Poppins",
//                                           color: Color(0xffCE9141),
//                                           fontWeight: FontWeight.w600),
//                                     )
//                                   ],
//                                 ),
//                                 Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: const [
//                                     Icon(
//                                       Icons.star,
//                                       color: Color(0xffEEAC03),
//                                       size: 14.0,
//                                     ),
//                                     SizedBox(
//                                       width: 2,
//                                     ),
//                                     Text(
//                                       '3.9',
//                                       style: TextStyle(
//                                           fontSize: 11,
//                                           fontFamily: "Poppins",
//                                           color: Color(0xff563E1F),
//                                           fontWeight: FontWeight.w500),
//                                     )
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 5,
//                             ),
//                             Row(
//                               children: const [
//                                 Icon(
//                                   Icons.person_outline,
//                                   color: Color(0xff606060),
//                                   size: 18.0,
//                                 ),
//                                 SizedBox(
//                                   width: 2,
//                                 ),
//                                 Text(
//                                   'Owner - Ram Prasad Sharma ',
//                                   style: TextStyle(
//                                       fontSize: 11,
//                                       fontFamily: "Poppins",
//                                       color: Color(0xff606060),
//                                       fontWeight: FontWeight.w500),
//                                 )
//                               ],
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

class RateCard extends StatelessWidget {
  const RateCard(
      {Key? key,
      required this.image,
      required this.name,
      required this.highest,
      required this.lowest})
      : super(key: key);

  final String image;
  final String name;
  final String highest;
  final String lowest;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: 125.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color.fromRGBO(133, 133, 133, 0.11)),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.h),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 102.h,
                  width: 114.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                          image: NetworkImage(image), fit: BoxFit.fill)),
                ),
                Positioned(
                    bottom: -10,
                    right: 10,
                    left: 10,
                    child: Container(
                      width: 115.w,
                      height: 25.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white),
                        gradient: LinearGradient(
                          colors: [Colors.red.shade200, Colors.red.shade300],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: const [0.3, 0.9],
                          tileMode: TileMode.repeated,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          name,
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontFamily: "Poppins",
                              color: const Color(0xff563F1F),
                              fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )),
              ],
            ),
            30.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Highest',
                        style: TextStyle(
                            fontSize: 9.sp,
                            fontFamily: "Poppins",
                            color: const Color(0xff563F1F),
                            fontWeight: FontWeight.w500)),
                    Text(
                      highest,
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontFamily: "Poppins",
                          color: const Color(0xffE36E26),
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Lowest',
                        style: TextStyle(
                            fontSize: 9.sp,
                            fontFamily: "Poppins",
                            color: const Color(0xff563F1F),
                            fontWeight: FontWeight.w500)),
                    Text(
                      lowest,
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontFamily: "Poppins",
                          color: const Color(0xff18967D),
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BuyCard extends StatelessWidget {
  const BuyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool activeBookmark = false;
    return StatefulBuilder(builder:
        (BuildContext context, void Function(void Function()) setState) {
      return GestureDetector(
        onTap: () {
          // context.router.push(const BuyDetailRoute());
        },
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border:
                  Border.all(color: const Color.fromRGBO(133, 133, 133, 0.11)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1437252611977-07f74518abd7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8d2hlYXR8ZW58MHx8MHx8&w=1000&q=80"),
                              fit: BoxFit.fill)),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Grain",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: "Poppins",
                                      color: Color(0xff858484),
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "Wheat",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: "Poppins",
                                      color: Color(0xff563E1F),
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    activeBookmark = !activeBookmark;
                                  });
                                },
                                child: activeBookmark
                                    ? const Icon(
                                        Icons.bookmark_rounded,
                                        color: itemListActive,
                                      )
                                    : const Icon(
                                        Icons.bookmark_outline_rounded,
                                        color: itemListActive,
                                      )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: Color(0xffCE9141),
                                  size: 20.0,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  '2km',
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontFamily: "Poppins",
                                      color: Color(0xffCE9141),
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            RichText(
                              text: const TextSpan(
                                text: '₹ 250 ',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Poppins",
                                    color: Color(0xffE26B26),
                                    fontWeight: FontWeight.w600),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '/kg',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontFamily: "Poppins",
                                        color: Color(0xffE26B26),
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )),
      );
    });
  }
}

class RentCard extends StatelessWidget {
  const RentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool activeBookmark = false;
    return StatefulBuilder(builder:
        (BuildContext context, void Function(void Function()) setState) {
      return GestureDetector(
        onTap: () {
          // context.router.push(const RentDetailRoute());
        },
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border:
                  Border.all(color: const Color.fromRGBO(133, 133, 133, 0.11)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://cdn.pixabay.com/photo/2014/06/18/13/56/tractor-371250_960_720.jpg"),
                              fit: BoxFit.fill)),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Equipment",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: "Poppins",
                                      color: Color(0xff858484),
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "Planter",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: "Poppins",
                                      color: Color(0xff563E1F),
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    activeBookmark = !activeBookmark;
                                  });
                                },
                                child: activeBookmark
                                    ? const Icon(
                                        Icons.bookmark_rounded,
                                        color: itemListActive,
                                      )
                                    : const Icon(
                                        Icons.bookmark_outline_rounded,
                                        color: itemListActive,
                                      )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: Color(0xffCE9141),
                                  size: 20.0,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  '24km',
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontFamily: "Poppins",
                                      color: Color(0xffCE9141),
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            RichText(
                              text: const TextSpan(
                                text: '₹ 2500 ',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Poppins",
                                    color: Color(0xffE26B26),
                                    fontWeight: FontWeight.w600),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '/day',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontFamily: "Poppins",
                                        color: Color(0xffE26B26),
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )),
      );
    });
  }
}

class DetailSelectionTab extends StatefulWidget {
  const DetailSelectionTab({Key? key}) : super(key: key);

  @override
  State<DetailSelectionTab> createState() => _DetailSelectionTabState();
}

class _DetailSelectionTabState extends State<DetailSelectionTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
              color: const Color(0xffFFEDD3),
              borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SvgPicture.asset(
            "assets/images/mandi_bhao.svg",
            color: const Color(0xffFAA326),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 3),
          child: Text(
            'Security',
            style: TextStyle(
                fontSize: 12,
                fontFamily: "Poppins",
                color: Color(0xff563E1F),
                fontWeight: FontWeight.w600),
          ),
        ),
        const Text(
          'Yes',
          style: TextStyle(
              fontSize: 12,
              fontFamily: "Poppins",
              color: Color.fromRGBO(86, 62, 31, 0.48),
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
