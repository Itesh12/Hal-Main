import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/view/station/screens/services_page.dart';
import 'package:kisaan_station/src/view/widget/coming_soon.dart';

import '../../../constants/colors.dart';

@RoutePage()
class StationPage extends ConsumerStatefulWidget {
  const StationPage({Key? key}) : super(key: key);

  @override
  _StationPageState createState() => _StationPageState();
}

class _StationPageState extends ConsumerState<StationPage> {
  int currentIndex = 0;
  ScrollController bazaarScrollController = ScrollController();
  TextEditingController searchController = TextEditingController();

  final PageController _pageController = PageController();

  List<Widget> tabs() {
    final List<Widget> list = [
      Tab(
        icon: Container(
          height: 45,
          width: 190,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20)),
              color: Color(0xffF0F0F0)),
          child: Container(
            height: 45,
            width: 190,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: currentIndex == 0 ? primary : const Color(0xffF0F0F0)),
            child: Center(
              child: Text(
                "SERVICES",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12,
                    color: currentIndex == 0
                        ? Colors.white
                        : const Color(0xff636363),
                    fontWeight:
                        currentIndex == 0 ? FontWeight.w600 : FontWeight.w400,
                    fontFamily: 'Poppins'),
              ),
            ),
          ),
        ),
        iconMargin: EdgeInsets.only(left: 20.w),
        child: const SizedBox(),
      ),
      Tab(
          iconMargin: EdgeInsets.only(right: 20.w),
          icon: Container(
            height: 45,
            width: 190,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Color(0xffF0F0F0)),
            child: Container(
              height: 45,
              width: 190,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: currentIndex == 1 ? primary : const Color(0xffF0F0F0)),
              child: Center(
                child: Text(
                  "PRODUCTS",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12,
                      color: currentIndex == 1
                          ? Colors.white
                          : const Color(0xff636363),
                      fontWeight:
                          currentIndex == 1 ? FontWeight.w600 : FontWeight.w400,
                      fontFamily: 'Poppins'),
                ),
              ),
            ),
          ),
          child: const SizedBox()),
    ];
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs().length,
      child: NestedScrollView(
        controller: bazaarScrollController,
        physics: const NeverScrollableScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              snap: true,
              floating: true,
              toolbarHeight: 0,
              expandedHeight: 20.h,
              forceElevated: innerBoxIsScrolled,
              bottom: TabBar(
                enableFeedback: true,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                labelPadding: EdgeInsets.zero,
                tabs: tabs(),
                onTap: (val) {
                  currentIndex = val;
                  setState(() {});
                },
                // indicatorSize: TabBarIndicatorSize.tab,
                // indicator: const UnderlineTabIndicator(
                //   borderSide: BorderSide(color: Colors.red, width: 0),
                // )
              ),
            ),
          ];
        },
        body: const TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              // Builder(builder: (context) {
              //   return RefreshIndicator(
              //     onRefresh: () => Future.sync(
              //       () => null,
              //     ),
              //     child: CustomScrollView(
              //       slivers: [
              //         // SliverOverlapInjector(
              //         //   // This is the flip side of the SliverOverlapAbsorber
              //         //   // above.
              //         //   handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
              //         //       context),
              //         // ),
              //       ],
              //     ),
              //   );
              // }),
              MyStationServicesPage(),
              ComingSoon(),
            ]),
      ),
    );

    //   Padding(
    //   padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
    //   child: SingleChildScrollView(
    //     child: Column(
    //       children: [
    //         Row(
    //           children: const [
    //             Text('Your Station'),
    //             Spacer(),
    //             Text('Change Station'),
    //           ],
    //         ),
    //         const StationCard(),
    //         Row(
    //           children: [
    //             const SmallCard(
    //               icon: 'assets/images/call.svg',
    //               label: 'Ask Expert',
    //             ),
    //             28.horizontalSpace,
    //              const SmallCard(
    //               icon: 'assets/images/direction.svg',
    //               label: 'Kyc Verification',
    //             ),
    //           ],
    //         ),
    //         Row(
    //           children: const [
    //             MyStationBigCard(
    //               topColor: Color(0xffFDAD3B),
    //               bottomColor: Color(0xffFAA326),
    //               image: 'assets/images/rentEquipments.svg',
    //               label: 'Rent Equipements',
    //             ),
    //             MyStationBigCard(
    //               topColor: Color(0xffFDAD3B),
    //               bottomColor: Color(0xffFAA326),
    //               image: 'assets/images/bookTransportation.svg',
    //               label: 'Book Transportation',
    //             ),
    //           ],
    //         ),
    //         Row(
    //           children: const [
    //             MyStationBigCard(
    //               topColor: Color(0xffE87F43),
    //               bottomColor: Color(0xffE26B26),
    //               image: 'assets/images/buyAgriInput.svg',
    //               label: 'Buy Agri Input',
    //             ),
    //             MyStationBigCard(
    //               topColor: Color(0xffE87F43),
    //               bottomColor: Color(0xffE26B26),
    //               image: 'assets/images/bookStorage.svg',
    //               label: 'Book Storage',
    //             ),
    //           ],
    //         ),
    //         const Align(
    //             alignment: Alignment.topLeft, child: Text('   Crop Testing')),
    //         Row(
    //           children: const [
    //             MyStationBigCard(
    //               topColor: Color(0xff7D5A2D),
    //               bottomColor: Color(0xff563E1F),
    //               image: 'assets/images/bookDroneTesting.svg',
    //               label: 'Book Drone Testing',
    //             ),
    //             MyStationBigCard(
    //               topColor: Color(0xff7D5A2D),
    //               bottomColor: Color(0xff563E1F),
    //               image: 'assets/images/bookSpectral.svg',
    //               label: 'Book Spectral Test',
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }

  // Widget _menuBar(BuildContext context) {
  //   return Container(
  //     width: 300.0,
  //     height: 50.0,
  //     decoration: BoxDecoration(
  //       color: Color(0XFFE0E0E0),
  //       borderRadius: BorderRadius.all(Radius.circular(25.0)),
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       children: <Widget>[
  //         Expanded(
  //           child: InkWell(
  //             borderRadius: BorderRadius.all(Radius.circular(20)),
  //             onTap: _onPlaceBidButtonPress,
  //             child: Container(
  //               width: MediaQuery.of(context).size.width,
  //               padding: EdgeInsets.symmetric(vertical: 15),
  //               alignment: Alignment.center,
  //               decoration: (currentIndex == 0)
  //                   ? const BoxDecoration(
  //                       color: Colors.green,
  //                       borderRadius: BorderRadius.all(Radius.circular(20)),
  //                     )
  //                   : null,
  //               child: Text(
  //                 "Place Bid",
  //                 style: (currentIndex == 0)
  //                     ? TextStyle(color: Colors.white)
  //                     : TextStyle(color: Colors.black),
  //               ),
  //             ),
  //           ),
  //         ),
  //         Expanded(
  //           child: InkWell(
  //             borderRadius: BorderRadius.all(Radius.circular(20)),
  //             onTap: _onBuyNowButtonPress,
  //             child: Container(
  //               width: MediaQuery.of(context).size.width,
  //               padding: EdgeInsets.symmetric(vertical: 15),
  //               alignment: Alignment.center,
  //               decoration: (currentIndex == 1)
  //                   ? const BoxDecoration(
  //                       color: Colors.green,
  //                       borderRadius: BorderRadius.all(Radius.circular(20)),
  //                     )
  //                   : null,
  //               child: Text(
  //                 "Buy Now",
  //                 style: (currentIndex == 1)
  //                     ? TextStyle(
  //                         color: Colors.white, fontWeight: FontWeight.bold)
  //                     : TextStyle(
  //                         color: Colors.black, fontWeight: FontWeight.bold),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  //
  // void _onPlaceBidButtonPress() {
  //   _pageController.animateToPage(0,
  //       duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  // }
  //
  // void _onBuyNowButtonPress() {
  //   _pageController.animateToPage(1,
  //       duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  // }
}

// Padding(
// padding:  EdgeInsets.symmetric(horizontal: 26.w,vertical: 20.h),
// child: Column(
// children: [
// Row(
// children: [
// Text('Your Station'),
// Spacer(),
// Text('Change Station'),
// ],
// ),
// StationCard(),
// Row(
// children: [
// SmallCard(icon: 'assets/images/call.svg',label: 'Ask Expert',),
// 28.horizontalSpace,
// SmallCard(icon: 'assets/images/direction.svg',label: 'Kyc Verification',),
//
// ],
// )
//
//
// ],
// ),
// )
