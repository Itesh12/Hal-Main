import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/global_providers.dart';
import 'package:kisaan_station/src/app/router/router.gr.dart';
import 'package:kisaan_station/src/constants/colors.dart';

import '../../../util/services/shared_preferences.dart';

class NearByMandiTile extends ConsumerStatefulWidget {
  const NearByMandiTile({
    Key? key,
    required this.marketName,
    required this.state,
  }) : super(key: key);

  final String marketName;
  final String state;

  @override
  _NearByMandiTileState createState() => _NearByMandiTileState();
}

class _NearByMandiTileState extends ConsumerState<NearByMandiTile> {
  Future<double>? distance;

  // Text(
  // distance.toString(),
  // style: TextStyle(color: Color(0xff766249), fontSize: 17.sp),
  // ),

  @override
  Widget build(BuildContext context) {
    final DistanceModel distanceModel = DistanceModel(
        marketName: widget.marketName, state: UserPreferences.mandiState);
    return InkWell(
      onTap: () {
        context.router
            .push(CommodityMarketViewRoute(market: widget.marketName));
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 328.w,
        height: 100.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.r),
            border: Border.all(color: const Color(0xffEAE8E3))),
        child: Row(
          children: [
            70.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 150,
                  child: Text(
                    widget.marketName,
                    style: TextStyle(
                        color: const Color(0xff766249), fontSize: 17.sp),
                  ),
                ),

                // Text('${mandiBhav.records[index].district}, ${mandiBhav.records[index].state}',style: TextStyle(color: Color(0xffA6A4A4),fontSize: 12.sp),),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                Consumer(builder: (context, ref, child) {
                  final value =
                      ref.watch(distancebylocationProvider(distanceModel));
                  return value.when(
                    data: (dist) {
                      return Text(
                        '$dist Km',
                        style: const TextStyle(
                            fontSize: 10,
                            fontFamily: "Poppins",
                            color: primary,
                            fontWeight: FontWeight.w600),
                      );
                    },
                    error: (error, st) => const SizedBox(),
                    loading: () => const SizedBox(
                      child: Text("..."),
                    ),
                  );
                }),
                5.verticalSpace,
                const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Mandi Price',
                      style: TextStyle(
                          fontSize: 10,
                          fontFamily: "Poppins",
                          color: primary,
                          fontWeight: FontWeight.w600),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: primary,
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );

    //   Consumer(
    //   builder: (context,ref,child) {
    //     final res = ref.watch(mandiBhavProviderbyMarket());
    //   return  res.when(data: (data){
    //  ;}, error: (e,st)=>Text(e.toString()), loading: ()=>CircularProgressIndicator());
    //
    //   }
    // );
  }
}
