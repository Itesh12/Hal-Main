import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kisaan_station/src/constants/page_padding.dart';

import '../../../../global_providers.dart';
import '../../../constants/colors.dart';
import '../../../controller/station/my_station_controller.dart';
import '../../../model/station/near_by_station_list_model.dart';
import '../../../util/bottomsheet/bottom_sheet.dart';
import '../widgets/station_card.dart';

@RoutePage()
class SelectKisaanStationListPage extends ConsumerStatefulWidget {
  const SelectKisaanStationListPage({Key? key}) : super(key: key);

  @override
  _SelectKisaanStationListPageState createState() =>
      _SelectKisaanStationListPageState();
}

class _SelectKisaanStationListPageState
    extends ConsumerState<SelectKisaanStationListPage> {
  int? selectedIndex;
  List<NearByStaionListModel> nearStation = [];
  double _distance = 30.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: Text(
            'Choose Your District Center',
            style: TextStyle(
              fontSize: 20.sp,
              color: brown,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            StatefulBuilder(builder: (context, setState) {
              return InkWell(
                onTap: () async {
                  await buildShowModalBottomSheet(
                    context,
                    (controller) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: pagePadding,
                            child: Text(
                              'Filters',
                              style: TextStyle(
                                  fontSize: 24.sp,
                                  color: brown,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          15.verticalSpace,
                          Padding(
                            padding: pagePadding,
                            child: Text(
                              'Select Distance',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              9.verticalSpace,
                              Padding(
                                padding: pagePadding,
                                child: _filterWidget(context),
                              ),
                              5.verticalSpace,
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    '10 Km',
                                    style: TextStyle(color: grey),
                                  ),
                                  Text(
                                    '20 Km',
                                    style: TextStyle(color: grey),
                                  ),
                                  Text(
                                    '30 Km',
                                    style: TextStyle(color: grey),
                                  ),
                                  Text(
                                    '40 Km',
                                    style: TextStyle(color: grey),
                                  ),
                                  Text(
                                    '>50 Km',
                                    style: TextStyle(color: grey),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      );
                    },
                    initialHeight: 0.30,
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 15.w),
                  child: SvgPicture.asset('assets/images/filter.svg'),
                ),
              );
            })
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Consumer(builder: (context, ref, child) {
                final res = ref.watch(nearByStationList(_distance));
                return res.when(
                  data: (data) {
                    nearStation = data;
                    return nearStation.isNotEmpty
                        ? Padding(
                            padding: pagePadding,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: data.length,
                              itemBuilder: (context, index) => StationCard(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                location: data[index].ksLocation.address,
                                distance: data[index].distance.toString(),
                                currentIndex: index,
                                selectedIndex: selectedIndex,
                                id: data[index].ksId,
                                name: data[index].ksName,
                              ),
                            ),
                          )
                        : const Center(
                            child: Text(
                                'No Station Nearby.. Change the range to find more'),
                          );
                  },
                  error: (e, st) => Text(e.toString()),
                  loading: () => Center(child: const CircularProgressIndicator()),
                );
              }),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 20.h, top: 15.h),
              child: ElevatedButton(
                  onPressed: () {
                    if (selectedIndex != null) {
                      ref.read(selectedKisaanStationProvider.notifier).editAddress(
                          nearByStaionListModel: NearByStaionListModel(
                              ksName: nearStation[selectedIndex!].ksName,
                              ksId: nearStation[selectedIndex!].ksId,
                              distance: nearStation[selectedIndex!].distance,
                              ksLocation: nearStation[selectedIndex!].ksLocation,
                              id: nearStation[selectedIndex!].id));
                      // context.router.pop();
                      context.router.pop(nearStation[selectedIndex!].id);
                    } else {
                      context.router.pop();
                    }
                  },
                  child: const Text('Confirm')),
            ),
          ],
        ),
      ),
    );
  }

  StatefulBuilder _filterWidget(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Slider(
        min: 10.0,
        max: 50.0,
        value: _distance,
        label: _distance.toString(),
        divisions: 4,
        onChanged: (value) {
          setState(() {
            _distance = value;
            ref.watch(nearByStationList(_distance));
          });
        },
      );
    });
  }
}
