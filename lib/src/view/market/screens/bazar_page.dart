import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kisaan_station/src/app/router/router.gr.dart';
import 'package:kisaan_station/src/constants/colors.dart';

import '../../../../global_providers.dart';
import '../../../util/bottomsheet/bottom_sheet.dart';
import 'all_bazar.dart';
import 'buy_bazar.dart';
import 'rent_bazar.dart';

@RoutePage()
class BazarPage extends ConsumerStatefulWidget {
  const BazarPage({Key? key}) : super(key: key);

  @override
  _BazarPageState createState() => _BazarPageState();
}

class _BazarPageState extends ConsumerState<BazarPage>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  ScrollController bazaarScrollController = ScrollController();
  TextEditingController searchController = TextEditingController();
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 4,
      animationDuration: const Duration(milliseconds: 400),
      vsync: this,
    );
    super.initState();
  }

  List<Widget> tabs() {
    final List<Widget> list = [
      Tab(
          child: Container(
        height: 40,
        width: 110,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                topLeft: Radius.circular(20)),
            color: Color(0xffF0F0F0)),
        child: Container(
          height: 40,
          width: 110,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: currentIndex == 0 ? primary : Colors.transparent),
          child: Center(
            child: Text(
              "All",
              style: TextStyle(
                  fontSize: 14,
                  color: currentIndex == 0 ? Colors.white : Colors.black,
                  fontWeight:
                      currentIndex == 0 ? FontWeight.w600 : FontWeight.w400,
                  fontFamily: 'Poppins'),
            ),
          ),
        ),
      )),
      Tab(
          child: Container(
        height: 40,
        width: 110,
        decoration: const BoxDecoration(color: Color(0xffF0F0F0)),
        child: Container(
          height: 40,
          width: 110,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: currentIndex == 1 ? primary : Colors.transparent),
          child: Center(
            child: Text(
              "Buy",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  color: currentIndex == 1 ? Colors.white : Colors.black,
                  fontWeight:
                      currentIndex == 1 ? FontWeight.w600 : FontWeight.w400,
                  fontFamily: 'Poppins'),
            ),
          ),
        ),
      )),
      Tab(
          child: Container(
        height: 40,
        width: 110,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            color: Color(0xffF0F0F0)),
        child: Container(
          height: 40,
          width: 110,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: currentIndex == 2 ? primary : Colors.transparent),
          child: Center(
            child: Text(
              "Rent",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  color: currentIndex == 2 ? Colors.white : Colors.black,
                  fontWeight:
                      currentIndex == 2 ? FontWeight.w600 : FontWeight.w400,
                  fontFamily: 'Poppins'),
            ),
          ),
        ),
      )),
    ];
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        DefaultTabController(
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
                    expandedHeight: 50.h,
                    forceElevated: innerBoxIsScrolled,
                    bottom: TabBar(
                      padding: EdgeInsets.symmetric(horizontal: 50.w),
                      labelPadding: EdgeInsets.zero,
                      tabs: tabs(),
                      onTap: (val) {
                        currentIndex = val;
                        setState(() {});
                      },
                    )),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20),
                    child: Hero(
                      tag: 'bazar',
                      child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              context.router.push(const BazarSearchRoute());
                            },
                            child: Container(
                              height: 47.h,
                              width: 400,
                              decoration: BoxDecoration(
                                color: white,
                                border: Border.all(
                                  color: const Color(0x4FD9D9D9),
                                ),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 0, 12, 0),
                                    child: SvgPicture.asset(
                                        "assets/images/search.svg"),
                                  ),
                                  Expanded(
                                      child: Text(
                                    'Search product here..',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: const Color(0x5F563F1F),
                                    ),
                                  )),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(right: 14),
                                  //   child: SvgPicture.asset("assets/images/mic.svg"),
                                  // ),
                                ],
                              ),
                            ),
                          )),
                    ),
                  ),
                )
              ];
            },
            body: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
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
                  Builder(builder: (context) {
                    return RefreshIndicator(
                      onRefresh: () => Future.sync(
                        () => ref
                            .read(bazarAllProductListProvider)
                            .refresh(context),
                      ),
                      child: const CustomScrollView(
                        slivers: [
                          // SliverOverlapInjector(
                          //   // This is the flip side of the SliverOverlapAbsorber
                          //   // above.
                          //   handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          //       context),
                          //  ),
                          SliverToBoxAdapter(),
                          AllBazarPage(),
                        ],
                      ),
                    );
                  }),
                  Builder(builder: (context) {
                    return RefreshIndicator(
                      onRefresh: () => Future.sync(
                        () => ref
                            .read(bazarSellProductListProvider)
                            .refresh(context),
                      ),
                      child: const CustomScrollView(
                        slivers: [
                          // SliverOverlapInjector(
                          //   // This is the flip side of the SliverOverlapAbsorber
                          //   // above.
                          //   handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          //       context),
                          // ),
                          SliverToBoxAdapter(),
                          BuyBazarPage(),
                        ],
                      ),
                    );
                  }),
                  Builder(builder: (context) {
                    return RefreshIndicator(
                      onRefresh: () => Future.sync(
                        () => ref
                            .read(bazarRentProductListProvider)
                            .refresh(context),
                      ),
                      child: const CustomScrollView(
                        slivers: [
                          // SliverOverlapInjector(
                          //   // This is the flip side of the SliverOverlapAbsorber
                          //   // above.
                          //   handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          //       context),
                          // ),
                          SliverToBoxAdapter(),
                          RentBazarPage(),
                        ],
                      ),
                    );
                  }),
                ]),
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            buildShowModalBottomSheet(
                context,
                (controller) => Padding(
                      padding:
                          EdgeInsets.only(left: 29.w, bottom: 26.h, top: 24.h),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              context.router.popAndPush(
                                  const SelectSellingProductRoute());
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/editSquare.svg',
                                  height: 20.h,
                                ),
                                10.horizontalSpace,
                                const Text(
                                  'Sell Product',
                                  // style: textTheme
                                  //     .titleSmall!
                                  //     .copyWith(
                                  //     color:
                                  //     primary),
                                )
                              ],
                            ),
                          ),
                          6.verticalSpace,
                          const Divider(),
                          6.verticalSpace,
                          InkWell(
                            onTap: () {
                              context.router.popAndPush(
                                  const SelectRentingProductRoute());
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/editSquare.svg',
                                  height: 20.h,
                                ),
                                10.horizontalSpace,
                                const Text(
                                  'Rent Product',
                                  // style: textTheme
                                  //     .titleSmall!
                                  //     .copyWith(
                                  //     color:
                                  //     primary),
                                ),
                              ],
                            ),
                          ),
                          6.verticalSpace,
                          const Divider(),
                        ],
                      ),
                    ),
                initialHeight: 0.23);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xffE26B26)),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                Text(
                  " Sell",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Poppins",
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
