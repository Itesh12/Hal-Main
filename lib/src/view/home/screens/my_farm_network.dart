import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/app/router/router.gr.dart';
import 'package:kisaan_station/src/constants/colors.dart';

import '../../../../global_providers.dart';
import '../../../util/services/shared_preferences.dart';
import '../../Farm/farm_list_page.dart';
import '../../Farm/widget/farm_tile.dart';



@RoutePage()
class MyFarmNetworkPage extends ConsumerStatefulWidget {
  const MyFarmNetworkPage({super.key});

  @override
  ConsumerState<MyFarmNetworkPage> createState() => _MyFarmNetworkPageState();
}

class _MyFarmNetworkPageState extends ConsumerState<MyFarmNetworkPage> {
  @override
  Widget build(BuildContext context) {
    final res = ref.watch(otherFarmListProvider(UserPreferences.sellerId));
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        onPressed: (){

          context.router.push(AddFarmRoute(isOthers: true));

        },
        child: const Text('Add Farm'),
      ),
      appBar: AppBar(
        title: Text('My Network',style: TextStyle(color: primary, fontSize: 20.sp, fontWeight: FontWeight.w500),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: (){
            context.router.pop();
          },
        )
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.read(otherFarmListProvider(UserPreferences.sellerId)).initState();
        },
        child: Column(
          children: [
            if (res.isLoadMoreRunning)
              const Center(
                child: CircularProgressIndicator(),
              )
            else
              res.farmsList.isNotEmpty
                  ? Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 20.w),
                      child: FarmTile(
                        farm: res.farmsList[index],
                      ),
                    );
                  },
                  itemCount: res.farmsList.length,
                ),
              )
                  : Expanded(
                child: ListView(
                  children: [
                    NoFarmWidget(
                        farmsearchController: TextEditingController()),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
