
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kisaan_station/src/infrastructure/http/app_exception.dart';
import 'package:kisaan_station/src/model/farm/farm_entity.dart';
import 'package:kisaan_station/src/view/widget/snackbar.dart';

import '../../../../global_providers.dart';
import '../../../app/router/router.gr.dart';
import '../../../constants/colors.dart';
import '../farm_page.dart';


class CropDetailWidget extends StatelessWidget {
  const CropDetailWidget({
    super.key,
    required this.widget,
  });

  final FarmPage widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        10.verticalSpace,
        Text(
          'Crop Details',
          style: TextStyle(
              color: primary, fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        5.verticalSpace,
        ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context,index){
            return CropElement(cropDetails: widget.farm.cropDetails[index]);
          },
          itemCount: widget.farm.cropDetails.length,
          separatorBuilder: (context,index) => SizedBox(height: 20.h,),
        )
      ],
    );
  }
}

class CropElement extends StatelessWidget {
  const CropElement({
    super.key,
    required this.cropDetails,
  });

  final CropDetail cropDetails;

  @override
  Widget build(BuildContext context) {
    final period =
        DateTime.now().toUtc().difference(cropDetails.sowingDate!.toUtc()).inDays;
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 3,
                spreadRadius: 2
            )
          ]
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: 120.w,
                  child: Text('Crop Name',style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp,) ,)),
              Expanded(child: Text(":  ${cropDetails.nameOfCrop}")),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: 120.w,
                  child: Text('Sowing Duration',style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp,) ,)),
              Expanded(child: Text(":  $period days")),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: 120.w,
                  child: Text('Crop Area',style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp,) ,)),
              Expanded(child: Text(":  ${cropDetails.cropArea} ${cropDetails.cropAreaUnit}")),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: 120.w,
                  child: Text('Crop Report Status',style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp,) ,)),
              Expanded(child: Text(":  ${cropDetails.cropReportStatus}")),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: 120.w,
                  child: Text('Description',style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp,) ,)),
              Expanded(child: Text(":  ${cropDetails.cropDescription}")),
            ],
          ),
          if(cropDetails.cropReportStatus == "Not Requested")
            Consumer(builder: (context,ref,child){
              return  Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  10.verticalSpace,
                  SizedBox(
                      height: 30.h,
                      child: ElevatedButton(
                          onPressed: () async{
                            try{
                              await ref
                                  .read(farmRepoProvider)
                                  .requestCropReport(cropDetails.id!,context);
                            } on AppException catch(e){

                              e.whenOrNull(
                                error: (){
                                  print("this");
                                },
                                errorWithMessage: (message){
                                  ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                                      backgroundColor: primary,
                                      content: Text(message)
                                  ));
                                }

                              );

                            }

                          },
                          child: const Text('Request Crop Analysis'))),
                ],
              );
            }),

          // Consumer(builder: (context,ref,child){
          //     return  Column(
          //       crossAxisAlignment: CrossAxisAlignment.stretch,
          //       children: [
          //         10.verticalSpace,
          //         SizedBox(
          //             height: 30.h,
          //             child: ElevatedButton(
          //                 onPressed: () {
          //                   context.router.push(const DiseaseDetectionRoute());
          //
          //                 },
          //                 child: const Text('Request Disease Detection'))),
          //       ],
          //     );
          //   }),

          if(cropDetails.cropReportStatus != "Not Requested" || cropDetails.cropReportStatus != "Processing")
            Consumer(builder: (context,ref,child){
              return  Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  10.verticalSpace,
                  SizedBox(
                      height: 30.h,
                      child: ElevatedButton(
                          onPressed: () {
                            context.router.push(CropReportRoute(crop: cropDetails));
                          },
                          child: const Text('View Report'))),
                ],
              );
            }),



        ],
      ),
    );
  }
}
