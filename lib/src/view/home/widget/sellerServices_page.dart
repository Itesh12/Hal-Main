import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/app/router/router.gr.dart';

import '../../station/widgets/big_card.dart';
// import '../widgets/big_card.dart';

@RoutePage()
class MySellerServicesPage extends StatefulWidget {
  const MySellerServicesPage({Key? key}) : super(key: key);

  @override
  _MySellerServicesPageState createState() => _MySellerServicesPageState();
}

class _MySellerServicesPageState extends State<MySellerServicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // leading: const AppDrawer(),
      //   leading: IconButton(
      //       onPressed: () => context.popRoute(context),
      //       // context.popRoute(context),
      //       icon: const Icon(
      //         Icons.arrow_back_ios_new,
      //       )),
      //   // title: Text(
      //   //   "Sell Services",
      //   //   style: TextStyle(
      //   //     fontSize: 18.sp,
      //   //     color: const Color(0xffE26B26),
      //   //     fontWeight: FontWeight.w500,
      //   //   ),
      //   // ),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 10.verticalSpace,
              const Text("Choose Service",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff563e1f))),
              20.verticalSpace,
              Row(
                children: [
                  MyStationBigCard(
                    height: 160.h,
                    width: 145.w,
                    topColor: const Color(0xffE77D40),
                    bottomColor: const Color(0xffE26B26),
                    image: 'assets/images/drone_spraying.svg',
                    label: 'Drone Spraying',
                    ontap: () {
                      context.router
                          .push(const UploadDroneSprayFormRoute())
                          .then((value) {
                        // if (value as bool? ?? false) {
                        debugPrint("value is $value");

                        if(value!=null){
                          context.tabsRouter.setActiveIndex(value as int);
                        }
                        else{
                          context.tabsRouter.setActiveIndex(0);

                        }
                        debugPrint("roted tab 1");
//
                        // }
                      });
                    },
                  ),
                  MyStationBigCard(
                    height: 160.h,
                    width: 145.w,
                    topColor: const Color(0xffFDAD3B),
                    bottomColor: const Color(0xffFAA326),
                    image: 'assets/images/transportaion.svg',
                    label: 'Logistics',
                    ontap: (){
                      // context.router.push(const UploadLogisticsFormRoute());
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  MyStationBigCard(
                    height: 160.h,
                    width: 145.w,
                    topColor: const Color(0xffFDAD3B),
                    bottomColor: const Color(0xffFAA326),
                    image: 'assets/images/manpower.svg',
                    label: 'Manpower',
                  ),
                  MyStationBigCard(
                    height: 160.h,
                    width: 145.w,
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
                    height: 160.h,
                    width: 145.w,
                    topColor: const Color(0xffE77D40),
                    bottomColor: const Color(0xffE26B26),
                    image: 'assets/images/soilTesting.svg',
                    label: 'Soil Testing',
                  ),
                  MyStationBigCard(
                    height: 160.h,
                    width: 145.w,
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
