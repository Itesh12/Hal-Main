import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisaan_station/src/model/mandiBhav/mandi_bhav_model.dart';

import '../market/widgets/widgets.dart';

@RoutePage()
class CommodityPriceGridViewPage extends ConsumerStatefulWidget {
  const CommodityPriceGridViewPage(
      {Key? key, required this.data})
      : super(key: key);

  final MandiBhavModel data;

  @override
  _CommodityPriceGridViewPageState createState() => _CommodityPriceGridViewPageState();
}

class _CommodityPriceGridViewPageState extends ConsumerState<CommodityPriceGridViewPage> {
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
      body:SingleChildScrollView(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.8,
                    crossAxisCount: 2, crossAxisSpacing: 20.0, mainAxisSpacing: 15.0),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.data.records.length,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemBuilder: (BuildContext ctx, index) {
                  return RateCard(
                    name: widget.data.records[index].commodity,
                    image:
                        'https://cdn.pixabay.com/photo/2014/08/06/20/32/potatoes-411975__480.jpg',
                    highest: '${widget.data.records[index].max_price}Rs/q',
                    lowest: '${widget.data.records[index].min_price}Rs/q',
                  );
                }),
          )


    );
  }
}
