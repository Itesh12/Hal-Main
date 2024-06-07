import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kisaan_station/src/view/market/my_product_list_page.dart';

import '../../../../global_providers.dart';
import '../../../util/services/shared_preferences.dart';

@RoutePage()
class MyProductListDrawerPage extends ConsumerStatefulWidget {
  const MyProductListDrawerPage({Key? key}) : super(key: key);

  @override
  _MyProductListDrawerPageState createState() =>
      _MyProductListDrawerPageState();
}

class _MyProductListDrawerPageState
    extends ConsumerState<MyProductListDrawerPage> {
  @override
  Widget build(BuildContext context) {
    final _myProducttListController =
        ref.watch(getMyProductProvider(UserPreferences.userId));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
            )),
      ),
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                child: Container(),
              ),
            )
          ];
        },
        body: Builder(builder: (context) {
          return RefreshIndicator(
            onRefresh: () => Future.sync(
              () => _myProducttListController.refresh(context),
            ),
            child: CustomScrollView(
              slivers: [
                // SliverOverlapInjector(
                //   // This is the flip side of the SliverOverlapAbsorber
                //   // above.
                //   handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                //       context),
                // ),
                MyProductListPage(
                  userId: UserPreferences.userId,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
