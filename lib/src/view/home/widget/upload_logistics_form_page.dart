import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kisaan_station/global_providers.dart';
import 'package:kisaan_station/src/constants/page_padding.dart';
import 'package:kisaan_station/src/view/home/widget/transport_widgets/address_details.dart';
import 'package:kisaan_station/src/view/home/widget/transport_widgets/owner_driver_details.dart';

import '../../../constants/colors.dart';
import 'transport_widgets/business_details.dart';
import 'transport_widgets/district_center.dart';
import 'transport_widgets/kyc_details.dart';
import 'transport_widgets/vehicle_details.dart';




@RoutePage()
class UploadLogisticsFormPage extends ConsumerStatefulWidget {
  const UploadLogisticsFormPage({super.key});

  @override
  ConsumerState<UploadLogisticsFormPage> createState() =>
      _UploadTransportFormPageState();
}

class _UploadTransportFormPageState extends ConsumerState<UploadLogisticsFormPage> {


  List<String> multiStep = [
    'basic_detail',
    'address_details',
    'vehicle_details',
    'kyc_details',
  ];



  PageController pageController = PageController();

  List<bool> visitedIndex = [true,false,false,false];

  List<Widget> formChildrens = const [
    DriverDetails(),
    AddressDetails(),
    VehicleDetails(),
    KycDetails()
  ];

  @override
  Widget build(BuildContext context) {

    final currentIndex = ref.watch(currentIndexProvider);
    if(currentIndex == 0){
      setState(() {
        visitedIndex = [true,false,false,false];
      });
    }
    else if(currentIndex == 1){
      setState(() {
        visitedIndex = [true,true,false,false];
      });
    }
    else if(currentIndex == 2){
      setState(() {
        visitedIndex = [true,true,true,false];
      });
    }
    else{
      setState(() {
        visitedIndex = [true,true,true,true];
      });
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
            )),
        centerTitle: true,
        title: Text(
          "Logistics",
          style: TextStyle(
            fontSize: 20.sp,
            color: primary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
          padding: pagePadding,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (int i=0; i<4; i++)
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: visitedIndex[i]
                                ? lightOrange
                                : Colors.grey.shade100,
                            child: SvgPicture.asset(
                              'assets/images/${multiStep[i]}.svg',
                              color: visitedIndex[i]
                                  ? mediumOrange
                                  : grey,
                            ),
                          ),
                          if (multiStep.last != multiStep[i])
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.w),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: visitedIndex[i] ? mediumOrange : Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                height: 3.h,
                                width: MediaQuery.of(context).size.width * 0.11,
                              ),
                            )
                        ],
                      )
                  ],
                ),
              ),
              10.verticalSpace,
              Expanded(
                child: formChildrens[currentIndex],
              ),
            ],
          )),
    );
  }
}




class CustomGridView<T> extends StatelessWidget {
  final List<T> items;
  final int itemsPerRow;
  final IndexedWidgetBuilder itemBuilder;
  final double mainAxisSpacing;
  final double crossAxisSpacing;

  const CustomGridView({
    required this.items,
    required this.itemBuilder,
    this.itemsPerRow = 2,
    this.mainAxisSpacing = 20,
    this.crossAxisSpacing = 20,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: (items.length / itemsPerRow).ceil(),
      itemBuilder: (context, rowIndex) {
        final int startIndex = rowIndex * itemsPerRow;
        int endIndex = startIndex + itemsPerRow;
        if (endIndex > items.length) {
          endIndex = items.length;
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(itemsPerRow, (colIndex) {
            final int itemIndex = startIndex + colIndex;
            if (itemIndex < endIndex) {
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: colIndex == 0 ? 0 : crossAxisSpacing / 2,
                    right:
                        colIndex == itemsPerRow - 1 ? 0 : crossAxisSpacing / 2,
                  ),
                  child: itemBuilder(context, itemIndex),
                ),
              );
            } else {
              return Expanded(child: Container());
            }
          }),
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: mainAxisSpacing),
    );
  }
}














