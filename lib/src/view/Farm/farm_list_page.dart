import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kisaan_station/src/app/router/router.gr.dart';
import 'package:kisaan_station/src/constants/colors.dart';
import 'package:kisaan_station/src/model/farm/farm_entity.dart';
import 'package:kisaan_station/src/util/services/shared_preferences.dart';
import 'package:kisaan_station/src/view/Farm/widget/farm_tile.dart';

import '../../../global_providers.dart';
import '../../util/search_bar.dart';
import '../widget/dialogs/farm_location_dailog.dart';

@RoutePage()
class FarmListPage extends ConsumerStatefulWidget {
  const FarmListPage({Key? key}) : super(key: key);

  @override
  ConsumerState<FarmListPage> createState() => _FarmPageState();
}

class _FarmPageState extends ConsumerState<FarmListPage> {
  List<FarmEntity> farmList = [];

  @override
  void initState() {
    ref.read(farmListProvider(UserPreferences.mobileNo));
    farmList = farmList;
    super.initState();
  }
  bool newFarmClicked = false;

  final TextEditingController _farmsearchTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final res = ref.watch(farmListProvider(UserPreferences.mobileNo));
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: ElevatedButton(
          onPressed: () async {
            context.router.push(AddFarmRoute());
          },
          style: ElevatedButton.styleFrom(elevation: 3),
          child: !newFarmClicked
              ? const Text(
                  'Add new farm',
                  style: TextStyle(color: Colors.white),
                )
              : CupertinoActivityIndicator(
                  color: Theme.of(context).colorScheme.background),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            ref.read(farmListProvider(UserPreferences.mobileNo)).initState();
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
                              farmsearchController: _farmsearchTextEditingController),
                        ],
                      ),
                    ),
            ],
          ),
        ));
  }
}

class NoFarmWidget extends StatelessWidget {
  const NoFarmWidget({super.key, required this.farmsearchController});

  final TextEditingController farmsearchController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          children: [
            130.verticalSpace,
            Column(
              children: [
                Center(
                  child: SvgPicture.asset('assets/images/nofarm.svg'),
                ),
                35.verticalSpace,
                Text(
                  'No farm added',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: grey),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
