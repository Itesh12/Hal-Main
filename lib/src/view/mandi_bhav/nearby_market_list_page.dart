import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisaan_station/src/constants/page_padding.dart';
import 'package:kisaan_station/src/view/mandi_bhav/widgets/nearby_mandi_tile.dart';

import '../../util/services/shared_preferences.dart';

@RoutePage()
class NearByMarketListPage extends ConsumerWidget {
  NearByMarketListPage(
      {Key? key, required this.nearByMarket, required this.state})
      : super(key: key);

  final List<String> nearByMarket;
  final String state;
  Future<double>? distance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
            )),
      ),
      body: Padding(
        padding: pagePadding,
        child: SingleChildScrollView(
            child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
            height: 15,
          ),
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: nearByMarket.length,
          itemBuilder: (context, index) => NearByMandiTile(
            marketName: nearByMarket[index],
            state: UserPreferences.mandiState,
          ),
        )),
      ),
    );
  }
}
