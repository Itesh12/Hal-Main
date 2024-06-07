import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kisaan_station/global_providers.dart';

import '../../l10n/l10n.dart';

class SellerBottomNavigationBar extends ConsumerWidget {
  const SellerBottomNavigationBar({Key? key, required this.tabsRouter})
      : super(key: key);

  final TabsRouter tabsRouter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: tabsRouter.activeIndex,
      onTap: (index) {
        // This line of code was the bug which was causing the home page not //
        //holding the scrolling postion//

        // tabsRouter.setActiveIndex(index);
        final secondTap = index == tabsRouter.activeIndex;
        if (secondTap) {
          ref.read(postListProvider.notifier).scrollToTop();
        } else {
          tabsRouter.setActiveIndex(index);
        }
      },
      selectedFontSize: 10.sp,
      unselectedFontSize: 10.sp,
      items: [
        buildBottomItem(
            icon: "home",
            iconHeight: 23.w,
            label: AppLocalizations.of(context)!.home),
        buildBottomItem(
            icon: "listing",
            iconHeight: 23.w,
            // activeIcon :"listing_filled",
            label: AppLocalizations.of(context)!.listing),

        buildBottomItem(icon: "sell", iconHeight: 38, label: ""),

        //  buildBottomItem(
        //     icon: "sell",
        //     // activeIcon :"listing_filled",
        //     label: ''
        //   ),

        //   BottomNavigationBarItem(

        //   icon:
        //     SvgPicture.asset(
        //     "assets/images/sell.svg",
        //     iconHeight: 38.w,
        //   ),
        //   activeIcon: SvgPicture.asset(
        //     "assets/images/sell_filled.svg",
        //     iconHeight: 38.w,
        //   ),

        //   label: " ",
        // ),

        buildBottomItem(
            icon: "order_1",
            iconHeight: 23.w,
            label: AppLocalizations.of(context)!.order),
        buildBottomItem(
            icon: "profile1",
            iconHeight: 23.w,
            label: AppLocalizations.of(context)!.account),
      ],
    );
  }

  BottomNavigationBarItem buildBottomItem({
    required String icon,
    required String label,
    required double iconHeight,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        "assets/images/$icon.svg",
        height: iconHeight,
      ),
      activeIcon: SvgPicture.asset(
        "assets/images/${icon}_filled.svg",
        height: iconHeight,
      ),
      label: label,
    );
  }
}
