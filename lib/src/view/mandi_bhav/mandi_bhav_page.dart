import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kisaan_station/global_providers.dart';
import 'package:kisaan_station/src/app/router/router.gr.dart';
import 'package:kisaan_station/src/constants/page_padding.dart';
import 'package:kisaan_station/src/util/services/shared_preferences.dart';
import 'package:kisaan_station/src/view/mandi_bhav/widgets/nearby_mandi_tile.dart';

import '../../constants/colors.dart';
import '../market/widgets/widgets.dart';

@RoutePage()
class MandiBhavPage extends ConsumerStatefulWidget {
  const MandiBhavPage({Key? key}) : super(key: key);

  @override
  _MandiBhavPageState createState() => _MandiBhavPageState();
}

class _MandiBhavPageState extends ConsumerState<MandiBhavPage> {
  final TextEditingController _searchTextController = TextEditingController();
  String searchQuery = '';
  String? selectedState = '';
  Future<double>? distance;
  List<String> states = [
    'Andhra Pradesh',
    'Bihar',
    'Haryana',
    'Himachal Pradesh',
    'Jammu and Kashmir',
    'Karnataka',
    'Madhya Pradesh',
    'Maharashtra',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'West Bengal'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
            )),
        title: Text(
          'Mandi rate',
          style: TextStyle(
            fontSize: 20.sp,
            color: primary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: pagePadding,
        child: Consumer(builder: (context, ref, child) {
          final res =
              ref.watch(mandiBhavProviderbyState(UserPreferences.mandiState));
          final List<String> _nearbyMandi = [];
          List<String> _nearbyMandiNonDulicate = [];

          return res.when(
              data: (data) {
                for (final element in res.value!.records) {
                  _nearbyMandi.add(element.market.toString());
                  _nearbyMandiNonDulicate = _nearbyMandi.toSet().toList();
                }
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Select Your State',
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: primary,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/location.svg',
                            height: 17.sp,
                          ),
                          10.horizontalSpace,
                          Container(
                            child: DropdownButton<String>(
                              hint: Text(UserPreferences.mandiState),
                              items: states.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                selectedState = value;
                                setState(() {});
                                UserPreferences.setMandiState(selectedState!);
                              },
                            ),
                          ),
                        ],
                      ),
                      22.verticalSpace,
                      Row(
                        children: [
                          Text(
                            'Mandi Rates near your area',
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: brown,
                                fontWeight: FontWeight.w700),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              context.router.push(
                                  CommodityPriceGridViewRoute(data: data));
                            },
                            child: Text(
                              'See more',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: primary,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      if (data.records.isNotEmpty)
                        SizedBox(
                          height: 200,
                          // width: 125,
                          child: ListView.separated(
                            itemCount: data.records.length <= 5
                                ? data.records.length
                                : 5,
                            scrollDirection: Axis.horizontal,
                            physics: const ClampingScrollPhysics(),
                            padding: EdgeInsets.symmetric(
                              vertical: 10.h,
                            ),
                            itemBuilder: (BuildContext context, int index) =>
                                RateCard(
                              name: data.records[index].commodity,
                              image:
                                  'https://cdn.pixabay.com/photo/2014/08/06/20/32/potatoes-411975__480.jpg',
                              highest: '${data.records[index].max_price}Rs/q',
                              lowest: '${data.records[index].min_price}Rs/q',
                            ),
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                            ),
                          ),
                        )
                      else
                        const Center(
                          child: Text('No Updated data here'),
                        ),
                      Row(
                        children: [
                          Text(
                            'Near by mandi',
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: brown,
                                fontWeight: FontWeight.w500),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              context.router.push(NearByMarketListRoute(
                                  nearByMarket: _nearbyMandiNonDulicate,
                                  state: UserPreferences.mandiState));
                            },
                            child: Text(
                              'See more',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: primary,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      20.verticalSpace,
                      if (data.records.isNotEmpty)
                        ListView.separated(
                            separatorBuilder: (context, index) => const SizedBox(
                                  height: 15,
                                ),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _nearbyMandiNonDulicate.length <= 3
                                ? _nearbyMandiNonDulicate.length
                                : 3,
                            itemBuilder: (context, index) => NearByMandiTile(
                                  marketName: _nearbyMandiNonDulicate[index],
                                  state: UserPreferences.mandiState,
                                ))
                      else
                        const Center(
                          child: Text('No Updated Data here'),
                        ),
                      20.verticalSpace,
                    ],
                  ),
                );
              },
              error: (e, st) => SizedBox(
                    child: Text(e.toString()),
                  ),
              loading: () => const LinearProgressIndicator());
        }),
      ),
    );
  }
}
