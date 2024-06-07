import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/app/router/router.gr.dart';

import '../../../constants/page_padding.dart';
import '../widgets/big_card.dart';

class MyStationServicesPage extends StatefulWidget {
  const MyStationServicesPage({Key? key}) : super(key: key);

  @override
  _MyStationServicesPageState createState() => _MyStationServicesPageState();
}

class _MyStationServicesPageState extends State<MyStationServicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: pagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.verticalSpace,
              Text(
                'Select Services',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  MyStationBigCard(
                    height: 172.h,
                    width: 153.w,
                    topColor: const Color(0xffE77D40),
                    bottomColor: const Color(0xffE26B26),
                    image: 'assets/images/drone_spraying.svg',
                    label: 'Drone Spraying',
                    ontap: () {
                      context.router.push(const DroneSprayingRoute());
                    },
                  ),
                  MyStationBigCard(
                    ontap: (){
                      // context.router.push(const LogisticsServiceRoute());
                    },
                    height: 172.h,
                    width: 153.w,
                    topColor: const Color(0xffFDAD3B),
                    bottomColor: const Color(0xffFAA326),
                    image: 'assets/images/transportaion.svg',
                    label: 'Logistics',
                  ),
                ],
              ),
              Row(
                children: [
                  MyStationBigCard(
                    height: 172.h,
                    width: 153.w,
                    topColor: const Color(0xffFDAD3B),
                    bottomColor: const Color(0xffFAA326),
                    image: 'assets/images/manpower.svg',
                    label: 'Manpower',
                  ),
                  MyStationBigCard(
                    height: 172.h,
                    width: 153.w,
                    topColor: const Color(0xffE77D40),
                    bottomColor: const Color(0xffE26B26),
                    image: 'assets/images/storage.svg',
                    label: 'Storage',
                  ),
                ],
              ),
              Row(
                children: [
                  MyStationBigCard(
                    height: 172.h,
                    width: 153.w,
                    topColor: const Color(0xffE77D40),
                    bottomColor: const Color(0xffE26B26),
                    image: 'assets/images/soilTesting.svg',
                    label: 'Soil Testing',
                  ),
                  MyStationBigCard(
                    height: 172.h,
                    width: 153.w,
                    topColor: const Color(0xffFDAD3B),
                    bottomColor: const Color(0xffFAA326),
                    image: 'assets/images/on-demand.svg',
                    label: 'On Demand',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
