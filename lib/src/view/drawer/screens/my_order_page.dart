import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/constants/page_padding.dart';

import '../../../constants/colors.dart';
import '../../../l10n/l10n.dart';
import '../../widget/coming_soon.dart';
import 'my_products_order_page.dart';

@RoutePage()
class MyOrderPage extends StatefulWidget {
  const MyOrderPage({Key? key}) : super(key: key);

  @override
  _MyOrderPageState createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  int currentIndex = 0;
  ScrollController bazaarScrollController = ScrollController();
  TextEditingController searchController = TextEditingController();

  List<Widget> tabs() {
    final List<Widget> list = [
      Tab(
          child: Center(
        child: Text(
          "Services",
          style: TextStyle(
              fontSize: 16.sp,
              color: currentIndex == 0 ? primary : const Color(0xff636363),
              fontWeight: currentIndex == 0 ? FontWeight.w500 : FontWeight.w400,
              fontFamily: 'Poppins'),
        ),
      )),
      Tab(
          child: Center(
        child: Text(
          "Products",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16.sp,
              color: currentIndex == 1 ? primary : Colors.black,
              fontWeight: currentIndex == 1 ? FontWeight.w500 : FontWeight.w400,
              fontFamily: 'Poppins'),
        ),
      )),
    ];
    return list;
  }

  @override
  Widget build(BuildContext context) {
    const textTheme = TextTheme();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
            )),
        backgroundColor: Colors.white,
        // foregroundColor: onHome ? white : brown,
        // ignore: avoid_bool_literals_in_conditional_expressions
        centerTitle: false,
        title: Text(
          AppLocalizations.of(context)!.my_orders,
          style: TextStyle(
            fontSize: 20.sp,
            color: primary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: pagePadding,
        child: DefaultTabController(
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
                      padding: EdgeInsets.zero,
                      labelPadding: EdgeInsets.zero,
                      tabs: tabs(),
                      onTap: (val) {
                        currentIndex = val;
                        setState(() {});
                      },
                      indicatorColor: primary,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: const UnderlineTabIndicator(
                        borderSide: BorderSide(color: primary, width: 2),
                      )),
                ),
              ];
            },
            body: const TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  MyOrderProductsPage(),
                  ComingSoon(),
                ]),
          ),
        ),
      ),
    );
  }
}
