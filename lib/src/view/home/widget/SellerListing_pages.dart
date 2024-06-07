import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/global_providers.dart';
import 'package:kisaan_station/src/constants/colors.dart';
import 'package:kisaan_station/src/util/services/shared_preferences.dart';
import 'package:kisaan_station/src/view/home/widget/name_widget.dart';

import '../../../app/router/router.gr.dart';
import '../../widget/coming_soon.dart';
import '../../widget/no_item_widget.dart';

@RoutePage()
class SellerListingPage extends ConsumerStatefulWidget {
  const SellerListingPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SellerListingPageState();
}

class _SellerListingPageState extends ConsumerState<SellerListingPage> {
  int currentIndex = 0;
  ScrollController bazaarScrollController = ScrollController();
  TextEditingController searchController = TextEditingController();

  final PageController _pageController = PageController();

  List<Widget> tabs() {
    final List<Widget> list = [
      Tab(
        icon: Container(
          height: 45,
          width: 180,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  topLeft: Radius.circular(30)),
              color: Color(0xffF0F0F0)),
          child: Container(
            height: 45,
            width: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
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
        iconMargin: EdgeInsets.only(left: 30.w),
        child: const SizedBox(),
      ),
      Tab(
          iconMargin: EdgeInsets.only(right: 30.w),
          icon: Container(
            height: 45,
            width: 190,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                color: Color(0xffF0F0F0)),
            child: Container(
              height: 45,
              width: 190,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
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
    final _myListingController = ref.watch(sellerListingProvider(userId));
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
                padding: const EdgeInsets.symmetric(horizontal: 5),
                labelPadding: EdgeInsets.zero,
                tabs: tabs(),
                onTap: (val) {
                  currentIndex = val;
                  ref.refresh(sellerListingProvider(userId));
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
        body: TabBarView(physics: const NeverScrollableScrollPhysics(), children: [
          Builder(builder: (context) {
            return RefreshIndicator(
                onRefresh: () => Future.sync(
                      () => _myListingController.refresh(context),
                    ),
                child: const ServicesListingPage());
          }),
          const ComingSoon(),
        ]),
      ),
    );
  }
}

class ServicesListingPage extends ConsumerStatefulWidget {
  const ServicesListingPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ServicesListingPageState();
}

// String sellerId = "63943688d7dc0fe77f712dff";
String userId = UserPreferences.userId;

class _ServicesListingPageState extends ConsumerState<ServicesListingPage> {
  @override
  Widget build(BuildContext context) {
    final _myListingController = ref.watch(sellerListingProvider(userId));
    final listings = _myListingController.listing;
    return _myListingController.listing.isEmpty
        ? SizedBox(
            child: Column(
              children: [
                150.verticalSpace,
                const NoorderWidget(
                  icon: "listing",
                  title: "No Listing Yet",
                  subTitle: "You have not received any order yet.",
                ),
                Center(
                    child: SizedBox(
                  height: 39,
                  width: 145,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                            side: const BorderSide(
                                color: Color(0xffe26b26))),
                        // background
                      ),
                      onPressed: () {
                        context.router.push(const UploadDroneSprayFormRoute());
                      },
                      child: const Text('Create listing',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xffe26b26),
                              fontWeight: FontWeight.w500))),
                )),
              ],
            ),
          )
        : _myListingController.isFirstError
            ? Container(
                padding: const EdgeInsets.only(top: 30, bottom: 40),
                color: Colors.white,
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: Text(
                          _myListingController.firstErrorMessage,
                          style: const TextStyle(color: redError),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (_myListingController.firstErrorMessage !=
                              "Session Expired...") {
                            _myListingController.refresh(context);
                          } else {}
                        },
                        child: Text(_myListingController.firstErrorMessage ==
                                "Session Expired..."
                            ? "SignIn Again"
                            : "Retry"),
                      )
                    ],
                  ),
                ),
              )
            : listings.isNotEmpty
                ? ListView.builder(
                    itemBuilder: (context, index) {
                      if (index == listings.length) {
                        if (_myListingController.isLoadMoreRunning) {
                          return const Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 40),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        } else if (_myListingController.isLoadMoreError) {
                          return Container(
                            padding: const EdgeInsets.only(top: 30, bottom: 40),
                            color: Colors.white,
                            child: Center(
                              child: Text(
                                _myListingController.loadMoreErrorMessage,
                                style: const TextStyle(color: redError),
                              ),
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
                      } else {
                        return ListingCard(
                          sellerMylistingModel: listings[index],
                        );
                      }
                    },
                    itemCount: listings.length,
                  )
                : const SizedBox(
                    height: 400,
                    child: NoorderWidget(
                      icon: "listing",
                      title: "No Listing Yet",
                      subTitle: "You have not received any order yet.",
                    ),
                  );
  }
}
