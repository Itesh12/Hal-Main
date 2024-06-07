import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/app/router/router.gr.dart';
import 'package:kisaan_station/src/constants/colors.dart';
import 'package:kisaan_station/src/constants/page_padding.dart';
import 'package:kisaan_station/src/view/Farm/widget/basic_detail_widget.dart';
import 'package:kisaan_station/src/view/Farm/widget/crop_detail_widget.dart';
import 'package:kisaan_station/src/view/Farm/widget/crop_object.dart';
import 'package:kisaan_station/src/view/Farm/widget/farm_detail_widget.dart';

import '../../controller/drawer/station_partner_controller.dart';
import '../../model/drawer/station_partner_form_model.dart';
import '../../model/farm/farm_entity.dart';

@RoutePage()
class FarmPage extends StatefulWidget {
  const FarmPage({super.key, required this.farm});

  final FarmEntity farm;
  @override
  State<FarmPage> createState() => _FarmPageState();
}

class _FarmPageState extends State<FarmPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Farm',
          style: TextStyle(
              color: primary, fontSize: 20.sp, fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: (){
            context.router.pop();
          },
        ),
        actions: [
         Consumer(builder: (context,ref,child){
           return PopupMenuButton(
               iconColor: Colors.black,
               itemBuilder: (context) {
                 return [
                   PopupMenuItem(
                       onTap: (){
                         final address =  StationPartnerAddressModel(
                             type: "Point",
                             coordinates: widget.farm.farmDetails.location.coordinates,
                             address: widget.farm.farmDetails.address,
                             state: widget.farm.farmDetails.state,
                             pinCode: widget.farm.farmDetails.pincode.toString());

                         ref.read(areaValidateProvider).setTotalArea(widget.farm.farmDetails.farmArea.toString());
                         ref.read(stationPartnerAddressProvider.notifier).state = jsonEncode(address);

                         if(widget.farm.userId != ""){
                           context.router.push(EditFarmRoute(farmEntity: widget.farm, isOthers: false));
                         }
                         else{
                           context.router.push(EditFarmRoute(farmEntity: widget.farm, isOthers: true));
                         }
                       },
                       child: Text("Edit",style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                       )),
                 ];
               });
         })
        ],
      ),
      body: Padding(
        padding: pagePadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: BasicDetailWidget(widget: widget),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: FarmDetailsWidget(widget: widget),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: CropDetailWidget(widget: widget),
              ),
          
              20.verticalSpace,
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.stretch,
              //   children: [
              //     ElevatedButton(onPressed: (){
              //
              //
              //     }, child: const Text('View All Reports')),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}



