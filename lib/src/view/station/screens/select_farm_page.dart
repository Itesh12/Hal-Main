import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/app/router/router.gr.dart';
import 'package:kisaan_station/src/constants/colors.dart';

import '../../../../global_providers.dart';
import '../../../controller/farm/farm_list_controller.dart';
import '../../../util/services/shared_preferences.dart';
import '../../Farm/widget/farm_tile.dart';

@RoutePage()
class SelectFarmPage extends ConsumerStatefulWidget {
  const SelectFarmPage({super.key});

  @override
  ConsumerState<SelectFarmPage> createState() => _SelectFarmPageState();
}

class _SelectFarmPageState extends ConsumerState<SelectFarmPage> {

  int _selectedIndex = 0;
  bool showLoading = false;
  @override
  Widget build(BuildContext context) {
    final farmListController = ref.watch(farmListProvider(UserPreferences.mobileNo));
    final farmsList = farmListController.farmsList;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.router.push(AddFarmRoute());
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              context.router.pop();
            },
          ),
          title: Text(
            'Select Farm',
            style: TextStyle(
                color: primary, fontSize: 20.sp, fontWeight: FontWeight.w500),
          ),
        ),
        body: RefreshIndicator(
            onRefresh: () async {
              ref.watch(farmListProvider(UserPreferences.mobileNo));
            },
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: farmListController.controller,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Container(
                          color: _selectedIndex == index
                              ? const Color(0xffFFF8e8)
                              : Colors.transparent,
                          child: Row(
                            children: [
                              Radio(
                                  value: index,
                                  groupValue: _selectedIndex,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedIndex = value!;
                                    });
                                  }),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selectedIndex = index;
                                    });
                                  },
                                  child: FarmTile(
                                    farm: farmsList[index],
                                    selectedColor: index == _selectedIndex,
                                    onTapDisabled: false,
                                  ),
                                ),
                              ),
                              10.horizontalSpace,
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: farmsList.length,
                  ),
                ),
                10.verticalSpace,
                ElevatedButton(
                    onPressed: () {
                      ref.read(farmEntityProvider.notifier).state =
                          farmsList[_selectedIndex];
                      context.router.pop();
                    },
                    child: const Text('Continue')),
                10.verticalSpace
              ],
            )
        ));
  }
}
