import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/constants/colors.dart';

import '../../../l10n/l10n.dart';
import '../widgets/latest_news.dart';
import '../widgets/news_carausal.dart';

@RoutePage()
class GyanPage extends StatelessWidget {
  const GyanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //       onPressed: () => Navigator.pop(context),
      //       icon: const Icon(
      //         Icons.arrow_back_ios_new,
      //       )),
      //   backgroundColor: Colors.white,
      //   // foregroundColor: onHome ? white : brown,
      //   // ignore: avoid_bool_literals_in_conditional_expressions
      //   centerTitle: true,
      //   title: Text(
      //     AppLocalizations.of(context)!.agri_news,
      //     style: TextStyle(
      //       fontSize: 20.sp,
      //       color: primary,
      //       fontWeight: FontWeight.w500,
      //     ),
      //   ),
      // ),
      body: Builder(builder: (context) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(
                    right: 20.w, left: 20.w, top: 30.h, bottom: 40.h),
                child: Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.top_news,
                      style: textTheme.titleMedium!
                          .copyWith(color: brown, fontWeight: FontWeight.bold),
                    ),
                    // const Spacer(),
                    // Text(
                    //   AppLocalizations.of(context)!.view_all,
                    //   style: textTheme.bodyMedium!.copyWith(color: primary),
                    // ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(child: NewsCarausal()),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(
                    right: 20.w, left: 20.w, top: 30.h, bottom: 40.h),
                child: Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.latest_news,
                      style: textTheme.titleMedium!
                          .copyWith(color: brown, fontWeight: FontWeight.bold),
                    ),
                    // const Spacer(),
                    // Text(
                    //   AppLocalizations.of(context)!.view_all,
                    //   style: textTheme.bodyMedium!.copyWith(color: primary),
                    // ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(child: LatestNews()),
          ],
        );
      }),
    );
  }

  // temporary hide gyan page for showing agri news
  // Widget build(BuildContext context) {
  //   return SingleChildScrollView(
  //       child: Column(
  //     children: [
  //       // const UnknownFactTile(),
  //       15.verticalSpace,
  //       const GyanTilesGrid(),
  //     ],
  //   ));
  // }
}
