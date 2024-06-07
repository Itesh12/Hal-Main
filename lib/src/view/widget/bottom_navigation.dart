import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kisaan_station/global_providers.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../l10n/l10n.dart';

class KBottomNavigationBar extends ConsumerWidget {
  KBottomNavigationBar({Key? key, required this.tabsRouter}) : super(key: key);

  final TabsRouter tabsRouter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: tabsRouter.activeIndex,
      onTap: (index) async {
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
            icon: "home", label: AppLocalizations.of(context)!.home),
        buildBottomItem(
            icon: "my_station", label: AppLocalizations.of(context)!.my_center),
        // buildBottomItem(
        //     icon: "krishi_bazar",
        //     label: AppLocalizations.of(context)!.krishi_bazar),
        buildBottomItem(icon: "", label: "Hal Suvidha"),
        buildBottomItem(
            icon: "my_farm", label: AppLocalizations.of(context)!.my_farm),
        buildBottomItem(
            icon: "krishi_gyan",
            label: AppLocalizations.of(context)!.krishi_gyan),
      ],
    );
  }

  BottomNavigationBarItem buildBottomItem({
    required String icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: icon != 'suvidhaIcon'
          ? SvgPicture.asset(
              "assets/images/$icon.svg",
              height: 23.w,
            )
          : Image.asset(
              "assets/images/$icon.png",
              height: 25.w,
              // color:
              //     UserPreferences.getBottomIndexValue != 2 ? Colors.grey : null,
              // color: Colors.white,
            ),
      activeIcon: SvgPicture.asset(
        "assets/images/${icon}_filled.svg",
        height: 23.w,
      ),
      label: label,
    );
  }
}
