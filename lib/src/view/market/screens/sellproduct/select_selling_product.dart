import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisaan_station/src/view/market/screens/sellproduct/widget.dart';

import '../../../../../global_providers.dart';
import '../../../../app/router/router.gr.dart';
import '../../../../l10n/l10n.dart';

@RoutePage()
class SelectSellingProductPage extends ConsumerStatefulWidget {
  const SelectSellingProductPage({Key? key}) : super(key: key);

  @override
  _SelectSellingProductPageState createState() =>
      _SelectSellingProductPageState();
}

class _SelectSellingProductPageState
    extends ConsumerState<SelectSellingProductPage> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
            )),
        backgroundColor: Colors.transparent,
      ),
      body:
      ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
           Text(
             AppLocalizations.of(context)!.want_to_sell,
            style: TextStyle(
                color: Color(0xff563E1F),
                fontWeight: FontWeight.w500,
                fontSize: 18,
                fontFamily: "Poppins"),
          ),
          Consumer(builder: (context, ref, child) {
            final res = ref.watch(bazarSellCategoryRepoProvider('sell'));
            return res.when(
                data: (data) => GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 25.0,
                            mainAxisSpacing: 15.0),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    itemBuilder: (BuildContext ctx, index) {
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          setState(() {
                            currentIndex = index;
                          });
                          context.router.push(SellingItemRoute(categoryText: data[index].title??'No Category'));
                        },
                        child: SelectSellingWidget(
                          name: data[index].title ?? 'No title',
                          image: data[index].icon ?? 'no',
                          index: index,
                          currentIndex: currentIndex,
                        ),
                      );
                    }),
                error: (e, st) => Text(e.toString()),
                loading: () => const LinearProgressIndicator());
          }),
        ],
      ),
    );
  }
}
