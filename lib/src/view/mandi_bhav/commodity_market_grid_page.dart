import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisaan_station/global_providers.dart';

import '../market/widgets/widgets.dart';

@RoutePage()
class CommodityMarketViewPage extends ConsumerStatefulWidget {
  const CommodityMarketViewPage({
    Key? key,
    required this.market,
  }) : super(key: key);

  final String market;

  @override
  _CommodityPriceGridViewPageState createState() =>
      _CommodityPriceGridViewPageState();
}

class _CommodityPriceGridViewPageState
    extends ConsumerState<CommodityMarketViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios_new,
              )),
        ),
        body: Consumer(builder: (context, ref, child) {

          final res = ref.watch(mandiBhavProviderbyMarket(widget.market));

        return  res.when(data: (data)=> SingleChildScrollView(
            child: GridView.builder(
                gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio:0.9,
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 15.0),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data.records.length,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemBuilder: (BuildContext ctx, index) {
                  return RateCard(
                    name: data.records[index].commodity,
                    image:
                    'https://cdn.pixabay.com/photo/2014/08/06/20/32/potatoes-411975__480.jpg',
                    highest: '${data.records[index].max_price}Rs/q',
                    lowest: '${data.records[index].min_price}Rs/q',
                  );
                }),
          ), error: (e,st)=>Text(e.toString()), loading: ()=>const LinearProgressIndicator());

        }));
  }
}
